define i64 @fast_avx2_base64_decode(i8* %out, i8* %src, i64 %srclen) {
entry:
  %out_orig = alloca i8*
  %src_ptr = alloca i8*
  %srclen_ptr = alloca i64
  store i8* %out, i8** %out_orig
  store i8* %src, i8** %src_ptr
  store i64 %srclen, i64* %srclen_ptr

  br label %while.cond

while.cond:
  %srclen_val = load i64, i64* %srclen_ptr
  %cmp = icmp uge i64 %srclen_val, 45
  br i1 %cmp, label %while.body, label %while.end

while.body:
  %src_val = load i8*, i8** %src_ptr
  %str = load <32 x i8>, <32 x i8>* %src_val

  %lut_lo = <i8 0x15, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x13, i8 0x1A, i8 0x1B, i8 0x1B, i8 0x1B, i8 0x1A, i8 0x15, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x11, i8 0x13, i8 0x1A, i8 0x1B, i8 0x1B, i8 0x1B, i8 0x1A>
  %lut_hi = <i8 0x10, i8 0x10, i8 0x01, i8 0x02, i8 0x04, i8 0x08, i8 0x04, i8 0x08, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x01, i8 0x02, i8 0x04, i8 0x08, i8 0x04, i8 0x08, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x10, i8 0x10>
  %lut_roll = <i8 0, i8 16, i8 19, i8 4, i8 -65, i8 -65, i8 -71, i8 -71, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 16, i8 19, i8 4, i8 -65, i8 -65, i8 -71, i8 -71, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>

  %mask_2F = <i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f, i8 0x2f>

  %hi_nibbles = lshr <32 x i8> %str, 4
  %lo_nibbles = and <32 x i8> %str, %mask_2F

  %lo = shufflevector <32 x i8> %lut_lo, <32 x i8> %lut_lo, %lo_nibbles
  %eq_2F = icmp eq <32 x i8> %str, %mask_2F

  %hi_nibbles = and <32 x i8> %hi_nibbles, %mask_2F
  %hi = shufflevector <32 x i8> %lut_hi, <32 x i8> %lut_hi, %hi_nibbles
  %roll = shufflevector <32 x i8> %lut_roll, <32 x i8> %lut_roll, add <32 x i8> %eq_2F, %hi_nibbles

  %test = call i1 @llvm.x86.avx2.ptestz(<32 x i8> %lo, <32 x i8> %hi)
  br i1 %test, label %while.end, label %while.body.continue

while.body.continue:
  %str = add <32 x i8> %str, %roll

  %srclen_val = sub i64 %srclen_val, 32
  store i64 %srclen_val, i64* %srclen_ptr
  %src_val = getelementptr i8, i8* %src_val, i64 32
  store i8* %src_val, i8** %src_ptr

  %reshuffled = call <8 x i32> @dec_reshuffle(<8 x i32> %str)
  %out_val = load i8*, i8** %out_orig
  store <8 x i32> %reshuffled, <8 x i32>* %out_val
  %out_val = getelementptr i8, i8* %out_val, i64 24
  store i8* %out_val, i8** %out_orig

  br label %while.cond

while.end:
  %out_val = load i8*, i8** %out_orig
  %src_val = load i8*, i8** %src_ptr
  %srclen_val = load i64, i64* %srclen_ptr

  %scalarret = call i64 @chromium_base64_decode(i8* %out_val, i8* %src_val, i64 %srclen_val)
  %cmp = icmp eq i64 %scalarret, -1
  br i1 %cmp, label %error, label %success

error:
  ret i64 -1

success:
  %out_val = load i8*, i8** %out_orig
  %result = sub i64 %out_val, %out
  %result = add i64 %result, %scalarret
  ret i64 %result
}