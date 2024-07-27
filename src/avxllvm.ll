; Function signature
define i64 @fast_avx2_base64_decode(i8* %out, i8* %src, i64 %srclen) {
entry:
  ; Define constants
  %lut_lo = constant <32 x i8> <i8 21, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 19, i8 26, i8 27, i8 27, i8 27, i8 26, i8 21, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 19, i8 26, i8 27, i8 27, i8 27, i8 26>
  %lut_hi = constant <32 x i8> <i8 16, i8 16, i8 1, i8 2, i8 4, i8 8, i8 4, i8 8, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 1, i8 2, i8 4, i8 8, i8 4, i8 8, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16>
  %lut_roll = constant <32 x i8> <i8 0, i8 16, i8 19, i8 4, i8 -65, i8 -65, i8 -71, i8 -71, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 16, i8 19, i8 4, i8 -65, i8 -65, i8 -71, i8 -71, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>
  %mask_2F = constant <32 x i8> <i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47>

  ; Initialize pointers and lengths
  %out_orig = %out
  %src_ptr = %src
  %srclen_ptr = %srclen

  ; Loop for processing input in chunks of 32 bytes
  br label %loop

loop:
  %srclen_cmp = icmp uge i64 %srclen_ptr, 45
  br i1 %srclen_cmp, label %process_chunk, label %scalar_decode

process_chunk:
  ; Load 32 bytes from src
  %str = load <32 x i8>, <32 x i8>* %src_ptr

  ; Lookup
  %hi_nibbles = lshr <32 x i8> %str, 4
  %lo_nibbles = and <32 x i8> %str, %mask_2F
  %lo = shufflevector <32 x i8> %lut_lo, <32 x i8> %lut_lo, <32 x i8> %lo_nibbles
  %eq_2F = icmp eq <32 x i8> %str, %mask_2F
  %hi_nibbles = and <32 x i8> %hi_nibbles, %mask_2F
  %hi = shufflevector <32 x i8> %lut_hi, <32 x i8> %lut_hi, <32 x i8> %hi_nibbles
  %roll = shufflevector <32 x i8> %lut_roll, <32 x i8> %lut_roll, <32 x i8> (add <32 x i8> %eq_2F, %hi_nibbles)

  ; Check for invalid input
  %testz = call i1 @llvm.x86.avx2.ptestz.256(<32 x i8> %lo, <32 x i8> %hi)
  br i1 %testz, label %valid_input, label %break_loop

valid_input:
  ; Adjust str
  %str = add <32 x i8> %str, %roll

  ; Update pointers and lengths
  %srclen_ptr = sub i64 %srclen_ptr, 32
  %src_ptr = getelementptr i8, i8* %src_ptr, i64 32

  ; Reshuffle and store
  %reshuffled_str = call <32 x i8> @dec_reshuffle(<32 x i8> %str)
  store <32 x i8> %reshuffled_str, <32 x i8>* %out
  %out = getelementptr i8, i8* %out, i64 24

  br label %loop

break_loop:
  br label %scalar_decode

scalar_decode:
  ; Call scalar decoding function
  %scalarret = call i64 @chromium_base64_decode(i8* %out, i8* %src_ptr, i64 %srclen_ptr)
  %error_check = icmp eq i64 %scalarret, -1
  br i1 %error_check, label %return_error, label %return_result

return_error:
  ret i64 -1

return_result:
  %result = sub i64 %out, %out_orig
  %final_result = add i64 %result, %scalarret
  ret i64 %final_result
}

; Declare external functions
declare i1 @llvm.x86.avx2.ptestz.256(<32 x i8>, <32 x i8>)
declare <32 x i8> @dec_reshuffle(<32 x i8>)
declare i64 @chromium_base64_decode(i8*, i8*, i64)