; ModuleID = 'src/fastavxbase64.c'
source_filename = "src/fastavxbase64.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx14.0.0"

%struct.__storeu_si256 = type { <4 x i64> }
%struct.__loadu_si256 = type { <4 x i64> }

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i64 @fast_avx2_base64_encode(i8* %0, i8* %1, i64 %2) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca <4 x i64>, align 32
  %6 = alloca <4 x i64>*, align 8
  %7 = alloca <4 x i64>, align 32
  %8 = alloca <4 x i64>*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca <8 x i32>, align 32
  %18 = alloca i64, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i64, align 8
  %22 = alloca i8*, align 8
  %23 = alloca <4 x i64>, align 32
  %24 = alloca i64, align 8
  store i8* %0, i8** %19, align 8
  store i8* %1, i8** %20, align 8
  store i64 %2, i64* %21, align 8
  %25 = load i8*, i8** %19, align 8
  store i8* %25, i8** %22, align 8
  %26 = load i64, i64* %21, align 8
  %27 = icmp uge i64 %26, 28
  br i1 %27, label %28, label %88

28:                                               ; preds = %3
  %29 = load i8*, i8** %20, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 -4
  %31 = bitcast i8* %30 to i32*
  store i32 -2147483648, i32* %9, align 4
  store i32 -2147483648, i32* %10, align 4
  store i32 -2147483648, i32* %11, align 4
  store i32 -2147483648, i32* %12, align 4
  store i32 -2147483648, i32* %13, align 4
  store i32 -2147483648, i32* %14, align 4
  store i32 -2147483648, i32* %15, align 4
  store i32 0, i32* %16, align 4
  %32 = load i32, i32* %16, align 4
  %33 = insertelement <8 x i32> undef, i32 %32, i32 0
  %34 = load i32, i32* %15, align 4
  %35 = insertelement <8 x i32> %33, i32 %34, i32 1
  %36 = load i32, i32* %14, align 4
  %37 = insertelement <8 x i32> %35, i32 %36, i32 2
  %38 = load i32, i32* %13, align 4
  %39 = insertelement <8 x i32> %37, i32 %38, i32 3
  %40 = load i32, i32* %12, align 4
  %41 = insertelement <8 x i32> %39, i32 %40, i32 4
  %42 = load i32, i32* %11, align 4
  %43 = insertelement <8 x i32> %41, i32 %42, i32 5
  %44 = load i32, i32* %10, align 4
  %45 = insertelement <8 x i32> %43, i32 %44, i32 6
  %46 = load i32, i32* %9, align 4
  %47 = insertelement <8 x i32> %45, i32 %46, i32 7
  store <8 x i32> %47, <8 x i32>* %17, align 32
  %48 = load <8 x i32>, <8 x i32>* %17, align 32
  %49 = bitcast <8 x i32> %48 to <4 x i64>
  store i32* %31, i32** %4, align 8
  store <4 x i64> %49, <4 x i64>* %5, align 32
  %50 = load i32*, i32** %4, align 8
  %51 = bitcast i32* %50 to <8 x i32>*
  %52 = bitcast <8 x i32>* %51 to i8*
  %53 = load <4 x i64>, <4 x i64>* %5, align 32
  %54 = bitcast <4 x i64> %53 to <8 x i32>
  %55 = call <8 x i32> @llvm.x86.avx2.maskload.d.256(i8* %52, <8 x i32> %54) #5
  %56 = bitcast <8 x i32> %55 to <4 x i64>
  store <4 x i64> %56, <4 x i64>* %23, align 32
  br label %57

57:                                               ; preds = %28, %86
  %58 = load <4 x i64>, <4 x i64>* %23, align 32
  %59 = call <4 x i64> @enc_reshuffle(<4 x i64> %58)
  store <4 x i64> %59, <4 x i64>* %23, align 32
  %60 = load <4 x i64>, <4 x i64>* %23, align 32
  %61 = call <4 x i64> @enc_translate(<4 x i64> %60)
  store <4 x i64> %61, <4 x i64>* %23, align 32
  %62 = load i8*, i8** %19, align 8
  %63 = bitcast i8* %62 to <4 x i64>*
  %64 = load <4 x i64>, <4 x i64>* %23, align 32
  store <4 x i64>* %63, <4 x i64>** %6, align 8
  store <4 x i64> %64, <4 x i64>* %7, align 32
  %65 = load <4 x i64>, <4 x i64>* %7, align 32
  %66 = load <4 x i64>*, <4 x i64>** %6, align 8
  %67 = bitcast <4 x i64>* %66 to %struct.__storeu_si256*
  %68 = getelementptr inbounds %struct.__storeu_si256, %struct.__storeu_si256* %67, i32 0, i32 0
  store <4 x i64> %65, <4 x i64>* %68, align 1
  %69 = load i8*, i8** %20, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 24
  store i8* %70, i8** %20, align 8
  %71 = load i8*, i8** %19, align 8
  %72 = getelementptr inbounds i8, i8* %71, i64 32
  store i8* %72, i8** %19, align 8
  %73 = load i64, i64* %21, align 8
  %74 = sub i64 %73, 24
  store i64 %74, i64* %21, align 8
  %75 = load i64, i64* %21, align 8
  %76 = icmp uge i64 %75, 32
  br i1 %76, label %77, label %85

77:                                               ; preds = %57
  %78 = load i8*, i8** %20, align 8
  %79 = getelementptr inbounds i8, i8* %78, i64 -4
  %80 = bitcast i8* %79 to <4 x i64>*
  store <4 x i64>* %80, <4 x i64>** %8, align 8
  %81 = load <4 x i64>*, <4 x i64>** %8, align 8
  %82 = bitcast <4 x i64>* %81 to %struct.__loadu_si256*
  %83 = getelementptr inbounds %struct.__loadu_si256, %struct.__loadu_si256* %82, i32 0, i32 0
  %84 = load <4 x i64>, <4 x i64>* %83, align 1
  store <4 x i64> %84, <4 x i64>* %23, align 32
  br label %86

85:                                               ; preds = %57
  br label %87

86:                                               ; preds = %77
  br label %57

87:                                               ; preds = %85
  br label %88

88:                                               ; preds = %87, %3
  %89 = load i8*, i8** %19, align 8
  %90 = load i8*, i8** %20, align 8
  %91 = load i64, i64* %21, align 8
  %92 = call i64 @chromium_base64_encode(i8* %89, i8* %90, i64 %91)
  store i64 %92, i64* %24, align 8
  %93 = load i64, i64* %24, align 8
  %94 = icmp eq i64 %93, -1
  br i1 %94, label %95, label %96

95:                                               ; preds = %88
  store i64 -1, i64* %18, align 8
  br label %104

96:                                               ; preds = %88
  %97 = load i8*, i8** %19, align 8
  %98 = load i8*, i8** %22, align 8
  %99 = ptrtoint i8* %97 to i64
  %100 = ptrtoint i8* %98 to i64
  %101 = sub i64 %99, %100
  %102 = load i64, i64* %24, align 8
  %103 = add i64 %101, %102
  store i64 %103, i64* %18, align 8
  br label %104

104:                                              ; preds = %96, %95
  %105 = load i64, i64* %18, align 8
  ret i64 %105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal <4 x i64> @enc_reshuffle(<4 x i64> %0) #0 {
  %2 = alloca <4 x i64>, align 32
  %3 = alloca <4 x i64>, align 32
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca <8 x i32>, align 32
  %13 = alloca i32, align 4
  %14 = alloca <4 x i64>, align 32
  %15 = alloca <4 x i64>, align 32
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca <8 x i32>, align 32
  %25 = alloca i32, align 4
  %26 = alloca <4 x i64>, align 32
  %27 = alloca <4 x i64>, align 32
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca <8 x i32>, align 32
  %37 = alloca i32, align 4
  %38 = alloca <4 x i64>, align 32
  %39 = alloca <4 x i64>, align 32
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca <8 x i32>, align 32
  %49 = alloca i32, align 4
  %50 = alloca <4 x i64>, align 32
  %51 = alloca <4 x i64>, align 32
  %52 = alloca <4 x i64>, align 32
  %53 = alloca <4 x i64>, align 32
  %54 = alloca i8, align 1
  %55 = alloca i8, align 1
  %56 = alloca i8, align 1
  %57 = alloca i8, align 1
  %58 = alloca i8, align 1
  %59 = alloca i8, align 1
  %60 = alloca i8, align 1
  %61 = alloca i8, align 1
  %62 = alloca i8, align 1
  %63 = alloca i8, align 1
  %64 = alloca i8, align 1
  %65 = alloca i8, align 1
  %66 = alloca i8, align 1
  %67 = alloca i8, align 1
  %68 = alloca i8, align 1
  %69 = alloca i8, align 1
  %70 = alloca i8, align 1
  %71 = alloca i8, align 1
  %72 = alloca i8, align 1
  %73 = alloca i8, align 1
  %74 = alloca i8, align 1
  %75 = alloca i8, align 1
  %76 = alloca i8, align 1
  %77 = alloca i8, align 1
  %78 = alloca i8, align 1
  %79 = alloca i8, align 1
  %80 = alloca i8, align 1
  %81 = alloca i8, align 1
  %82 = alloca i8, align 1
  %83 = alloca i8, align 1
  %84 = alloca i8, align 1
  %85 = alloca i8, align 1
  %86 = alloca <32 x i8>, align 32
  %87 = alloca <4 x i64>, align 32
  %88 = alloca <4 x i64>, align 32
  %89 = alloca <4 x i64>, align 32
  %90 = alloca <4 x i64>, align 32
  %91 = alloca <4 x i64>, align 32
  %92 = alloca <4 x i64>, align 32
  store <4 x i64> %0, <4 x i64>* %87, align 32
  %93 = load <4 x i64>, <4 x i64>* %87, align 32
  store i8 10, i8* %54, align 1
  store i8 11, i8* %55, align 1
  store i8 9, i8* %56, align 1
  store i8 10, i8* %57, align 1
  store i8 7, i8* %58, align 1
  store i8 8, i8* %59, align 1
  store i8 6, i8* %60, align 1
  store i8 7, i8* %61, align 1
  store i8 4, i8* %62, align 1
  store i8 5, i8* %63, align 1
  store i8 3, i8* %64, align 1
  store i8 4, i8* %65, align 1
  store i8 1, i8* %66, align 1
  store i8 2, i8* %67, align 1
  store i8 0, i8* %68, align 1
  store i8 1, i8* %69, align 1
  store i8 14, i8* %70, align 1
  store i8 15, i8* %71, align 1
  store i8 13, i8* %72, align 1
  store i8 14, i8* %73, align 1
  store i8 11, i8* %74, align 1
  store i8 12, i8* %75, align 1
  store i8 10, i8* %76, align 1
  store i8 11, i8* %77, align 1
  store i8 8, i8* %78, align 1
  store i8 9, i8* %79, align 1
  store i8 7, i8* %80, align 1
  store i8 8, i8* %81, align 1
  store i8 5, i8* %82, align 1
  store i8 6, i8* %83, align 1
  store i8 4, i8* %84, align 1
  store i8 5, i8* %85, align 1
  %94 = load i8, i8* %85, align 1
  %95 = insertelement <32 x i8> undef, i8 %94, i32 0
  %96 = load i8, i8* %84, align 1
  %97 = insertelement <32 x i8> %95, i8 %96, i32 1
  %98 = load i8, i8* %83, align 1
  %99 = insertelement <32 x i8> %97, i8 %98, i32 2
  %100 = load i8, i8* %82, align 1
  %101 = insertelement <32 x i8> %99, i8 %100, i32 3
  %102 = load i8, i8* %81, align 1
  %103 = insertelement <32 x i8> %101, i8 %102, i32 4
  %104 = load i8, i8* %80, align 1
  %105 = insertelement <32 x i8> %103, i8 %104, i32 5
  %106 = load i8, i8* %79, align 1
  %107 = insertelement <32 x i8> %105, i8 %106, i32 6
  %108 = load i8, i8* %78, align 1
  %109 = insertelement <32 x i8> %107, i8 %108, i32 7
  %110 = load i8, i8* %77, align 1
  %111 = insertelement <32 x i8> %109, i8 %110, i32 8
  %112 = load i8, i8* %76, align 1
  %113 = insertelement <32 x i8> %111, i8 %112, i32 9
  %114 = load i8, i8* %75, align 1
  %115 = insertelement <32 x i8> %113, i8 %114, i32 10
  %116 = load i8, i8* %74, align 1
  %117 = insertelement <32 x i8> %115, i8 %116, i32 11
  %118 = load i8, i8* %73, align 1
  %119 = insertelement <32 x i8> %117, i8 %118, i32 12
  %120 = load i8, i8* %72, align 1
  %121 = insertelement <32 x i8> %119, i8 %120, i32 13
  %122 = load i8, i8* %71, align 1
  %123 = insertelement <32 x i8> %121, i8 %122, i32 14
  %124 = load i8, i8* %70, align 1
  %125 = insertelement <32 x i8> %123, i8 %124, i32 15
  %126 = load i8, i8* %69, align 1
  %127 = insertelement <32 x i8> %125, i8 %126, i32 16
  %128 = load i8, i8* %68, align 1
  %129 = insertelement <32 x i8> %127, i8 %128, i32 17
  %130 = load i8, i8* %67, align 1
  %131 = insertelement <32 x i8> %129, i8 %130, i32 18
  %132 = load i8, i8* %66, align 1
  %133 = insertelement <32 x i8> %131, i8 %132, i32 19
  %134 = load i8, i8* %65, align 1
  %135 = insertelement <32 x i8> %133, i8 %134, i32 20
  %136 = load i8, i8* %64, align 1
  %137 = insertelement <32 x i8> %135, i8 %136, i32 21
  %138 = load i8, i8* %63, align 1
  %139 = insertelement <32 x i8> %137, i8 %138, i32 22
  %140 = load i8, i8* %62, align 1
  %141 = insertelement <32 x i8> %139, i8 %140, i32 23
  %142 = load i8, i8* %61, align 1
  %143 = insertelement <32 x i8> %141, i8 %142, i32 24
  %144 = load i8, i8* %60, align 1
  %145 = insertelement <32 x i8> %143, i8 %144, i32 25
  %146 = load i8, i8* %59, align 1
  %147 = insertelement <32 x i8> %145, i8 %146, i32 26
  %148 = load i8, i8* %58, align 1
  %149 = insertelement <32 x i8> %147, i8 %148, i32 27
  %150 = load i8, i8* %57, align 1
  %151 = insertelement <32 x i8> %149, i8 %150, i32 28
  %152 = load i8, i8* %56, align 1
  %153 = insertelement <32 x i8> %151, i8 %152, i32 29
  %154 = load i8, i8* %55, align 1
  %155 = insertelement <32 x i8> %153, i8 %154, i32 30
  %156 = load i8, i8* %54, align 1
  %157 = insertelement <32 x i8> %155, i8 %156, i32 31
  store <32 x i8> %157, <32 x i8>* %86, align 32
  %158 = load <32 x i8>, <32 x i8>* %86, align 32
  %159 = bitcast <32 x i8> %158 to <4 x i64>
  store <4 x i64> %93, <4 x i64>* %2, align 32
  store <4 x i64> %159, <4 x i64>* %3, align 32
  %160 = load <4 x i64>, <4 x i64>* %2, align 32
  %161 = bitcast <4 x i64> %160 to <32 x i8>
  %162 = load <4 x i64>, <4 x i64>* %3, align 32
  %163 = bitcast <4 x i64> %162 to <32 x i8>
  %164 = call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %161, <32 x i8> %163) #5
  %165 = bitcast <32 x i8> %164 to <4 x i64>
  store <4 x i64> %165, <4 x i64>* %88, align 32
  %166 = load <4 x i64>, <4 x i64>* %88, align 32
  store i32 264305664, i32* %13, align 4
  %167 = load i32, i32* %13, align 4
  %168 = load i32, i32* %13, align 4
  %169 = load i32, i32* %13, align 4
  %170 = load i32, i32* %13, align 4
  %171 = load i32, i32* %13, align 4
  %172 = load i32, i32* %13, align 4
  %173 = load i32, i32* %13, align 4
  %174 = load i32, i32* %13, align 4
  store i32 %167, i32* %4, align 4
  store i32 %168, i32* %5, align 4
  store i32 %169, i32* %6, align 4
  store i32 %170, i32* %7, align 4
  store i32 %171, i32* %8, align 4
  store i32 %172, i32* %9, align 4
  store i32 %173, i32* %10, align 4
  store i32 %174, i32* %11, align 4
  %175 = load i32, i32* %11, align 4
  %176 = insertelement <8 x i32> undef, i32 %175, i32 0
  %177 = load i32, i32* %10, align 4
  %178 = insertelement <8 x i32> %176, i32 %177, i32 1
  %179 = load i32, i32* %9, align 4
  %180 = insertelement <8 x i32> %178, i32 %179, i32 2
  %181 = load i32, i32* %8, align 4
  %182 = insertelement <8 x i32> %180, i32 %181, i32 3
  %183 = load i32, i32* %7, align 4
  %184 = insertelement <8 x i32> %182, i32 %183, i32 4
  %185 = load i32, i32* %6, align 4
  %186 = insertelement <8 x i32> %184, i32 %185, i32 5
  %187 = load i32, i32* %5, align 4
  %188 = insertelement <8 x i32> %186, i32 %187, i32 6
  %189 = load i32, i32* %4, align 4
  %190 = insertelement <8 x i32> %188, i32 %189, i32 7
  store <8 x i32> %190, <8 x i32>* %12, align 32
  %191 = load <8 x i32>, <8 x i32>* %12, align 32
  %192 = bitcast <8 x i32> %191 to <4 x i64>
  store <4 x i64> %166, <4 x i64>* %14, align 32
  store <4 x i64> %192, <4 x i64>* %15, align 32
  %193 = load <4 x i64>, <4 x i64>* %14, align 32
  %194 = load <4 x i64>, <4 x i64>* %15, align 32
  %195 = and <4 x i64> %193, %194
  store <4 x i64> %195, <4 x i64>* %89, align 32
  %196 = load <4 x i64>, <4 x i64>* %89, align 32
  store i32 67108928, i32* %25, align 4
  %197 = load i32, i32* %25, align 4
  %198 = load i32, i32* %25, align 4
  %199 = load i32, i32* %25, align 4
  %200 = load i32, i32* %25, align 4
  %201 = load i32, i32* %25, align 4
  %202 = load i32, i32* %25, align 4
  %203 = load i32, i32* %25, align 4
  %204 = load i32, i32* %25, align 4
  store i32 %197, i32* %16, align 4
  store i32 %198, i32* %17, align 4
  store i32 %199, i32* %18, align 4
  store i32 %200, i32* %19, align 4
  store i32 %201, i32* %20, align 4
  store i32 %202, i32* %21, align 4
  store i32 %203, i32* %22, align 4
  store i32 %204, i32* %23, align 4
  %205 = load i32, i32* %23, align 4
  %206 = insertelement <8 x i32> undef, i32 %205, i32 0
  %207 = load i32, i32* %22, align 4
  %208 = insertelement <8 x i32> %206, i32 %207, i32 1
  %209 = load i32, i32* %21, align 4
  %210 = insertelement <8 x i32> %208, i32 %209, i32 2
  %211 = load i32, i32* %20, align 4
  %212 = insertelement <8 x i32> %210, i32 %211, i32 3
  %213 = load i32, i32* %19, align 4
  %214 = insertelement <8 x i32> %212, i32 %213, i32 4
  %215 = load i32, i32* %18, align 4
  %216 = insertelement <8 x i32> %214, i32 %215, i32 5
  %217 = load i32, i32* %17, align 4
  %218 = insertelement <8 x i32> %216, i32 %217, i32 6
  %219 = load i32, i32* %16, align 4
  %220 = insertelement <8 x i32> %218, i32 %219, i32 7
  store <8 x i32> %220, <8 x i32>* %24, align 32
  %221 = load <8 x i32>, <8 x i32>* %24, align 32
  %222 = bitcast <8 x i32> %221 to <4 x i64>
  store <4 x i64> %196, <4 x i64>* %26, align 32
  store <4 x i64> %222, <4 x i64>* %27, align 32
  %223 = load <4 x i64>, <4 x i64>* %26, align 32
  %224 = bitcast <4 x i64> %223 to <16 x i16>
  %225 = load <4 x i64>, <4 x i64>* %27, align 32
  %226 = bitcast <4 x i64> %225 to <16 x i16>
  %227 = call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %224, <16 x i16> %226) #5
  %228 = bitcast <16 x i16> %227 to <4 x i64>
  store <4 x i64> %228, <4 x i64>* %90, align 32
  %229 = load <4 x i64>, <4 x i64>* %88, align 32
  store i32 4129776, i32* %37, align 4
  %230 = load i32, i32* %37, align 4
  %231 = load i32, i32* %37, align 4
  %232 = load i32, i32* %37, align 4
  %233 = load i32, i32* %37, align 4
  %234 = load i32, i32* %37, align 4
  %235 = load i32, i32* %37, align 4
  %236 = load i32, i32* %37, align 4
  %237 = load i32, i32* %37, align 4
  store i32 %230, i32* %28, align 4
  store i32 %231, i32* %29, align 4
  store i32 %232, i32* %30, align 4
  store i32 %233, i32* %31, align 4
  store i32 %234, i32* %32, align 4
  store i32 %235, i32* %33, align 4
  store i32 %236, i32* %34, align 4
  store i32 %237, i32* %35, align 4
  %238 = load i32, i32* %35, align 4
  %239 = insertelement <8 x i32> undef, i32 %238, i32 0
  %240 = load i32, i32* %34, align 4
  %241 = insertelement <8 x i32> %239, i32 %240, i32 1
  %242 = load i32, i32* %33, align 4
  %243 = insertelement <8 x i32> %241, i32 %242, i32 2
  %244 = load i32, i32* %32, align 4
  %245 = insertelement <8 x i32> %243, i32 %244, i32 3
  %246 = load i32, i32* %31, align 4
  %247 = insertelement <8 x i32> %245, i32 %246, i32 4
  %248 = load i32, i32* %30, align 4
  %249 = insertelement <8 x i32> %247, i32 %248, i32 5
  %250 = load i32, i32* %29, align 4
  %251 = insertelement <8 x i32> %249, i32 %250, i32 6
  %252 = load i32, i32* %28, align 4
  %253 = insertelement <8 x i32> %251, i32 %252, i32 7
  store <8 x i32> %253, <8 x i32>* %36, align 32
  %254 = load <8 x i32>, <8 x i32>* %36, align 32
  %255 = bitcast <8 x i32> %254 to <4 x i64>
  store <4 x i64> %229, <4 x i64>* %38, align 32
  store <4 x i64> %255, <4 x i64>* %39, align 32
  %256 = load <4 x i64>, <4 x i64>* %38, align 32
  %257 = load <4 x i64>, <4 x i64>* %39, align 32
  %258 = and <4 x i64> %256, %257
  store <4 x i64> %258, <4 x i64>* %91, align 32
  %259 = load <4 x i64>, <4 x i64>* %91, align 32
  store i32 16777232, i32* %49, align 4
  %260 = load i32, i32* %49, align 4
  %261 = load i32, i32* %49, align 4
  %262 = load i32, i32* %49, align 4
  %263 = load i32, i32* %49, align 4
  %264 = load i32, i32* %49, align 4
  %265 = load i32, i32* %49, align 4
  %266 = load i32, i32* %49, align 4
  %267 = load i32, i32* %49, align 4
  store i32 %260, i32* %40, align 4
  store i32 %261, i32* %41, align 4
  store i32 %262, i32* %42, align 4
  store i32 %263, i32* %43, align 4
  store i32 %264, i32* %44, align 4
  store i32 %265, i32* %45, align 4
  store i32 %266, i32* %46, align 4
  store i32 %267, i32* %47, align 4
  %268 = load i32, i32* %47, align 4
  %269 = insertelement <8 x i32> undef, i32 %268, i32 0
  %270 = load i32, i32* %46, align 4
  %271 = insertelement <8 x i32> %269, i32 %270, i32 1
  %272 = load i32, i32* %45, align 4
  %273 = insertelement <8 x i32> %271, i32 %272, i32 2
  %274 = load i32, i32* %44, align 4
  %275 = insertelement <8 x i32> %273, i32 %274, i32 3
  %276 = load i32, i32* %43, align 4
  %277 = insertelement <8 x i32> %275, i32 %276, i32 4
  %278 = load i32, i32* %42, align 4
  %279 = insertelement <8 x i32> %277, i32 %278, i32 5
  %280 = load i32, i32* %41, align 4
  %281 = insertelement <8 x i32> %279, i32 %280, i32 6
  %282 = load i32, i32* %40, align 4
  %283 = insertelement <8 x i32> %281, i32 %282, i32 7
  store <8 x i32> %283, <8 x i32>* %48, align 32
  %284 = load <8 x i32>, <8 x i32>* %48, align 32
  %285 = bitcast <8 x i32> %284 to <4 x i64>
  store <4 x i64> %259, <4 x i64>* %50, align 32
  store <4 x i64> %285, <4 x i64>* %51, align 32
  %286 = load <4 x i64>, <4 x i64>* %50, align 32
  %287 = bitcast <4 x i64> %286 to <16 x i16>
  %288 = load <4 x i64>, <4 x i64>* %51, align 32
  %289 = bitcast <4 x i64> %288 to <16 x i16>
  %290 = mul <16 x i16> %287, %289
  %291 = bitcast <16 x i16> %290 to <4 x i64>
  store <4 x i64> %291, <4 x i64>* %92, align 32
  %292 = load <4 x i64>, <4 x i64>* %90, align 32
  %293 = load <4 x i64>, <4 x i64>* %92, align 32
  store <4 x i64> %292, <4 x i64>* %52, align 32
  store <4 x i64> %293, <4 x i64>* %53, align 32
  %294 = load <4 x i64>, <4 x i64>* %52, align 32
  %295 = load <4 x i64>, <4 x i64>* %53, align 32
  %296 = or <4 x i64> %294, %295
  ret <4 x i64> %296
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal <4 x i64> @enc_translate(<4 x i64> %0) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i8, align 1
  %13 = alloca i8, align 1
  %14 = alloca i8, align 1
  %15 = alloca i8, align 1
  %16 = alloca i8, align 1
  %17 = alloca i8, align 1
  %18 = alloca i8, align 1
  %19 = alloca i8, align 1
  %20 = alloca i8, align 1
  %21 = alloca i8, align 1
  %22 = alloca i8, align 1
  %23 = alloca i8, align 1
  %24 = alloca i8, align 1
  %25 = alloca i8, align 1
  %26 = alloca i8, align 1
  %27 = alloca i8, align 1
  %28 = alloca i8, align 1
  %29 = alloca i8, align 1
  %30 = alloca i8, align 1
  %31 = alloca i8, align 1
  %32 = alloca i8, align 1
  %33 = alloca i8, align 1
  %34 = alloca <32 x i8>, align 32
  %35 = alloca i8, align 1
  %36 = alloca <4 x i64>, align 32
  %37 = alloca <4 x i64>, align 32
  %38 = alloca i8, align 1
  %39 = alloca i8, align 1
  %40 = alloca i8, align 1
  %41 = alloca i8, align 1
  %42 = alloca i8, align 1
  %43 = alloca i8, align 1
  %44 = alloca i8, align 1
  %45 = alloca i8, align 1
  %46 = alloca i8, align 1
  %47 = alloca i8, align 1
  %48 = alloca i8, align 1
  %49 = alloca i8, align 1
  %50 = alloca i8, align 1
  %51 = alloca i8, align 1
  %52 = alloca i8, align 1
  %53 = alloca i8, align 1
  %54 = alloca i8, align 1
  %55 = alloca i8, align 1
  %56 = alloca i8, align 1
  %57 = alloca i8, align 1
  %58 = alloca i8, align 1
  %59 = alloca i8, align 1
  %60 = alloca i8, align 1
  %61 = alloca i8, align 1
  %62 = alloca i8, align 1
  %63 = alloca i8, align 1
  %64 = alloca i8, align 1
  %65 = alloca i8, align 1
  %66 = alloca i8, align 1
  %67 = alloca i8, align 1
  %68 = alloca i8, align 1
  %69 = alloca i8, align 1
  %70 = alloca <32 x i8>, align 32
  %71 = alloca i8, align 1
  %72 = alloca <4 x i64>, align 32
  %73 = alloca <4 x i64>, align 32
  %74 = alloca <4 x i64>, align 32
  %75 = alloca <4 x i64>, align 32
  %76 = alloca <4 x i64>, align 32
  %77 = alloca <4 x i64>, align 32
  %78 = alloca <4 x i64>, align 32
  %79 = alloca <4 x i64>, align 32
  %80 = alloca i8, align 1
  %81 = alloca i8, align 1
  %82 = alloca i8, align 1
  %83 = alloca i8, align 1
  %84 = alloca i8, align 1
  %85 = alloca i8, align 1
  %86 = alloca i8, align 1
  %87 = alloca i8, align 1
  %88 = alloca i8, align 1
  %89 = alloca i8, align 1
  %90 = alloca i8, align 1
  %91 = alloca i8, align 1
  %92 = alloca i8, align 1
  %93 = alloca i8, align 1
  %94 = alloca i8, align 1
  %95 = alloca i8, align 1
  %96 = alloca i8, align 1
  %97 = alloca i8, align 1
  %98 = alloca i8, align 1
  %99 = alloca i8, align 1
  %100 = alloca i8, align 1
  %101 = alloca i8, align 1
  %102 = alloca i8, align 1
  %103 = alloca i8, align 1
  %104 = alloca i8, align 1
  %105 = alloca i8, align 1
  %106 = alloca i8, align 1
  %107 = alloca i8, align 1
  %108 = alloca i8, align 1
  %109 = alloca i8, align 1
  %110 = alloca i8, align 1
  %111 = alloca i8, align 1
  %112 = alloca <32 x i8>, align 32
  %113 = alloca i8, align 1
  %114 = alloca i8, align 1
  %115 = alloca i8, align 1
  %116 = alloca i8, align 1
  %117 = alloca i8, align 1
  %118 = alloca i8, align 1
  %119 = alloca i8, align 1
  %120 = alloca i8, align 1
  %121 = alloca i8, align 1
  %122 = alloca i8, align 1
  %123 = alloca i8, align 1
  %124 = alloca i8, align 1
  %125 = alloca i8, align 1
  %126 = alloca i8, align 1
  %127 = alloca i8, align 1
  %128 = alloca i8, align 1
  %129 = alloca i8, align 1
  %130 = alloca i8, align 1
  %131 = alloca i8, align 1
  %132 = alloca i8, align 1
  %133 = alloca i8, align 1
  %134 = alloca i8, align 1
  %135 = alloca i8, align 1
  %136 = alloca i8, align 1
  %137 = alloca i8, align 1
  %138 = alloca i8, align 1
  %139 = alloca i8, align 1
  %140 = alloca i8, align 1
  %141 = alloca i8, align 1
  %142 = alloca i8, align 1
  %143 = alloca i8, align 1
  %144 = alloca i8, align 1
  %145 = alloca <4 x i64>, align 32
  %146 = alloca <4 x i64>, align 32
  %147 = alloca <4 x i64>, align 32
  %148 = alloca <4 x i64>, align 32
  %149 = alloca <4 x i64>, align 32
  store <4 x i64> %0, <4 x i64>* %145, align 32
  store i8 65, i8* %113, align 1
  store i8 71, i8* %114, align 1
  store i8 -4, i8* %115, align 1
  store i8 -4, i8* %116, align 1
  store i8 -4, i8* %117, align 1
  store i8 -4, i8* %118, align 1
  store i8 -4, i8* %119, align 1
  store i8 -4, i8* %120, align 1
  store i8 -4, i8* %121, align 1
  store i8 -4, i8* %122, align 1
  store i8 -4, i8* %123, align 1
  store i8 -4, i8* %124, align 1
  store i8 -19, i8* %125, align 1
  store i8 -16, i8* %126, align 1
  store i8 0, i8* %127, align 1
  store i8 0, i8* %128, align 1
  store i8 65, i8* %129, align 1
  store i8 71, i8* %130, align 1
  store i8 -4, i8* %131, align 1
  store i8 -4, i8* %132, align 1
  store i8 -4, i8* %133, align 1
  store i8 -4, i8* %134, align 1
  store i8 -4, i8* %135, align 1
  store i8 -4, i8* %136, align 1
  store i8 -4, i8* %137, align 1
  store i8 -4, i8* %138, align 1
  store i8 -4, i8* %139, align 1
  store i8 -4, i8* %140, align 1
  store i8 -19, i8* %141, align 1
  store i8 -16, i8* %142, align 1
  store i8 0, i8* %143, align 1
  store i8 0, i8* %144, align 1
  %150 = load i8, i8* %144, align 1
  %151 = load i8, i8* %143, align 1
  %152 = load i8, i8* %142, align 1
  %153 = load i8, i8* %141, align 1
  %154 = load i8, i8* %140, align 1
  %155 = load i8, i8* %139, align 1
  %156 = load i8, i8* %138, align 1
  %157 = load i8, i8* %137, align 1
  %158 = load i8, i8* %136, align 1
  %159 = load i8, i8* %135, align 1
  %160 = load i8, i8* %134, align 1
  %161 = load i8, i8* %133, align 1
  %162 = load i8, i8* %132, align 1
  %163 = load i8, i8* %131, align 1
  %164 = load i8, i8* %130, align 1
  %165 = load i8, i8* %129, align 1
  %166 = load i8, i8* %128, align 1
  %167 = load i8, i8* %127, align 1
  %168 = load i8, i8* %126, align 1
  %169 = load i8, i8* %125, align 1
  %170 = load i8, i8* %124, align 1
  %171 = load i8, i8* %123, align 1
  %172 = load i8, i8* %122, align 1
  %173 = load i8, i8* %121, align 1
  %174 = load i8, i8* %120, align 1
  %175 = load i8, i8* %119, align 1
  %176 = load i8, i8* %118, align 1
  %177 = load i8, i8* %117, align 1
  %178 = load i8, i8* %116, align 1
  %179 = load i8, i8* %115, align 1
  %180 = load i8, i8* %114, align 1
  %181 = load i8, i8* %113, align 1
  store i8 %150, i8* %80, align 1
  store i8 %151, i8* %81, align 1
  store i8 %152, i8* %82, align 1
  store i8 %153, i8* %83, align 1
  store i8 %154, i8* %84, align 1
  store i8 %155, i8* %85, align 1
  store i8 %156, i8* %86, align 1
  store i8 %157, i8* %87, align 1
  store i8 %158, i8* %88, align 1
  store i8 %159, i8* %89, align 1
  store i8 %160, i8* %90, align 1
  store i8 %161, i8* %91, align 1
  store i8 %162, i8* %92, align 1
  store i8 %163, i8* %93, align 1
  store i8 %164, i8* %94, align 1
  store i8 %165, i8* %95, align 1
  store i8 %166, i8* %96, align 1
  store i8 %167, i8* %97, align 1
  store i8 %168, i8* %98, align 1
  store i8 %169, i8* %99, align 1
  store i8 %170, i8* %100, align 1
  store i8 %171, i8* %101, align 1
  store i8 %172, i8* %102, align 1
  store i8 %173, i8* %103, align 1
  store i8 %174, i8* %104, align 1
  store i8 %175, i8* %105, align 1
  store i8 %176, i8* %106, align 1
  store i8 %177, i8* %107, align 1
  store i8 %178, i8* %108, align 1
  store i8 %179, i8* %109, align 1
  store i8 %180, i8* %110, align 1
  store i8 %181, i8* %111, align 1
  %182 = load i8, i8* %111, align 1
  %183 = insertelement <32 x i8> undef, i8 %182, i32 0
  %184 = load i8, i8* %110, align 1
  %185 = insertelement <32 x i8> %183, i8 %184, i32 1
  %186 = load i8, i8* %109, align 1
  %187 = insertelement <32 x i8> %185, i8 %186, i32 2
  %188 = load i8, i8* %108, align 1
  %189 = insertelement <32 x i8> %187, i8 %188, i32 3
  %190 = load i8, i8* %107, align 1
  %191 = insertelement <32 x i8> %189, i8 %190, i32 4
  %192 = load i8, i8* %106, align 1
  %193 = insertelement <32 x i8> %191, i8 %192, i32 5
  %194 = load i8, i8* %105, align 1
  %195 = insertelement <32 x i8> %193, i8 %194, i32 6
  %196 = load i8, i8* %104, align 1
  %197 = insertelement <32 x i8> %195, i8 %196, i32 7
  %198 = load i8, i8* %103, align 1
  %199 = insertelement <32 x i8> %197, i8 %198, i32 8
  %200 = load i8, i8* %102, align 1
  %201 = insertelement <32 x i8> %199, i8 %200, i32 9
  %202 = load i8, i8* %101, align 1
  %203 = insertelement <32 x i8> %201, i8 %202, i32 10
  %204 = load i8, i8* %100, align 1
  %205 = insertelement <32 x i8> %203, i8 %204, i32 11
  %206 = load i8, i8* %99, align 1
  %207 = insertelement <32 x i8> %205, i8 %206, i32 12
  %208 = load i8, i8* %98, align 1
  %209 = insertelement <32 x i8> %207, i8 %208, i32 13
  %210 = load i8, i8* %97, align 1
  %211 = insertelement <32 x i8> %209, i8 %210, i32 14
  %212 = load i8, i8* %96, align 1
  %213 = insertelement <32 x i8> %211, i8 %212, i32 15
  %214 = load i8, i8* %95, align 1
  %215 = insertelement <32 x i8> %213, i8 %214, i32 16
  %216 = load i8, i8* %94, align 1
  %217 = insertelement <32 x i8> %215, i8 %216, i32 17
  %218 = load i8, i8* %93, align 1
  %219 = insertelement <32 x i8> %217, i8 %218, i32 18
  %220 = load i8, i8* %92, align 1
  %221 = insertelement <32 x i8> %219, i8 %220, i32 19
  %222 = load i8, i8* %91, align 1
  %223 = insertelement <32 x i8> %221, i8 %222, i32 20
  %224 = load i8, i8* %90, align 1
  %225 = insertelement <32 x i8> %223, i8 %224, i32 21
  %226 = load i8, i8* %89, align 1
  %227 = insertelement <32 x i8> %225, i8 %226, i32 22
  %228 = load i8, i8* %88, align 1
  %229 = insertelement <32 x i8> %227, i8 %228, i32 23
  %230 = load i8, i8* %87, align 1
  %231 = insertelement <32 x i8> %229, i8 %230, i32 24
  %232 = load i8, i8* %86, align 1
  %233 = insertelement <32 x i8> %231, i8 %232, i32 25
  %234 = load i8, i8* %85, align 1
  %235 = insertelement <32 x i8> %233, i8 %234, i32 26
  %236 = load i8, i8* %84, align 1
  %237 = insertelement <32 x i8> %235, i8 %236, i32 27
  %238 = load i8, i8* %83, align 1
  %239 = insertelement <32 x i8> %237, i8 %238, i32 28
  %240 = load i8, i8* %82, align 1
  %241 = insertelement <32 x i8> %239, i8 %240, i32 29
  %242 = load i8, i8* %81, align 1
  %243 = insertelement <32 x i8> %241, i8 %242, i32 30
  %244 = load i8, i8* %80, align 1
  %245 = insertelement <32 x i8> %243, i8 %244, i32 31
  store <32 x i8> %245, <32 x i8>* %112, align 32
  %246 = load <32 x i8>, <32 x i8>* %112, align 32
  %247 = bitcast <32 x i8> %246 to <4 x i64>
  store <4 x i64> %247, <4 x i64>* %146, align 32
  %248 = load <4 x i64>, <4 x i64>* %145, align 32
  store i8 51, i8* %35, align 1
  %249 = load i8, i8* %35, align 1
  %250 = load i8, i8* %35, align 1
  %251 = load i8, i8* %35, align 1
  %252 = load i8, i8* %35, align 1
  %253 = load i8, i8* %35, align 1
  %254 = load i8, i8* %35, align 1
  %255 = load i8, i8* %35, align 1
  %256 = load i8, i8* %35, align 1
  %257 = load i8, i8* %35, align 1
  %258 = load i8, i8* %35, align 1
  %259 = load i8, i8* %35, align 1
  %260 = load i8, i8* %35, align 1
  %261 = load i8, i8* %35, align 1
  %262 = load i8, i8* %35, align 1
  %263 = load i8, i8* %35, align 1
  %264 = load i8, i8* %35, align 1
  %265 = load i8, i8* %35, align 1
  %266 = load i8, i8* %35, align 1
  %267 = load i8, i8* %35, align 1
  %268 = load i8, i8* %35, align 1
  %269 = load i8, i8* %35, align 1
  %270 = load i8, i8* %35, align 1
  %271 = load i8, i8* %35, align 1
  %272 = load i8, i8* %35, align 1
  %273 = load i8, i8* %35, align 1
  %274 = load i8, i8* %35, align 1
  %275 = load i8, i8* %35, align 1
  %276 = load i8, i8* %35, align 1
  %277 = load i8, i8* %35, align 1
  %278 = load i8, i8* %35, align 1
  %279 = load i8, i8* %35, align 1
  %280 = load i8, i8* %35, align 1
  store i8 %249, i8* %2, align 1
  store i8 %250, i8* %3, align 1
  store i8 %251, i8* %4, align 1
  store i8 %252, i8* %5, align 1
  store i8 %253, i8* %6, align 1
  store i8 %254, i8* %7, align 1
  store i8 %255, i8* %8, align 1
  store i8 %256, i8* %9, align 1
  store i8 %257, i8* %10, align 1
  store i8 %258, i8* %11, align 1
  store i8 %259, i8* %12, align 1
  store i8 %260, i8* %13, align 1
  store i8 %261, i8* %14, align 1
  store i8 %262, i8* %15, align 1
  store i8 %263, i8* %16, align 1
  store i8 %264, i8* %17, align 1
  store i8 %265, i8* %18, align 1
  store i8 %266, i8* %19, align 1
  store i8 %267, i8* %20, align 1
  store i8 %268, i8* %21, align 1
  store i8 %269, i8* %22, align 1
  store i8 %270, i8* %23, align 1
  store i8 %271, i8* %24, align 1
  store i8 %272, i8* %25, align 1
  store i8 %273, i8* %26, align 1
  store i8 %274, i8* %27, align 1
  store i8 %275, i8* %28, align 1
  store i8 %276, i8* %29, align 1
  store i8 %277, i8* %30, align 1
  store i8 %278, i8* %31, align 1
  store i8 %279, i8* %32, align 1
  store i8 %280, i8* %33, align 1
  %281 = load i8, i8* %33, align 1
  %282 = insertelement <32 x i8> undef, i8 %281, i32 0
  %283 = load i8, i8* %32, align 1
  %284 = insertelement <32 x i8> %282, i8 %283, i32 1
  %285 = load i8, i8* %31, align 1
  %286 = insertelement <32 x i8> %284, i8 %285, i32 2
  %287 = load i8, i8* %30, align 1
  %288 = insertelement <32 x i8> %286, i8 %287, i32 3
  %289 = load i8, i8* %29, align 1
  %290 = insertelement <32 x i8> %288, i8 %289, i32 4
  %291 = load i8, i8* %28, align 1
  %292 = insertelement <32 x i8> %290, i8 %291, i32 5
  %293 = load i8, i8* %27, align 1
  %294 = insertelement <32 x i8> %292, i8 %293, i32 6
  %295 = load i8, i8* %26, align 1
  %296 = insertelement <32 x i8> %294, i8 %295, i32 7
  %297 = load i8, i8* %25, align 1
  %298 = insertelement <32 x i8> %296, i8 %297, i32 8
  %299 = load i8, i8* %24, align 1
  %300 = insertelement <32 x i8> %298, i8 %299, i32 9
  %301 = load i8, i8* %23, align 1
  %302 = insertelement <32 x i8> %300, i8 %301, i32 10
  %303 = load i8, i8* %22, align 1
  %304 = insertelement <32 x i8> %302, i8 %303, i32 11
  %305 = load i8, i8* %21, align 1
  %306 = insertelement <32 x i8> %304, i8 %305, i32 12
  %307 = load i8, i8* %20, align 1
  %308 = insertelement <32 x i8> %306, i8 %307, i32 13
  %309 = load i8, i8* %19, align 1
  %310 = insertelement <32 x i8> %308, i8 %309, i32 14
  %311 = load i8, i8* %18, align 1
  %312 = insertelement <32 x i8> %310, i8 %311, i32 15
  %313 = load i8, i8* %17, align 1
  %314 = insertelement <32 x i8> %312, i8 %313, i32 16
  %315 = load i8, i8* %16, align 1
  %316 = insertelement <32 x i8> %314, i8 %315, i32 17
  %317 = load i8, i8* %15, align 1
  %318 = insertelement <32 x i8> %316, i8 %317, i32 18
  %319 = load i8, i8* %14, align 1
  %320 = insertelement <32 x i8> %318, i8 %319, i32 19
  %321 = load i8, i8* %13, align 1
  %322 = insertelement <32 x i8> %320, i8 %321, i32 20
  %323 = load i8, i8* %12, align 1
  %324 = insertelement <32 x i8> %322, i8 %323, i32 21
  %325 = load i8, i8* %11, align 1
  %326 = insertelement <32 x i8> %324, i8 %325, i32 22
  %327 = load i8, i8* %10, align 1
  %328 = insertelement <32 x i8> %326, i8 %327, i32 23
  %329 = load i8, i8* %9, align 1
  %330 = insertelement <32 x i8> %328, i8 %329, i32 24
  %331 = load i8, i8* %8, align 1
  %332 = insertelement <32 x i8> %330, i8 %331, i32 25
  %333 = load i8, i8* %7, align 1
  %334 = insertelement <32 x i8> %332, i8 %333, i32 26
  %335 = load i8, i8* %6, align 1
  %336 = insertelement <32 x i8> %334, i8 %335, i32 27
  %337 = load i8, i8* %5, align 1
  %338 = insertelement <32 x i8> %336, i8 %337, i32 28
  %339 = load i8, i8* %4, align 1
  %340 = insertelement <32 x i8> %338, i8 %339, i32 29
  %341 = load i8, i8* %3, align 1
  %342 = insertelement <32 x i8> %340, i8 %341, i32 30
  %343 = load i8, i8* %2, align 1
  %344 = insertelement <32 x i8> %342, i8 %343, i32 31
  store <32 x i8> %344, <32 x i8>* %34, align 32
  %345 = load <32 x i8>, <32 x i8>* %34, align 32
  %346 = bitcast <32 x i8> %345 to <4 x i64>
  store <4 x i64> %248, <4 x i64>* %36, align 32
  store <4 x i64> %346, <4 x i64>* %37, align 32
  %347 = load <4 x i64>, <4 x i64>* %36, align 32
  %348 = bitcast <4 x i64> %347 to <32 x i8>
  %349 = load <4 x i64>, <4 x i64>* %37, align 32
  %350 = bitcast <4 x i64> %349 to <32 x i8>
  %351 = call <32 x i8> @llvm.usub.sat.v32i8(<32 x i8> %348, <32 x i8> %350) #5
  %352 = bitcast <32 x i8> %351 to <4 x i64>
  store <4 x i64> %352, <4 x i64>* %147, align 32
  %353 = load <4 x i64>, <4 x i64>* %145, align 32
  store i8 25, i8* %71, align 1
  %354 = load i8, i8* %71, align 1
  %355 = load i8, i8* %71, align 1
  %356 = load i8, i8* %71, align 1
  %357 = load i8, i8* %71, align 1
  %358 = load i8, i8* %71, align 1
  %359 = load i8, i8* %71, align 1
  %360 = load i8, i8* %71, align 1
  %361 = load i8, i8* %71, align 1
  %362 = load i8, i8* %71, align 1
  %363 = load i8, i8* %71, align 1
  %364 = load i8, i8* %71, align 1
  %365 = load i8, i8* %71, align 1
  %366 = load i8, i8* %71, align 1
  %367 = load i8, i8* %71, align 1
  %368 = load i8, i8* %71, align 1
  %369 = load i8, i8* %71, align 1
  %370 = load i8, i8* %71, align 1
  %371 = load i8, i8* %71, align 1
  %372 = load i8, i8* %71, align 1
  %373 = load i8, i8* %71, align 1
  %374 = load i8, i8* %71, align 1
  %375 = load i8, i8* %71, align 1
  %376 = load i8, i8* %71, align 1
  %377 = load i8, i8* %71, align 1
  %378 = load i8, i8* %71, align 1
  %379 = load i8, i8* %71, align 1
  %380 = load i8, i8* %71, align 1
  %381 = load i8, i8* %71, align 1
  %382 = load i8, i8* %71, align 1
  %383 = load i8, i8* %71, align 1
  %384 = load i8, i8* %71, align 1
  %385 = load i8, i8* %71, align 1
  store i8 %354, i8* %38, align 1
  store i8 %355, i8* %39, align 1
  store i8 %356, i8* %40, align 1
  store i8 %357, i8* %41, align 1
  store i8 %358, i8* %42, align 1
  store i8 %359, i8* %43, align 1
  store i8 %360, i8* %44, align 1
  store i8 %361, i8* %45, align 1
  store i8 %362, i8* %46, align 1
  store i8 %363, i8* %47, align 1
  store i8 %364, i8* %48, align 1
  store i8 %365, i8* %49, align 1
  store i8 %366, i8* %50, align 1
  store i8 %367, i8* %51, align 1
  store i8 %368, i8* %52, align 1
  store i8 %369, i8* %53, align 1
  store i8 %370, i8* %54, align 1
  store i8 %371, i8* %55, align 1
  store i8 %372, i8* %56, align 1
  store i8 %373, i8* %57, align 1
  store i8 %374, i8* %58, align 1
  store i8 %375, i8* %59, align 1
  store i8 %376, i8* %60, align 1
  store i8 %377, i8* %61, align 1
  store i8 %378, i8* %62, align 1
  store i8 %379, i8* %63, align 1
  store i8 %380, i8* %64, align 1
  store i8 %381, i8* %65, align 1
  store i8 %382, i8* %66, align 1
  store i8 %383, i8* %67, align 1
  store i8 %384, i8* %68, align 1
  store i8 %385, i8* %69, align 1
  %386 = load i8, i8* %69, align 1
  %387 = insertelement <32 x i8> undef, i8 %386, i32 0
  %388 = load i8, i8* %68, align 1
  %389 = insertelement <32 x i8> %387, i8 %388, i32 1
  %390 = load i8, i8* %67, align 1
  %391 = insertelement <32 x i8> %389, i8 %390, i32 2
  %392 = load i8, i8* %66, align 1
  %393 = insertelement <32 x i8> %391, i8 %392, i32 3
  %394 = load i8, i8* %65, align 1
  %395 = insertelement <32 x i8> %393, i8 %394, i32 4
  %396 = load i8, i8* %64, align 1
  %397 = insertelement <32 x i8> %395, i8 %396, i32 5
  %398 = load i8, i8* %63, align 1
  %399 = insertelement <32 x i8> %397, i8 %398, i32 6
  %400 = load i8, i8* %62, align 1
  %401 = insertelement <32 x i8> %399, i8 %400, i32 7
  %402 = load i8, i8* %61, align 1
  %403 = insertelement <32 x i8> %401, i8 %402, i32 8
  %404 = load i8, i8* %60, align 1
  %405 = insertelement <32 x i8> %403, i8 %404, i32 9
  %406 = load i8, i8* %59, align 1
  %407 = insertelement <32 x i8> %405, i8 %406, i32 10
  %408 = load i8, i8* %58, align 1
  %409 = insertelement <32 x i8> %407, i8 %408, i32 11
  %410 = load i8, i8* %57, align 1
  %411 = insertelement <32 x i8> %409, i8 %410, i32 12
  %412 = load i8, i8* %56, align 1
  %413 = insertelement <32 x i8> %411, i8 %412, i32 13
  %414 = load i8, i8* %55, align 1
  %415 = insertelement <32 x i8> %413, i8 %414, i32 14
  %416 = load i8, i8* %54, align 1
  %417 = insertelement <32 x i8> %415, i8 %416, i32 15
  %418 = load i8, i8* %53, align 1
  %419 = insertelement <32 x i8> %417, i8 %418, i32 16
  %420 = load i8, i8* %52, align 1
  %421 = insertelement <32 x i8> %419, i8 %420, i32 17
  %422 = load i8, i8* %51, align 1
  %423 = insertelement <32 x i8> %421, i8 %422, i32 18
  %424 = load i8, i8* %50, align 1
  %425 = insertelement <32 x i8> %423, i8 %424, i32 19
  %426 = load i8, i8* %49, align 1
  %427 = insertelement <32 x i8> %425, i8 %426, i32 20
  %428 = load i8, i8* %48, align 1
  %429 = insertelement <32 x i8> %427, i8 %428, i32 21
  %430 = load i8, i8* %47, align 1
  %431 = insertelement <32 x i8> %429, i8 %430, i32 22
  %432 = load i8, i8* %46, align 1
  %433 = insertelement <32 x i8> %431, i8 %432, i32 23
  %434 = load i8, i8* %45, align 1
  %435 = insertelement <32 x i8> %433, i8 %434, i32 24
  %436 = load i8, i8* %44, align 1
  %437 = insertelement <32 x i8> %435, i8 %436, i32 25
  %438 = load i8, i8* %43, align 1
  %439 = insertelement <32 x i8> %437, i8 %438, i32 26
  %440 = load i8, i8* %42, align 1
  %441 = insertelement <32 x i8> %439, i8 %440, i32 27
  %442 = load i8, i8* %41, align 1
  %443 = insertelement <32 x i8> %441, i8 %442, i32 28
  %444 = load i8, i8* %40, align 1
  %445 = insertelement <32 x i8> %443, i8 %444, i32 29
  %446 = load i8, i8* %39, align 1
  %447 = insertelement <32 x i8> %445, i8 %446, i32 30
  %448 = load i8, i8* %38, align 1
  %449 = insertelement <32 x i8> %447, i8 %448, i32 31
  store <32 x i8> %449, <32 x i8>* %70, align 32
  %450 = load <32 x i8>, <32 x i8>* %70, align 32
  %451 = bitcast <32 x i8> %450 to <4 x i64>
  store <4 x i64> %353, <4 x i64>* %72, align 32
  store <4 x i64> %451, <4 x i64>* %73, align 32
  %452 = load <4 x i64>, <4 x i64>* %72, align 32
  %453 = bitcast <4 x i64> %452 to <32 x i8>
  %454 = load <4 x i64>, <4 x i64>* %73, align 32
  %455 = bitcast <4 x i64> %454 to <32 x i8>
  %456 = icmp sgt <32 x i8> %453, %455
  %457 = sext <32 x i1> %456 to <32 x i8>
  %458 = bitcast <32 x i8> %457 to <4 x i64>
  store <4 x i64> %458, <4 x i64>* %148, align 32
  %459 = load <4 x i64>, <4 x i64>* %147, align 32
  %460 = load <4 x i64>, <4 x i64>* %148, align 32
  store <4 x i64> %459, <4 x i64>* %74, align 32
  store <4 x i64> %460, <4 x i64>* %75, align 32
  %461 = load <4 x i64>, <4 x i64>* %74, align 32
  %462 = bitcast <4 x i64> %461 to <32 x i8>
  %463 = load <4 x i64>, <4 x i64>* %75, align 32
  %464 = bitcast <4 x i64> %463 to <32 x i8>
  %465 = sub <32 x i8> %462, %464
  %466 = bitcast <32 x i8> %465 to <4 x i64>
  store <4 x i64> %466, <4 x i64>* %147, align 32
  %467 = load <4 x i64>, <4 x i64>* %145, align 32
  %468 = load <4 x i64>, <4 x i64>* %146, align 32
  %469 = load <4 x i64>, <4 x i64>* %147, align 32
  store <4 x i64> %468, <4 x i64>* %76, align 32
  store <4 x i64> %469, <4 x i64>* %77, align 32
  %470 = load <4 x i64>, <4 x i64>* %76, align 32
  %471 = bitcast <4 x i64> %470 to <32 x i8>
  %472 = load <4 x i64>, <4 x i64>* %77, align 32
  %473 = bitcast <4 x i64> %472 to <32 x i8>
  %474 = call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %471, <32 x i8> %473) #5
  %475 = bitcast <32 x i8> %474 to <4 x i64>
  store <4 x i64> %467, <4 x i64>* %78, align 32
  store <4 x i64> %475, <4 x i64>* %79, align 32
  %476 = load <4 x i64>, <4 x i64>* %78, align 32
  %477 = bitcast <4 x i64> %476 to <32 x i8>
  %478 = load <4 x i64>, <4 x i64>* %79, align 32
  %479 = bitcast <4 x i64> %478 to <32 x i8>
  %480 = add <32 x i8> %477, %479
  %481 = bitcast <32 x i8> %480 to <4 x i64>
  store <4 x i64> %481, <4 x i64>* %149, align 32
  %482 = load <4 x i64>, <4 x i64>* %149, align 32
  ret <4 x i64> %482
}

declare i64 @chromium_base64_encode(i8*, i8*, i64) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i64 @fast_avx2_base64_decode(i8* %0, i8* %1, i64 %2) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i8, align 1
  %13 = alloca i8, align 1
  %14 = alloca i8, align 1
  %15 = alloca i8, align 1
  %16 = alloca i8, align 1
  %17 = alloca i8, align 1
  %18 = alloca i8, align 1
  %19 = alloca i8, align 1
  %20 = alloca i8, align 1
  %21 = alloca i8, align 1
  %22 = alloca i8, align 1
  %23 = alloca i8, align 1
  %24 = alloca i8, align 1
  %25 = alloca i8, align 1
  %26 = alloca i8, align 1
  %27 = alloca i8, align 1
  %28 = alloca i8, align 1
  %29 = alloca i8, align 1
  %30 = alloca i8, align 1
  %31 = alloca i8, align 1
  %32 = alloca i8, align 1
  %33 = alloca i8, align 1
  %34 = alloca i8, align 1
  %35 = alloca i8, align 1
  %36 = alloca <32 x i8>, align 32
  %37 = alloca i8, align 1
  %38 = alloca i8, align 1
  %39 = alloca i8, align 1
  %40 = alloca i8, align 1
  %41 = alloca i8, align 1
  %42 = alloca i8, align 1
  %43 = alloca i8, align 1
  %44 = alloca i8, align 1
  %45 = alloca i8, align 1
  %46 = alloca i8, align 1
  %47 = alloca i8, align 1
  %48 = alloca i8, align 1
  %49 = alloca i8, align 1
  %50 = alloca i8, align 1
  %51 = alloca i8, align 1
  %52 = alloca i8, align 1
  %53 = alloca i8, align 1
  %54 = alloca i8, align 1
  %55 = alloca i8, align 1
  %56 = alloca i8, align 1
  %57 = alloca i8, align 1
  %58 = alloca i8, align 1
  %59 = alloca i8, align 1
  %60 = alloca i8, align 1
  %61 = alloca i8, align 1
  %62 = alloca i8, align 1
  %63 = alloca i8, align 1
  %64 = alloca i8, align 1
  %65 = alloca i8, align 1
  %66 = alloca i8, align 1
  %67 = alloca i8, align 1
  %68 = alloca i8, align 1
  %69 = alloca i8, align 1
  %70 = alloca i8, align 1
  %71 = alloca i8, align 1
  %72 = alloca i8, align 1
  %73 = alloca i8, align 1
  %74 = alloca i8, align 1
  %75 = alloca i8, align 1
  %76 = alloca i8, align 1
  %77 = alloca i8, align 1
  %78 = alloca i8, align 1
  %79 = alloca i8, align 1
  %80 = alloca i8, align 1
  %81 = alloca i8, align 1
  %82 = alloca i8, align 1
  %83 = alloca i8, align 1
  %84 = alloca i8, align 1
  %85 = alloca i8, align 1
  %86 = alloca i8, align 1
  %87 = alloca i8, align 1
  %88 = alloca i8, align 1
  %89 = alloca i8, align 1
  %90 = alloca i8, align 1
  %91 = alloca i8, align 1
  %92 = alloca i8, align 1
  %93 = alloca i8, align 1
  %94 = alloca i8, align 1
  %95 = alloca i8, align 1
  %96 = alloca i8, align 1
  %97 = alloca i8, align 1
  %98 = alloca i8, align 1
  %99 = alloca i8, align 1
  %100 = alloca i8, align 1
  %101 = alloca <32 x i8>, align 32
  %102 = alloca i8, align 1
  %103 = alloca i8, align 1
  %104 = alloca i8, align 1
  %105 = alloca i8, align 1
  %106 = alloca i8, align 1
  %107 = alloca i8, align 1
  %108 = alloca i8, align 1
  %109 = alloca i8, align 1
  %110 = alloca i8, align 1
  %111 = alloca i8, align 1
  %112 = alloca i8, align 1
  %113 = alloca i8, align 1
  %114 = alloca i8, align 1
  %115 = alloca i8, align 1
  %116 = alloca i8, align 1
  %117 = alloca i8, align 1
  %118 = alloca i8, align 1
  %119 = alloca i8, align 1
  %120 = alloca i8, align 1
  %121 = alloca i8, align 1
  %122 = alloca i8, align 1
  %123 = alloca i8, align 1
  %124 = alloca i8, align 1
  %125 = alloca i8, align 1
  %126 = alloca i8, align 1
  %127 = alloca i8, align 1
  %128 = alloca i8, align 1
  %129 = alloca i8, align 1
  %130 = alloca i8, align 1
  %131 = alloca i8, align 1
  %132 = alloca i8, align 1
  %133 = alloca i8, align 1
  %134 = alloca i8, align 1
  %135 = alloca i8, align 1
  %136 = alloca i8, align 1
  %137 = alloca i8, align 1
  %138 = alloca i8, align 1
  %139 = alloca i8, align 1
  %140 = alloca i8, align 1
  %141 = alloca i8, align 1
  %142 = alloca i8, align 1
  %143 = alloca i8, align 1
  %144 = alloca i8, align 1
  %145 = alloca i8, align 1
  %146 = alloca i8, align 1
  %147 = alloca i8, align 1
  %148 = alloca i8, align 1
  %149 = alloca i8, align 1
  %150 = alloca i8, align 1
  %151 = alloca i8, align 1
  %152 = alloca i8, align 1
  %153 = alloca i8, align 1
  %154 = alloca i8, align 1
  %155 = alloca i8, align 1
  %156 = alloca i8, align 1
  %157 = alloca i8, align 1
  %158 = alloca i8, align 1
  %159 = alloca i8, align 1
  %160 = alloca i8, align 1
  %161 = alloca i8, align 1
  %162 = alloca i8, align 1
  %163 = alloca i8, align 1
  %164 = alloca i8, align 1
  %165 = alloca i8, align 1
  %166 = alloca <32 x i8>, align 32
  %167 = alloca i8, align 1
  %168 = alloca <4 x i64>, align 32
  %169 = alloca i32, align 4
  %170 = alloca <4 x i64>, align 32
  %171 = alloca <4 x i64>, align 32
  %172 = alloca <4 x i64>, align 32
  %173 = alloca <4 x i64>, align 32
  %174 = alloca <4 x i64>, align 32
  %175 = alloca <4 x i64>, align 32
  %176 = alloca <4 x i64>, align 32
  %177 = alloca <4 x i64>, align 32
  %178 = alloca <4 x i64>, align 32
  %179 = alloca <4 x i64>, align 32
  %180 = alloca <4 x i64>, align 32
  %181 = alloca <4 x i64>, align 32
  %182 = alloca <4 x i64>, align 32
  %183 = alloca <4 x i64>, align 32
  %184 = alloca <4 x i64>, align 32
  %185 = alloca <4 x i64>, align 32
  %186 = alloca <4 x i64>, align 32
  %187 = alloca <4 x i64>, align 32
  %188 = alloca i8, align 1
  %189 = alloca i8, align 1
  %190 = alloca i8, align 1
  %191 = alloca i8, align 1
  %192 = alloca i8, align 1
  %193 = alloca i8, align 1
  %194 = alloca i8, align 1
  %195 = alloca i8, align 1
  %196 = alloca i8, align 1
  %197 = alloca i8, align 1
  %198 = alloca i8, align 1
  %199 = alloca i8, align 1
  %200 = alloca i8, align 1
  %201 = alloca i8, align 1
  %202 = alloca i8, align 1
  %203 = alloca i8, align 1
  %204 = alloca i8, align 1
  %205 = alloca i8, align 1
  %206 = alloca i8, align 1
  %207 = alloca i8, align 1
  %208 = alloca i8, align 1
  %209 = alloca i8, align 1
  %210 = alloca i8, align 1
  %211 = alloca i8, align 1
  %212 = alloca i8, align 1
  %213 = alloca i8, align 1
  %214 = alloca i8, align 1
  %215 = alloca i8, align 1
  %216 = alloca i8, align 1
  %217 = alloca i8, align 1
  %218 = alloca i8, align 1
  %219 = alloca i8, align 1
  %220 = alloca <32 x i8>, align 32
  %221 = alloca i8, align 1
  %222 = alloca i8, align 1
  %223 = alloca i8, align 1
  %224 = alloca i8, align 1
  %225 = alloca i8, align 1
  %226 = alloca i8, align 1
  %227 = alloca i8, align 1
  %228 = alloca i8, align 1
  %229 = alloca i8, align 1
  %230 = alloca i8, align 1
  %231 = alloca i8, align 1
  %232 = alloca i8, align 1
  %233 = alloca i8, align 1
  %234 = alloca i8, align 1
  %235 = alloca i8, align 1
  %236 = alloca i8, align 1
  %237 = alloca i8, align 1
  %238 = alloca i8, align 1
  %239 = alloca i8, align 1
  %240 = alloca i8, align 1
  %241 = alloca i8, align 1
  %242 = alloca i8, align 1
  %243 = alloca i8, align 1
  %244 = alloca i8, align 1
  %245 = alloca i8, align 1
  %246 = alloca i8, align 1
  %247 = alloca i8, align 1
  %248 = alloca i8, align 1
  %249 = alloca i8, align 1
  %250 = alloca i8, align 1
  %251 = alloca i8, align 1
  %252 = alloca i8, align 1
  %253 = alloca <4 x i64>*, align 8
  %254 = alloca <4 x i64>, align 32
  %255 = alloca <4 x i64>*, align 8
  %256 = alloca i64, align 8
  %257 = alloca i8*, align 8
  %258 = alloca i8*, align 8
  %259 = alloca i64, align 8
  %260 = alloca i8*, align 8
  %261 = alloca <4 x i64>, align 32
  %262 = alloca <4 x i64>, align 32
  %263 = alloca <4 x i64>, align 32
  %264 = alloca <4 x i64>, align 32
  %265 = alloca <4 x i64>, align 32
  %266 = alloca <4 x i64>, align 32
  %267 = alloca <4 x i64>, align 32
  %268 = alloca <4 x i64>, align 32
  %269 = alloca <4 x i64>, align 32
  %270 = alloca <4 x i64>, align 32
  %271 = alloca <4 x i64>, align 32
  %272 = alloca i64, align 8
  store i8* %0, i8** %257, align 8
  store i8* %1, i8** %258, align 8
  store i64 %2, i64* %259, align 8
  %273 = load i8*, i8** %257, align 8
  store i8* %273, i8** %260, align 8
  br label %274

274:                                              ; preds = %739, %3
  %275 = load i64, i64* %259, align 8
  %276 = icmp uge i64 %275, 45
  br i1 %276, label %277, label %763

277:                                              ; preds = %274
  %278 = load i8*, i8** %258, align 8
  %279 = bitcast i8* %278 to <4 x i64>*
  store <4 x i64>* %279, <4 x i64>** %255, align 8
  %280 = load <4 x i64>*, <4 x i64>** %255, align 8
  %281 = bitcast <4 x i64>* %280 to %struct.__loadu_si256*
  %282 = getelementptr inbounds %struct.__loadu_si256, %struct.__loadu_si256* %281, i32 0, i32 0
  %283 = load <4 x i64>, <4 x i64>* %282, align 1
  store <4 x i64> %283, <4 x i64>* %261, align 32
  store i8 21, i8* %221, align 1
  store i8 17, i8* %222, align 1
  store i8 17, i8* %223, align 1
  store i8 17, i8* %224, align 1
  store i8 17, i8* %225, align 1
  store i8 17, i8* %226, align 1
  store i8 17, i8* %227, align 1
  store i8 17, i8* %228, align 1
  store i8 17, i8* %229, align 1
  store i8 17, i8* %230, align 1
  store i8 19, i8* %231, align 1
  store i8 26, i8* %232, align 1
  store i8 27, i8* %233, align 1
  store i8 27, i8* %234, align 1
  store i8 27, i8* %235, align 1
  store i8 26, i8* %236, align 1
  store i8 21, i8* %237, align 1
  store i8 17, i8* %238, align 1
  store i8 17, i8* %239, align 1
  store i8 17, i8* %240, align 1
  store i8 17, i8* %241, align 1
  store i8 17, i8* %242, align 1
  store i8 17, i8* %243, align 1
  store i8 17, i8* %244, align 1
  store i8 17, i8* %245, align 1
  store i8 17, i8* %246, align 1
  store i8 19, i8* %247, align 1
  store i8 26, i8* %248, align 1
  store i8 27, i8* %249, align 1
  store i8 27, i8* %250, align 1
  store i8 27, i8* %251, align 1
  store i8 26, i8* %252, align 1
  %284 = load i8, i8* %252, align 1
  %285 = load i8, i8* %251, align 1
  %286 = load i8, i8* %250, align 1
  %287 = load i8, i8* %249, align 1
  %288 = load i8, i8* %248, align 1
  %289 = load i8, i8* %247, align 1
  %290 = load i8, i8* %246, align 1
  %291 = load i8, i8* %245, align 1
  %292 = load i8, i8* %244, align 1
  %293 = load i8, i8* %243, align 1
  %294 = load i8, i8* %242, align 1
  %295 = load i8, i8* %241, align 1
  %296 = load i8, i8* %240, align 1
  %297 = load i8, i8* %239, align 1
  %298 = load i8, i8* %238, align 1
  %299 = load i8, i8* %237, align 1
  %300 = load i8, i8* %236, align 1
  %301 = load i8, i8* %235, align 1
  %302 = load i8, i8* %234, align 1
  %303 = load i8, i8* %233, align 1
  %304 = load i8, i8* %232, align 1
  %305 = load i8, i8* %231, align 1
  %306 = load i8, i8* %230, align 1
  %307 = load i8, i8* %229, align 1
  %308 = load i8, i8* %228, align 1
  %309 = load i8, i8* %227, align 1
  %310 = load i8, i8* %226, align 1
  %311 = load i8, i8* %225, align 1
  %312 = load i8, i8* %224, align 1
  %313 = load i8, i8* %223, align 1
  %314 = load i8, i8* %222, align 1
  %315 = load i8, i8* %221, align 1
  store i8 %284, i8* %188, align 1
  store i8 %285, i8* %189, align 1
  store i8 %286, i8* %190, align 1
  store i8 %287, i8* %191, align 1
  store i8 %288, i8* %192, align 1
  store i8 %289, i8* %193, align 1
  store i8 %290, i8* %194, align 1
  store i8 %291, i8* %195, align 1
  store i8 %292, i8* %196, align 1
  store i8 %293, i8* %197, align 1
  store i8 %294, i8* %198, align 1
  store i8 %295, i8* %199, align 1
  store i8 %296, i8* %200, align 1
  store i8 %297, i8* %201, align 1
  store i8 %298, i8* %202, align 1
  store i8 %299, i8* %203, align 1
  store i8 %300, i8* %204, align 1
  store i8 %301, i8* %205, align 1
  store i8 %302, i8* %206, align 1
  store i8 %303, i8* %207, align 1
  store i8 %304, i8* %208, align 1
  store i8 %305, i8* %209, align 1
  store i8 %306, i8* %210, align 1
  store i8 %307, i8* %211, align 1
  store i8 %308, i8* %212, align 1
  store i8 %309, i8* %213, align 1
  store i8 %310, i8* %214, align 1
  store i8 %311, i8* %215, align 1
  store i8 %312, i8* %216, align 1
  store i8 %313, i8* %217, align 1
  store i8 %314, i8* %218, align 1
  store i8 %315, i8* %219, align 1
  %316 = load i8, i8* %219, align 1
  %317 = insertelement <32 x i8> undef, i8 %316, i32 0
  %318 = load i8, i8* %218, align 1
  %319 = insertelement <32 x i8> %317, i8 %318, i32 1
  %320 = load i8, i8* %217, align 1
  %321 = insertelement <32 x i8> %319, i8 %320, i32 2
  %322 = load i8, i8* %216, align 1
  %323 = insertelement <32 x i8> %321, i8 %322, i32 3
  %324 = load i8, i8* %215, align 1
  %325 = insertelement <32 x i8> %323, i8 %324, i32 4
  %326 = load i8, i8* %214, align 1
  %327 = insertelement <32 x i8> %325, i8 %326, i32 5
  %328 = load i8, i8* %213, align 1
  %329 = insertelement <32 x i8> %327, i8 %328, i32 6
  %330 = load i8, i8* %212, align 1
  %331 = insertelement <32 x i8> %329, i8 %330, i32 7
  %332 = load i8, i8* %211, align 1
  %333 = insertelement <32 x i8> %331, i8 %332, i32 8
  %334 = load i8, i8* %210, align 1
  %335 = insertelement <32 x i8> %333, i8 %334, i32 9
  %336 = load i8, i8* %209, align 1
  %337 = insertelement <32 x i8> %335, i8 %336, i32 10
  %338 = load i8, i8* %208, align 1
  %339 = insertelement <32 x i8> %337, i8 %338, i32 11
  %340 = load i8, i8* %207, align 1
  %341 = insertelement <32 x i8> %339, i8 %340, i32 12
  %342 = load i8, i8* %206, align 1
  %343 = insertelement <32 x i8> %341, i8 %342, i32 13
  %344 = load i8, i8* %205, align 1
  %345 = insertelement <32 x i8> %343, i8 %344, i32 14
  %346 = load i8, i8* %204, align 1
  %347 = insertelement <32 x i8> %345, i8 %346, i32 15
  %348 = load i8, i8* %203, align 1
  %349 = insertelement <32 x i8> %347, i8 %348, i32 16
  %350 = load i8, i8* %202, align 1
  %351 = insertelement <32 x i8> %349, i8 %350, i32 17
  %352 = load i8, i8* %201, align 1
  %353 = insertelement <32 x i8> %351, i8 %352, i32 18
  %354 = load i8, i8* %200, align 1
  %355 = insertelement <32 x i8> %353, i8 %354, i32 19
  %356 = load i8, i8* %199, align 1
  %357 = insertelement <32 x i8> %355, i8 %356, i32 20
  %358 = load i8, i8* %198, align 1
  %359 = insertelement <32 x i8> %357, i8 %358, i32 21
  %360 = load i8, i8* %197, align 1
  %361 = insertelement <32 x i8> %359, i8 %360, i32 22
  %362 = load i8, i8* %196, align 1
  %363 = insertelement <32 x i8> %361, i8 %362, i32 23
  %364 = load i8, i8* %195, align 1
  %365 = insertelement <32 x i8> %363, i8 %364, i32 24
  %366 = load i8, i8* %194, align 1
  %367 = insertelement <32 x i8> %365, i8 %366, i32 25
  %368 = load i8, i8* %193, align 1
  %369 = insertelement <32 x i8> %367, i8 %368, i32 26
  %370 = load i8, i8* %192, align 1
  %371 = insertelement <32 x i8> %369, i8 %370, i32 27
  %372 = load i8, i8* %191, align 1
  %373 = insertelement <32 x i8> %371, i8 %372, i32 28
  %374 = load i8, i8* %190, align 1
  %375 = insertelement <32 x i8> %373, i8 %374, i32 29
  %376 = load i8, i8* %189, align 1
  %377 = insertelement <32 x i8> %375, i8 %376, i32 30
  %378 = load i8, i8* %188, align 1
  %379 = insertelement <32 x i8> %377, i8 %378, i32 31
  store <32 x i8> %379, <32 x i8>* %220, align 32
  %380 = load <32 x i8>, <32 x i8>* %220, align 32
  %381 = bitcast <32 x i8> %380 to <4 x i64>
  store <4 x i64> %381, <4 x i64>* %262, align 32
  store i8 16, i8* %37, align 1
  store i8 16, i8* %38, align 1
  store i8 1, i8* %39, align 1
  store i8 2, i8* %40, align 1
  store i8 4, i8* %41, align 1
  store i8 8, i8* %42, align 1
  store i8 4, i8* %43, align 1
  store i8 8, i8* %44, align 1
  store i8 16, i8* %45, align 1
  store i8 16, i8* %46, align 1
  store i8 16, i8* %47, align 1
  store i8 16, i8* %48, align 1
  store i8 16, i8* %49, align 1
  store i8 16, i8* %50, align 1
  store i8 16, i8* %51, align 1
  store i8 16, i8* %52, align 1
  store i8 16, i8* %53, align 1
  store i8 16, i8* %54, align 1
  store i8 1, i8* %55, align 1
  store i8 2, i8* %56, align 1
  store i8 4, i8* %57, align 1
  store i8 8, i8* %58, align 1
  store i8 4, i8* %59, align 1
  store i8 8, i8* %60, align 1
  store i8 16, i8* %61, align 1
  store i8 16, i8* %62, align 1
  store i8 16, i8* %63, align 1
  store i8 16, i8* %64, align 1
  store i8 16, i8* %65, align 1
  store i8 16, i8* %66, align 1
  store i8 16, i8* %67, align 1
  store i8 16, i8* %68, align 1
  %382 = load i8, i8* %68, align 1
  %383 = load i8, i8* %67, align 1
  %384 = load i8, i8* %66, align 1
  %385 = load i8, i8* %65, align 1
  %386 = load i8, i8* %64, align 1
  %387 = load i8, i8* %63, align 1
  %388 = load i8, i8* %62, align 1
  %389 = load i8, i8* %61, align 1
  %390 = load i8, i8* %60, align 1
  %391 = load i8, i8* %59, align 1
  %392 = load i8, i8* %58, align 1
  %393 = load i8, i8* %57, align 1
  %394 = load i8, i8* %56, align 1
  %395 = load i8, i8* %55, align 1
  %396 = load i8, i8* %54, align 1
  %397 = load i8, i8* %53, align 1
  %398 = load i8, i8* %52, align 1
  %399 = load i8, i8* %51, align 1
  %400 = load i8, i8* %50, align 1
  %401 = load i8, i8* %49, align 1
  %402 = load i8, i8* %48, align 1
  %403 = load i8, i8* %47, align 1
  %404 = load i8, i8* %46, align 1
  %405 = load i8, i8* %45, align 1
  %406 = load i8, i8* %44, align 1
  %407 = load i8, i8* %43, align 1
  %408 = load i8, i8* %42, align 1
  %409 = load i8, i8* %41, align 1
  %410 = load i8, i8* %40, align 1
  %411 = load i8, i8* %39, align 1
  %412 = load i8, i8* %38, align 1
  %413 = load i8, i8* %37, align 1
  store i8 %382, i8* %4, align 1
  store i8 %383, i8* %5, align 1
  store i8 %384, i8* %6, align 1
  store i8 %385, i8* %7, align 1
  store i8 %386, i8* %8, align 1
  store i8 %387, i8* %9, align 1
  store i8 %388, i8* %10, align 1
  store i8 %389, i8* %11, align 1
  store i8 %390, i8* %12, align 1
  store i8 %391, i8* %13, align 1
  store i8 %392, i8* %14, align 1
  store i8 %393, i8* %15, align 1
  store i8 %394, i8* %16, align 1
  store i8 %395, i8* %17, align 1
  store i8 %396, i8* %18, align 1
  store i8 %397, i8* %19, align 1
  store i8 %398, i8* %20, align 1
  store i8 %399, i8* %21, align 1
  store i8 %400, i8* %22, align 1
  store i8 %401, i8* %23, align 1
  store i8 %402, i8* %24, align 1
  store i8 %403, i8* %25, align 1
  store i8 %404, i8* %26, align 1
  store i8 %405, i8* %27, align 1
  store i8 %406, i8* %28, align 1
  store i8 %407, i8* %29, align 1
  store i8 %408, i8* %30, align 1
  store i8 %409, i8* %31, align 1
  store i8 %410, i8* %32, align 1
  store i8 %411, i8* %33, align 1
  store i8 %412, i8* %34, align 1
  store i8 %413, i8* %35, align 1
  %414 = load i8, i8* %35, align 1
  %415 = insertelement <32 x i8> undef, i8 %414, i32 0
  %416 = load i8, i8* %34, align 1
  %417 = insertelement <32 x i8> %415, i8 %416, i32 1
  %418 = load i8, i8* %33, align 1
  %419 = insertelement <32 x i8> %417, i8 %418, i32 2
  %420 = load i8, i8* %32, align 1
  %421 = insertelement <32 x i8> %419, i8 %420, i32 3
  %422 = load i8, i8* %31, align 1
  %423 = insertelement <32 x i8> %421, i8 %422, i32 4
  %424 = load i8, i8* %30, align 1
  %425 = insertelement <32 x i8> %423, i8 %424, i32 5
  %426 = load i8, i8* %29, align 1
  %427 = insertelement <32 x i8> %425, i8 %426, i32 6
  %428 = load i8, i8* %28, align 1
  %429 = insertelement <32 x i8> %427, i8 %428, i32 7
  %430 = load i8, i8* %27, align 1
  %431 = insertelement <32 x i8> %429, i8 %430, i32 8
  %432 = load i8, i8* %26, align 1
  %433 = insertelement <32 x i8> %431, i8 %432, i32 9
  %434 = load i8, i8* %25, align 1
  %435 = insertelement <32 x i8> %433, i8 %434, i32 10
  %436 = load i8, i8* %24, align 1
  %437 = insertelement <32 x i8> %435, i8 %436, i32 11
  %438 = load i8, i8* %23, align 1
  %439 = insertelement <32 x i8> %437, i8 %438, i32 12
  %440 = load i8, i8* %22, align 1
  %441 = insertelement <32 x i8> %439, i8 %440, i32 13
  %442 = load i8, i8* %21, align 1
  %443 = insertelement <32 x i8> %441, i8 %442, i32 14
  %444 = load i8, i8* %20, align 1
  %445 = insertelement <32 x i8> %443, i8 %444, i32 15
  %446 = load i8, i8* %19, align 1
  %447 = insertelement <32 x i8> %445, i8 %446, i32 16
  %448 = load i8, i8* %18, align 1
  %449 = insertelement <32 x i8> %447, i8 %448, i32 17
  %450 = load i8, i8* %17, align 1
  %451 = insertelement <32 x i8> %449, i8 %450, i32 18
  %452 = load i8, i8* %16, align 1
  %453 = insertelement <32 x i8> %451, i8 %452, i32 19
  %454 = load i8, i8* %15, align 1
  %455 = insertelement <32 x i8> %453, i8 %454, i32 20
  %456 = load i8, i8* %14, align 1
  %457 = insertelement <32 x i8> %455, i8 %456, i32 21
  %458 = load i8, i8* %13, align 1
  %459 = insertelement <32 x i8> %457, i8 %458, i32 22
  %460 = load i8, i8* %12, align 1
  %461 = insertelement <32 x i8> %459, i8 %460, i32 23
  %462 = load i8, i8* %11, align 1
  %463 = insertelement <32 x i8> %461, i8 %462, i32 24
  %464 = load i8, i8* %10, align 1
  %465 = insertelement <32 x i8> %463, i8 %464, i32 25
  %466 = load i8, i8* %9, align 1
  %467 = insertelement <32 x i8> %465, i8 %466, i32 26
  %468 = load i8, i8* %8, align 1
  %469 = insertelement <32 x i8> %467, i8 %468, i32 27
  %470 = load i8, i8* %7, align 1
  %471 = insertelement <32 x i8> %469, i8 %470, i32 28
  %472 = load i8, i8* %6, align 1
  %473 = insertelement <32 x i8> %471, i8 %472, i32 29
  %474 = load i8, i8* %5, align 1
  %475 = insertelement <32 x i8> %473, i8 %474, i32 30
  %476 = load i8, i8* %4, align 1
  %477 = insertelement <32 x i8> %475, i8 %476, i32 31
  store <32 x i8> %477, <32 x i8>* %36, align 32
  %478 = load <32 x i8>, <32 x i8>* %36, align 32
  %479 = bitcast <32 x i8> %478 to <4 x i64>
  store <4 x i64> %479, <4 x i64>* %263, align 32
  store i8 0, i8* %102, align 1
  store i8 16, i8* %103, align 1
  store i8 19, i8* %104, align 1
  store i8 4, i8* %105, align 1
  store i8 -65, i8* %106, align 1
  store i8 -65, i8* %107, align 1
  store i8 -71, i8* %108, align 1
  store i8 -71, i8* %109, align 1
  store i8 0, i8* %110, align 1
  store i8 0, i8* %111, align 1
  store i8 0, i8* %112, align 1
  store i8 0, i8* %113, align 1
  store i8 0, i8* %114, align 1
  store i8 0, i8* %115, align 1
  store i8 0, i8* %116, align 1
  store i8 0, i8* %117, align 1
  store i8 0, i8* %118, align 1
  store i8 16, i8* %119, align 1
  store i8 19, i8* %120, align 1
  store i8 4, i8* %121, align 1
  store i8 -65, i8* %122, align 1
  store i8 -65, i8* %123, align 1
  store i8 -71, i8* %124, align 1
  store i8 -71, i8* %125, align 1
  store i8 0, i8* %126, align 1
  store i8 0, i8* %127, align 1
  store i8 0, i8* %128, align 1
  store i8 0, i8* %129, align 1
  store i8 0, i8* %130, align 1
  store i8 0, i8* %131, align 1
  store i8 0, i8* %132, align 1
  store i8 0, i8* %133, align 1
  %480 = load i8, i8* %133, align 1
  %481 = load i8, i8* %132, align 1
  %482 = load i8, i8* %131, align 1
  %483 = load i8, i8* %130, align 1
  %484 = load i8, i8* %129, align 1
  %485 = load i8, i8* %128, align 1
  %486 = load i8, i8* %127, align 1
  %487 = load i8, i8* %126, align 1
  %488 = load i8, i8* %125, align 1
  %489 = load i8, i8* %124, align 1
  %490 = load i8, i8* %123, align 1
  %491 = load i8, i8* %122, align 1
  %492 = load i8, i8* %121, align 1
  %493 = load i8, i8* %120, align 1
  %494 = load i8, i8* %119, align 1
  %495 = load i8, i8* %118, align 1
  %496 = load i8, i8* %117, align 1
  %497 = load i8, i8* %116, align 1
  %498 = load i8, i8* %115, align 1
  %499 = load i8, i8* %114, align 1
  %500 = load i8, i8* %113, align 1
  %501 = load i8, i8* %112, align 1
  %502 = load i8, i8* %111, align 1
  %503 = load i8, i8* %110, align 1
  %504 = load i8, i8* %109, align 1
  %505 = load i8, i8* %108, align 1
  %506 = load i8, i8* %107, align 1
  %507 = load i8, i8* %106, align 1
  %508 = load i8, i8* %105, align 1
  %509 = load i8, i8* %104, align 1
  %510 = load i8, i8* %103, align 1
  %511 = load i8, i8* %102, align 1
  store i8 %480, i8* %69, align 1
  store i8 %481, i8* %70, align 1
  store i8 %482, i8* %71, align 1
  store i8 %483, i8* %72, align 1
  store i8 %484, i8* %73, align 1
  store i8 %485, i8* %74, align 1
  store i8 %486, i8* %75, align 1
  store i8 %487, i8* %76, align 1
  store i8 %488, i8* %77, align 1
  store i8 %489, i8* %78, align 1
  store i8 %490, i8* %79, align 1
  store i8 %491, i8* %80, align 1
  store i8 %492, i8* %81, align 1
  store i8 %493, i8* %82, align 1
  store i8 %494, i8* %83, align 1
  store i8 %495, i8* %84, align 1
  store i8 %496, i8* %85, align 1
  store i8 %497, i8* %86, align 1
  store i8 %498, i8* %87, align 1
  store i8 %499, i8* %88, align 1
  store i8 %500, i8* %89, align 1
  store i8 %501, i8* %90, align 1
  store i8 %502, i8* %91, align 1
  store i8 %503, i8* %92, align 1
  store i8 %504, i8* %93, align 1
  store i8 %505, i8* %94, align 1
  store i8 %506, i8* %95, align 1
  store i8 %507, i8* %96, align 1
  store i8 %508, i8* %97, align 1
  store i8 %509, i8* %98, align 1
  store i8 %510, i8* %99, align 1
  store i8 %511, i8* %100, align 1
  %512 = load i8, i8* %100, align 1
  %513 = insertelement <32 x i8> undef, i8 %512, i32 0
  %514 = load i8, i8* %99, align 1
  %515 = insertelement <32 x i8> %513, i8 %514, i32 1
  %516 = load i8, i8* %98, align 1
  %517 = insertelement <32 x i8> %515, i8 %516, i32 2
  %518 = load i8, i8* %97, align 1
  %519 = insertelement <32 x i8> %517, i8 %518, i32 3
  %520 = load i8, i8* %96, align 1
  %521 = insertelement <32 x i8> %519, i8 %520, i32 4
  %522 = load i8, i8* %95, align 1
  %523 = insertelement <32 x i8> %521, i8 %522, i32 5
  %524 = load i8, i8* %94, align 1
  %525 = insertelement <32 x i8> %523, i8 %524, i32 6
  %526 = load i8, i8* %93, align 1
  %527 = insertelement <32 x i8> %525, i8 %526, i32 7
  %528 = load i8, i8* %92, align 1
  %529 = insertelement <32 x i8> %527, i8 %528, i32 8
  %530 = load i8, i8* %91, align 1
  %531 = insertelement <32 x i8> %529, i8 %530, i32 9
  %532 = load i8, i8* %90, align 1
  %533 = insertelement <32 x i8> %531, i8 %532, i32 10
  %534 = load i8, i8* %89, align 1
  %535 = insertelement <32 x i8> %533, i8 %534, i32 11
  %536 = load i8, i8* %88, align 1
  %537 = insertelement <32 x i8> %535, i8 %536, i32 12
  %538 = load i8, i8* %87, align 1
  %539 = insertelement <32 x i8> %537, i8 %538, i32 13
  %540 = load i8, i8* %86, align 1
  %541 = insertelement <32 x i8> %539, i8 %540, i32 14
  %542 = load i8, i8* %85, align 1
  %543 = insertelement <32 x i8> %541, i8 %542, i32 15
  %544 = load i8, i8* %84, align 1
  %545 = insertelement <32 x i8> %543, i8 %544, i32 16
  %546 = load i8, i8* %83, align 1
  %547 = insertelement <32 x i8> %545, i8 %546, i32 17
  %548 = load i8, i8* %82, align 1
  %549 = insertelement <32 x i8> %547, i8 %548, i32 18
  %550 = load i8, i8* %81, align 1
  %551 = insertelement <32 x i8> %549, i8 %550, i32 19
  %552 = load i8, i8* %80, align 1
  %553 = insertelement <32 x i8> %551, i8 %552, i32 20
  %554 = load i8, i8* %79, align 1
  %555 = insertelement <32 x i8> %553, i8 %554, i32 21
  %556 = load i8, i8* %78, align 1
  %557 = insertelement <32 x i8> %555, i8 %556, i32 22
  %558 = load i8, i8* %77, align 1
  %559 = insertelement <32 x i8> %557, i8 %558, i32 23
  %560 = load i8, i8* %76, align 1
  %561 = insertelement <32 x i8> %559, i8 %560, i32 24
  %562 = load i8, i8* %75, align 1
  %563 = insertelement <32 x i8> %561, i8 %562, i32 25
  %564 = load i8, i8* %74, align 1
  %565 = insertelement <32 x i8> %563, i8 %564, i32 26
  %566 = load i8, i8* %73, align 1
  %567 = insertelement <32 x i8> %565, i8 %566, i32 27
  %568 = load i8, i8* %72, align 1
  %569 = insertelement <32 x i8> %567, i8 %568, i32 28
  %570 = load i8, i8* %71, align 1
  %571 = insertelement <32 x i8> %569, i8 %570, i32 29
  %572 = load i8, i8* %70, align 1
  %573 = insertelement <32 x i8> %571, i8 %572, i32 30
  %574 = load i8, i8* %69, align 1
  %575 = insertelement <32 x i8> %573, i8 %574, i32 31
  store <32 x i8> %575, <32 x i8>* %101, align 32
  %576 = load <32 x i8>, <32 x i8>* %101, align 32
  %577 = bitcast <32 x i8> %576 to <4 x i64>
  store <4 x i64> %577, <4 x i64>* %264, align 32
  store i8 47, i8* %167, align 1
  %578 = load i8, i8* %167, align 1
  %579 = load i8, i8* %167, align 1
  %580 = load i8, i8* %167, align 1
  %581 = load i8, i8* %167, align 1
  %582 = load i8, i8* %167, align 1
  %583 = load i8, i8* %167, align 1
  %584 = load i8, i8* %167, align 1
  %585 = load i8, i8* %167, align 1
  %586 = load i8, i8* %167, align 1
  %587 = load i8, i8* %167, align 1
  %588 = load i8, i8* %167, align 1
  %589 = load i8, i8* %167, align 1
  %590 = load i8, i8* %167, align 1
  %591 = load i8, i8* %167, align 1
  %592 = load i8, i8* %167, align 1
  %593 = load i8, i8* %167, align 1
  %594 = load i8, i8* %167, align 1
  %595 = load i8, i8* %167, align 1
  %596 = load i8, i8* %167, align 1
  %597 = load i8, i8* %167, align 1
  %598 = load i8, i8* %167, align 1
  %599 = load i8, i8* %167, align 1
  %600 = load i8, i8* %167, align 1
  %601 = load i8, i8* %167, align 1
  %602 = load i8, i8* %167, align 1
  %603 = load i8, i8* %167, align 1
  %604 = load i8, i8* %167, align 1
  %605 = load i8, i8* %167, align 1
  %606 = load i8, i8* %167, align 1
  %607 = load i8, i8* %167, align 1
  %608 = load i8, i8* %167, align 1
  %609 = load i8, i8* %167, align 1
  store i8 %578, i8* %134, align 1
  store i8 %579, i8* %135, align 1
  store i8 %580, i8* %136, align 1
  store i8 %581, i8* %137, align 1
  store i8 %582, i8* %138, align 1
  store i8 %583, i8* %139, align 1
  store i8 %584, i8* %140, align 1
  store i8 %585, i8* %141, align 1
  store i8 %586, i8* %142, align 1
  store i8 %587, i8* %143, align 1
  store i8 %588, i8* %144, align 1
  store i8 %589, i8* %145, align 1
  store i8 %590, i8* %146, align 1
  store i8 %591, i8* %147, align 1
  store i8 %592, i8* %148, align 1
  store i8 %593, i8* %149, align 1
  store i8 %594, i8* %150, align 1
  store i8 %595, i8* %151, align 1
  store i8 %596, i8* %152, align 1
  store i8 %597, i8* %153, align 1
  store i8 %598, i8* %154, align 1
  store i8 %599, i8* %155, align 1
  store i8 %600, i8* %156, align 1
  store i8 %601, i8* %157, align 1
  store i8 %602, i8* %158, align 1
  store i8 %603, i8* %159, align 1
  store i8 %604, i8* %160, align 1
  store i8 %605, i8* %161, align 1
  store i8 %606, i8* %162, align 1
  store i8 %607, i8* %163, align 1
  store i8 %608, i8* %164, align 1
  store i8 %609, i8* %165, align 1
  %610 = load i8, i8* %165, align 1
  %611 = insertelement <32 x i8> undef, i8 %610, i32 0
  %612 = load i8, i8* %164, align 1
  %613 = insertelement <32 x i8> %611, i8 %612, i32 1
  %614 = load i8, i8* %163, align 1
  %615 = insertelement <32 x i8> %613, i8 %614, i32 2
  %616 = load i8, i8* %162, align 1
  %617 = insertelement <32 x i8> %615, i8 %616, i32 3
  %618 = load i8, i8* %161, align 1
  %619 = insertelement <32 x i8> %617, i8 %618, i32 4
  %620 = load i8, i8* %160, align 1
  %621 = insertelement <32 x i8> %619, i8 %620, i32 5
  %622 = load i8, i8* %159, align 1
  %623 = insertelement <32 x i8> %621, i8 %622, i32 6
  %624 = load i8, i8* %158, align 1
  %625 = insertelement <32 x i8> %623, i8 %624, i32 7
  %626 = load i8, i8* %157, align 1
  %627 = insertelement <32 x i8> %625, i8 %626, i32 8
  %628 = load i8, i8* %156, align 1
  %629 = insertelement <32 x i8> %627, i8 %628, i32 9
  %630 = load i8, i8* %155, align 1
  %631 = insertelement <32 x i8> %629, i8 %630, i32 10
  %632 = load i8, i8* %154, align 1
  %633 = insertelement <32 x i8> %631, i8 %632, i32 11
  %634 = load i8, i8* %153, align 1
  %635 = insertelement <32 x i8> %633, i8 %634, i32 12
  %636 = load i8, i8* %152, align 1
  %637 = insertelement <32 x i8> %635, i8 %636, i32 13
  %638 = load i8, i8* %151, align 1
  %639 = insertelement <32 x i8> %637, i8 %638, i32 14
  %640 = load i8, i8* %150, align 1
  %641 = insertelement <32 x i8> %639, i8 %640, i32 15
  %642 = load i8, i8* %149, align 1
  %643 = insertelement <32 x i8> %641, i8 %642, i32 16
  %644 = load i8, i8* %148, align 1
  %645 = insertelement <32 x i8> %643, i8 %644, i32 17
  %646 = load i8, i8* %147, align 1
  %647 = insertelement <32 x i8> %645, i8 %646, i32 18
  %648 = load i8, i8* %146, align 1
  %649 = insertelement <32 x i8> %647, i8 %648, i32 19
  %650 = load i8, i8* %145, align 1
  %651 = insertelement <32 x i8> %649, i8 %650, i32 20
  %652 = load i8, i8* %144, align 1
  %653 = insertelement <32 x i8> %651, i8 %652, i32 21
  %654 = load i8, i8* %143, align 1
  %655 = insertelement <32 x i8> %653, i8 %654, i32 22
  %656 = load i8, i8* %142, align 1
  %657 = insertelement <32 x i8> %655, i8 %656, i32 23
  %658 = load i8, i8* %141, align 1
  %659 = insertelement <32 x i8> %657, i8 %658, i32 24
  %660 = load i8, i8* %140, align 1
  %661 = insertelement <32 x i8> %659, i8 %660, i32 25
  %662 = load i8, i8* %139, align 1
  %663 = insertelement <32 x i8> %661, i8 %662, i32 26
  %664 = load i8, i8* %138, align 1
  %665 = insertelement <32 x i8> %663, i8 %664, i32 27
  %666 = load i8, i8* %137, align 1
  %667 = insertelement <32 x i8> %665, i8 %666, i32 28
  %668 = load i8, i8* %136, align 1
  %669 = insertelement <32 x i8> %667, i8 %668, i32 29
  %670 = load i8, i8* %135, align 1
  %671 = insertelement <32 x i8> %669, i8 %670, i32 30
  %672 = load i8, i8* %134, align 1
  %673 = insertelement <32 x i8> %671, i8 %672, i32 31
  store <32 x i8> %673, <32 x i8>* %166, align 32
  %674 = load <32 x i8>, <32 x i8>* %166, align 32
  %675 = bitcast <32 x i8> %674 to <4 x i64>
  store <4 x i64> %675, <4 x i64>* %265, align 32
  %676 = load <4 x i64>, <4 x i64>* %261, align 32
  store <4 x i64> %676, <4 x i64>* %168, align 32
  store i32 4, i32* %169, align 4
  %677 = load <4 x i64>, <4 x i64>* %168, align 32
  %678 = bitcast <4 x i64> %677 to <8 x i32>
  %679 = load i32, i32* %169, align 4
  %680 = call <8 x i32> @llvm.x86.avx2.psrli.d(<8 x i32> %678, i32 %679) #5
  %681 = bitcast <8 x i32> %680 to <4 x i64>
  store <4 x i64> %681, <4 x i64>* %266, align 32
  %682 = load <4 x i64>, <4 x i64>* %261, align 32
  %683 = load <4 x i64>, <4 x i64>* %265, align 32
  store <4 x i64> %682, <4 x i64>* %170, align 32
  store <4 x i64> %683, <4 x i64>* %171, align 32
  %684 = load <4 x i64>, <4 x i64>* %170, align 32
  %685 = load <4 x i64>, <4 x i64>* %171, align 32
  %686 = and <4 x i64> %684, %685
  store <4 x i64> %686, <4 x i64>* %267, align 32
  %687 = load <4 x i64>, <4 x i64>* %262, align 32
  %688 = load <4 x i64>, <4 x i64>* %267, align 32
  store <4 x i64> %687, <4 x i64>* %172, align 32
  store <4 x i64> %688, <4 x i64>* %173, align 32
  %689 = load <4 x i64>, <4 x i64>* %172, align 32
  %690 = bitcast <4 x i64> %689 to <32 x i8>
  %691 = load <4 x i64>, <4 x i64>* %173, align 32
  %692 = bitcast <4 x i64> %691 to <32 x i8>
  %693 = call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %690, <32 x i8> %692) #5
  %694 = bitcast <32 x i8> %693 to <4 x i64>
  store <4 x i64> %694, <4 x i64>* %268, align 32
  %695 = load <4 x i64>, <4 x i64>* %261, align 32
  %696 = load <4 x i64>, <4 x i64>* %265, align 32
  store <4 x i64> %695, <4 x i64>* %174, align 32
  store <4 x i64> %696, <4 x i64>* %175, align 32
  %697 = load <4 x i64>, <4 x i64>* %174, align 32
  %698 = bitcast <4 x i64> %697 to <32 x i8>
  %699 = load <4 x i64>, <4 x i64>* %175, align 32
  %700 = bitcast <4 x i64> %699 to <32 x i8>
  %701 = icmp eq <32 x i8> %698, %700
  %702 = sext <32 x i1> %701 to <32 x i8>
  %703 = bitcast <32 x i8> %702 to <4 x i64>
  store <4 x i64> %703, <4 x i64>* %269, align 32
  %704 = load <4 x i64>, <4 x i64>* %266, align 32
  %705 = load <4 x i64>, <4 x i64>* %265, align 32
  store <4 x i64> %704, <4 x i64>* %176, align 32
  store <4 x i64> %705, <4 x i64>* %177, align 32
  %706 = load <4 x i64>, <4 x i64>* %176, align 32
  %707 = load <4 x i64>, <4 x i64>* %177, align 32
  %708 = and <4 x i64> %706, %707
  store <4 x i64> %708, <4 x i64>* %266, align 32
  %709 = load <4 x i64>, <4 x i64>* %263, align 32
  %710 = load <4 x i64>, <4 x i64>* %266, align 32
  store <4 x i64> %709, <4 x i64>* %178, align 32
  store <4 x i64> %710, <4 x i64>* %179, align 32
  %711 = load <4 x i64>, <4 x i64>* %178, align 32
  %712 = bitcast <4 x i64> %711 to <32 x i8>
  %713 = load <4 x i64>, <4 x i64>* %179, align 32
  %714 = bitcast <4 x i64> %713 to <32 x i8>
  %715 = call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %712, <32 x i8> %714) #5
  %716 = bitcast <32 x i8> %715 to <4 x i64>
  store <4 x i64> %716, <4 x i64>* %270, align 32
  %717 = load <4 x i64>, <4 x i64>* %264, align 32
  %718 = load <4 x i64>, <4 x i64>* %269, align 32
  %719 = load <4 x i64>, <4 x i64>* %266, align 32
  store <4 x i64> %718, <4 x i64>* %180, align 32
  store <4 x i64> %719, <4 x i64>* %181, align 32
  %720 = load <4 x i64>, <4 x i64>* %180, align 32
  %721 = bitcast <4 x i64> %720 to <32 x i8>
  %722 = load <4 x i64>, <4 x i64>* %181, align 32
  %723 = bitcast <4 x i64> %722 to <32 x i8>
  %724 = add <32 x i8> %721, %723
  %725 = bitcast <32 x i8> %724 to <4 x i64>
  store <4 x i64> %717, <4 x i64>* %182, align 32
  store <4 x i64> %725, <4 x i64>* %183, align 32
  %726 = load <4 x i64>, <4 x i64>* %182, align 32
  %727 = bitcast <4 x i64> %726 to <32 x i8>
  %728 = load <4 x i64>, <4 x i64>* %183, align 32
  %729 = bitcast <4 x i64> %728 to <32 x i8>
  %730 = call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %727, <32 x i8> %729) #5
  %731 = bitcast <32 x i8> %730 to <4 x i64>
  store <4 x i64> %731, <4 x i64>* %271, align 32
  %732 = load <4 x i64>, <4 x i64>* %268, align 32
  %733 = load <4 x i64>, <4 x i64>* %270, align 32
  store <4 x i64> %732, <4 x i64>* %184, align 32
  store <4 x i64> %733, <4 x i64>* %185, align 32
  %734 = load <4 x i64>, <4 x i64>* %184, align 32
  %735 = load <4 x i64>, <4 x i64>* %185, align 32
  %736 = call i32 @llvm.x86.avx.ptestz.256(<4 x i64> %734, <4 x i64> %735) #5
  %737 = icmp ne i32 %736, 0
  br i1 %737, label %739, label %738

738:                                              ; preds = %277
  br label %763

739:                                              ; preds = %277
  %740 = load <4 x i64>, <4 x i64>* %261, align 32
  %741 = load <4 x i64>, <4 x i64>* %271, align 32
  store <4 x i64> %740, <4 x i64>* %186, align 32
  store <4 x i64> %741, <4 x i64>* %187, align 32
  %742 = load <4 x i64>, <4 x i64>* %186, align 32
  %743 = bitcast <4 x i64> %742 to <32 x i8>
  %744 = load <4 x i64>, <4 x i64>* %187, align 32
  %745 = bitcast <4 x i64> %744 to <32 x i8>
  %746 = add <32 x i8> %743, %745
  %747 = bitcast <32 x i8> %746 to <4 x i64>
  store <4 x i64> %747, <4 x i64>* %261, align 32
  %748 = load i64, i64* %259, align 8
  %749 = sub i64 %748, 32
  store i64 %749, i64* %259, align 8
  %750 = load i8*, i8** %258, align 8
  %751 = getelementptr inbounds i8, i8* %750, i64 32
  store i8* %751, i8** %258, align 8
  %752 = load <4 x i64>, <4 x i64>* %261, align 32
  %753 = call <4 x i64> @dec_reshuffle(<4 x i64> %752)
  store <4 x i64> %753, <4 x i64>* %261, align 32
  %754 = load i8*, i8** %257, align 8
  %755 = bitcast i8* %754 to <4 x i64>*
  %756 = load <4 x i64>, <4 x i64>* %261, align 32
  store <4 x i64>* %755, <4 x i64>** %253, align 8
  store <4 x i64> %756, <4 x i64>* %254, align 32
  %757 = load <4 x i64>, <4 x i64>* %254, align 32
  %758 = load <4 x i64>*, <4 x i64>** %253, align 8
  %759 = bitcast <4 x i64>* %758 to %struct.__storeu_si256*
  %760 = getelementptr inbounds %struct.__storeu_si256, %struct.__storeu_si256* %759, i32 0, i32 0
  store <4 x i64> %757, <4 x i64>* %760, align 1
  %761 = load i8*, i8** %257, align 8
  %762 = getelementptr inbounds i8, i8* %761, i64 24
  store i8* %762, i8** %257, align 8
  br label %274, !llvm.loop !3

763:                                              ; preds = %738, %274
  %764 = load i8*, i8** %257, align 8
  %765 = load i8*, i8** %258, align 8
  %766 = load i64, i64* %259, align 8
  %767 = call i64 @chromium_base64_decode(i8* %764, i8* %765, i64 %766)
  store i64 %767, i64* %272, align 8
  %768 = load i64, i64* %272, align 8
  %769 = icmp eq i64 %768, -1
  br i1 %769, label %770, label %771

770:                                              ; preds = %763
  store i64 -1, i64* %256, align 8
  br label %779

771:                                              ; preds = %763
  %772 = load i8*, i8** %257, align 8
  %773 = load i8*, i8** %260, align 8
  %774 = ptrtoint i8* %772 to i64
  %775 = ptrtoint i8* %773 to i64
  %776 = sub i64 %774, %775
  %777 = load i64, i64* %272, align 8
  %778 = add i64 %776, %777
  store i64 %778, i64* %256, align 8
  br label %779

779:                                              ; preds = %771, %770
  %780 = load i64, i64* %256, align 8
  ret i64 %780
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal <4 x i64> @dec_reshuffle(<4 x i64> %0) #0 {
  %2 = alloca <4 x i64>, align 32
  %3 = alloca <4 x i64>, align 32
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca <8 x i32>, align 32
  %13 = alloca i32, align 4
  %14 = alloca <4 x i64>, align 32
  %15 = alloca <4 x i64>, align 32
  %16 = alloca i8, align 1
  %17 = alloca i8, align 1
  %18 = alloca i8, align 1
  %19 = alloca i8, align 1
  %20 = alloca i8, align 1
  %21 = alloca i8, align 1
  %22 = alloca i8, align 1
  %23 = alloca i8, align 1
  %24 = alloca i8, align 1
  %25 = alloca i8, align 1
  %26 = alloca i8, align 1
  %27 = alloca i8, align 1
  %28 = alloca i8, align 1
  %29 = alloca i8, align 1
  %30 = alloca i8, align 1
  %31 = alloca i8, align 1
  %32 = alloca i8, align 1
  %33 = alloca i8, align 1
  %34 = alloca i8, align 1
  %35 = alloca i8, align 1
  %36 = alloca i8, align 1
  %37 = alloca i8, align 1
  %38 = alloca i8, align 1
  %39 = alloca i8, align 1
  %40 = alloca i8, align 1
  %41 = alloca i8, align 1
  %42 = alloca i8, align 1
  %43 = alloca i8, align 1
  %44 = alloca i8, align 1
  %45 = alloca i8, align 1
  %46 = alloca i8, align 1
  %47 = alloca i8, align 1
  %48 = alloca <32 x i8>, align 32
  %49 = alloca i8, align 1
  %50 = alloca i8, align 1
  %51 = alloca i8, align 1
  %52 = alloca i8, align 1
  %53 = alloca i8, align 1
  %54 = alloca i8, align 1
  %55 = alloca i8, align 1
  %56 = alloca i8, align 1
  %57 = alloca i8, align 1
  %58 = alloca i8, align 1
  %59 = alloca i8, align 1
  %60 = alloca i8, align 1
  %61 = alloca i8, align 1
  %62 = alloca i8, align 1
  %63 = alloca i8, align 1
  %64 = alloca i8, align 1
  %65 = alloca i8, align 1
  %66 = alloca i8, align 1
  %67 = alloca i8, align 1
  %68 = alloca i8, align 1
  %69 = alloca i8, align 1
  %70 = alloca i8, align 1
  %71 = alloca i8, align 1
  %72 = alloca i8, align 1
  %73 = alloca i8, align 1
  %74 = alloca i8, align 1
  %75 = alloca i8, align 1
  %76 = alloca i8, align 1
  %77 = alloca i8, align 1
  %78 = alloca i8, align 1
  %79 = alloca i8, align 1
  %80 = alloca i8, align 1
  %81 = alloca <4 x i64>, align 32
  %82 = alloca <4 x i64>, align 32
  %83 = alloca i32, align 4
  %84 = alloca i32, align 4
  %85 = alloca i32, align 4
  %86 = alloca i32, align 4
  %87 = alloca i32, align 4
  %88 = alloca i32, align 4
  %89 = alloca i32, align 4
  %90 = alloca i32, align 4
  %91 = alloca <8 x i32>, align 32
  %92 = alloca i32, align 4
  %93 = alloca i32, align 4
  %94 = alloca i32, align 4
  %95 = alloca i32, align 4
  %96 = alloca i32, align 4
  %97 = alloca i32, align 4
  %98 = alloca i32, align 4
  %99 = alloca i32, align 4
  %100 = alloca <4 x i64>, align 32
  %101 = alloca <4 x i64>, align 32
  %102 = alloca i32, align 4
  %103 = alloca i32, align 4
  %104 = alloca i32, align 4
  %105 = alloca i32, align 4
  %106 = alloca i32, align 4
  %107 = alloca i32, align 4
  %108 = alloca i32, align 4
  %109 = alloca i32, align 4
  %110 = alloca <8 x i32>, align 32
  %111 = alloca i32, align 4
  %112 = alloca <4 x i64>, align 32
  %113 = alloca <4 x i64>, align 32
  %114 = alloca <4 x i64>, align 32
  store <4 x i64> %0, <4 x i64>* %112, align 32
  %115 = load <4 x i64>, <4 x i64>* %112, align 32
  store i32 20971840, i32* %111, align 4
  %116 = load i32, i32* %111, align 4
  %117 = load i32, i32* %111, align 4
  %118 = load i32, i32* %111, align 4
  %119 = load i32, i32* %111, align 4
  %120 = load i32, i32* %111, align 4
  %121 = load i32, i32* %111, align 4
  %122 = load i32, i32* %111, align 4
  %123 = load i32, i32* %111, align 4
  store i32 %116, i32* %102, align 4
  store i32 %117, i32* %103, align 4
  store i32 %118, i32* %104, align 4
  store i32 %119, i32* %105, align 4
  store i32 %120, i32* %106, align 4
  store i32 %121, i32* %107, align 4
  store i32 %122, i32* %108, align 4
  store i32 %123, i32* %109, align 4
  %124 = load i32, i32* %109, align 4
  %125 = insertelement <8 x i32> undef, i32 %124, i32 0
  %126 = load i32, i32* %108, align 4
  %127 = insertelement <8 x i32> %125, i32 %126, i32 1
  %128 = load i32, i32* %107, align 4
  %129 = insertelement <8 x i32> %127, i32 %128, i32 2
  %130 = load i32, i32* %106, align 4
  %131 = insertelement <8 x i32> %129, i32 %130, i32 3
  %132 = load i32, i32* %105, align 4
  %133 = insertelement <8 x i32> %131, i32 %132, i32 4
  %134 = load i32, i32* %104, align 4
  %135 = insertelement <8 x i32> %133, i32 %134, i32 5
  %136 = load i32, i32* %103, align 4
  %137 = insertelement <8 x i32> %135, i32 %136, i32 6
  %138 = load i32, i32* %102, align 4
  %139 = insertelement <8 x i32> %137, i32 %138, i32 7
  store <8 x i32> %139, <8 x i32>* %110, align 32
  %140 = load <8 x i32>, <8 x i32>* %110, align 32
  %141 = bitcast <8 x i32> %140 to <4 x i64>
  store <4 x i64> %115, <4 x i64>* %2, align 32
  store <4 x i64> %141, <4 x i64>* %3, align 32
  %142 = load <4 x i64>, <4 x i64>* %2, align 32
  %143 = bitcast <4 x i64> %142 to <32 x i8>
  %144 = load <4 x i64>, <4 x i64>* %3, align 32
  %145 = bitcast <4 x i64> %144 to <32 x i8>
  %146 = call <16 x i16> @llvm.x86.avx2.pmadd.ub.sw(<32 x i8> %143, <32 x i8> %145) #5
  %147 = bitcast <16 x i16> %146 to <4 x i64>
  store <4 x i64> %147, <4 x i64>* %113, align 32
  %148 = load <4 x i64>, <4 x i64>* %113, align 32
  store i32 69632, i32* %13, align 4
  %149 = load i32, i32* %13, align 4
  %150 = load i32, i32* %13, align 4
  %151 = load i32, i32* %13, align 4
  %152 = load i32, i32* %13, align 4
  %153 = load i32, i32* %13, align 4
  %154 = load i32, i32* %13, align 4
  %155 = load i32, i32* %13, align 4
  %156 = load i32, i32* %13, align 4
  store i32 %149, i32* %4, align 4
  store i32 %150, i32* %5, align 4
  store i32 %151, i32* %6, align 4
  store i32 %152, i32* %7, align 4
  store i32 %153, i32* %8, align 4
  store i32 %154, i32* %9, align 4
  store i32 %155, i32* %10, align 4
  store i32 %156, i32* %11, align 4
  %157 = load i32, i32* %11, align 4
  %158 = insertelement <8 x i32> undef, i32 %157, i32 0
  %159 = load i32, i32* %10, align 4
  %160 = insertelement <8 x i32> %158, i32 %159, i32 1
  %161 = load i32, i32* %9, align 4
  %162 = insertelement <8 x i32> %160, i32 %161, i32 2
  %163 = load i32, i32* %8, align 4
  %164 = insertelement <8 x i32> %162, i32 %163, i32 3
  %165 = load i32, i32* %7, align 4
  %166 = insertelement <8 x i32> %164, i32 %165, i32 4
  %167 = load i32, i32* %6, align 4
  %168 = insertelement <8 x i32> %166, i32 %167, i32 5
  %169 = load i32, i32* %5, align 4
  %170 = insertelement <8 x i32> %168, i32 %169, i32 6
  %171 = load i32, i32* %4, align 4
  %172 = insertelement <8 x i32> %170, i32 %171, i32 7
  store <8 x i32> %172, <8 x i32>* %12, align 32
  %173 = load <8 x i32>, <8 x i32>* %12, align 32
  %174 = bitcast <8 x i32> %173 to <4 x i64>
  store <4 x i64> %148, <4 x i64>* %14, align 32
  store <4 x i64> %174, <4 x i64>* %15, align 32
  %175 = load <4 x i64>, <4 x i64>* %14, align 32
  %176 = bitcast <4 x i64> %175 to <16 x i16>
  %177 = load <4 x i64>, <4 x i64>* %15, align 32
  %178 = bitcast <4 x i64> %177 to <16 x i16>
  %179 = call <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16> %176, <16 x i16> %178) #5
  %180 = bitcast <8 x i32> %179 to <4 x i64>
  store <4 x i64> %180, <4 x i64>* %114, align 32
  %181 = load <4 x i64>, <4 x i64>* %114, align 32
  store i8 2, i8* %49, align 1
  store i8 1, i8* %50, align 1
  store i8 0, i8* %51, align 1
  store i8 6, i8* %52, align 1
  store i8 5, i8* %53, align 1
  store i8 4, i8* %54, align 1
  store i8 10, i8* %55, align 1
  store i8 9, i8* %56, align 1
  store i8 8, i8* %57, align 1
  store i8 14, i8* %58, align 1
  store i8 13, i8* %59, align 1
  store i8 12, i8* %60, align 1
  store i8 -1, i8* %61, align 1
  store i8 -1, i8* %62, align 1
  store i8 -1, i8* %63, align 1
  store i8 -1, i8* %64, align 1
  store i8 2, i8* %65, align 1
  store i8 1, i8* %66, align 1
  store i8 0, i8* %67, align 1
  store i8 6, i8* %68, align 1
  store i8 5, i8* %69, align 1
  store i8 4, i8* %70, align 1
  store i8 10, i8* %71, align 1
  store i8 9, i8* %72, align 1
  store i8 8, i8* %73, align 1
  store i8 14, i8* %74, align 1
  store i8 13, i8* %75, align 1
  store i8 12, i8* %76, align 1
  store i8 -1, i8* %77, align 1
  store i8 -1, i8* %78, align 1
  store i8 -1, i8* %79, align 1
  store i8 -1, i8* %80, align 1
  %182 = load i8, i8* %80, align 1
  %183 = load i8, i8* %79, align 1
  %184 = load i8, i8* %78, align 1
  %185 = load i8, i8* %77, align 1
  %186 = load i8, i8* %76, align 1
  %187 = load i8, i8* %75, align 1
  %188 = load i8, i8* %74, align 1
  %189 = load i8, i8* %73, align 1
  %190 = load i8, i8* %72, align 1
  %191 = load i8, i8* %71, align 1
  %192 = load i8, i8* %70, align 1
  %193 = load i8, i8* %69, align 1
  %194 = load i8, i8* %68, align 1
  %195 = load i8, i8* %67, align 1
  %196 = load i8, i8* %66, align 1
  %197 = load i8, i8* %65, align 1
  %198 = load i8, i8* %64, align 1
  %199 = load i8, i8* %63, align 1
  %200 = load i8, i8* %62, align 1
  %201 = load i8, i8* %61, align 1
  %202 = load i8, i8* %60, align 1
  %203 = load i8, i8* %59, align 1
  %204 = load i8, i8* %58, align 1
  %205 = load i8, i8* %57, align 1
  %206 = load i8, i8* %56, align 1
  %207 = load i8, i8* %55, align 1
  %208 = load i8, i8* %54, align 1
  %209 = load i8, i8* %53, align 1
  %210 = load i8, i8* %52, align 1
  %211 = load i8, i8* %51, align 1
  %212 = load i8, i8* %50, align 1
  %213 = load i8, i8* %49, align 1
  store i8 %182, i8* %16, align 1
  store i8 %183, i8* %17, align 1
  store i8 %184, i8* %18, align 1
  store i8 %185, i8* %19, align 1
  store i8 %186, i8* %20, align 1
  store i8 %187, i8* %21, align 1
  store i8 %188, i8* %22, align 1
  store i8 %189, i8* %23, align 1
  store i8 %190, i8* %24, align 1
  store i8 %191, i8* %25, align 1
  store i8 %192, i8* %26, align 1
  store i8 %193, i8* %27, align 1
  store i8 %194, i8* %28, align 1
  store i8 %195, i8* %29, align 1
  store i8 %196, i8* %30, align 1
  store i8 %197, i8* %31, align 1
  store i8 %198, i8* %32, align 1
  store i8 %199, i8* %33, align 1
  store i8 %200, i8* %34, align 1
  store i8 %201, i8* %35, align 1
  store i8 %202, i8* %36, align 1
  store i8 %203, i8* %37, align 1
  store i8 %204, i8* %38, align 1
  store i8 %205, i8* %39, align 1
  store i8 %206, i8* %40, align 1
  store i8 %207, i8* %41, align 1
  store i8 %208, i8* %42, align 1
  store i8 %209, i8* %43, align 1
  store i8 %210, i8* %44, align 1
  store i8 %211, i8* %45, align 1
  store i8 %212, i8* %46, align 1
  store i8 %213, i8* %47, align 1
  %214 = load i8, i8* %47, align 1
  %215 = insertelement <32 x i8> undef, i8 %214, i32 0
  %216 = load i8, i8* %46, align 1
  %217 = insertelement <32 x i8> %215, i8 %216, i32 1
  %218 = load i8, i8* %45, align 1
  %219 = insertelement <32 x i8> %217, i8 %218, i32 2
  %220 = load i8, i8* %44, align 1
  %221 = insertelement <32 x i8> %219, i8 %220, i32 3
  %222 = load i8, i8* %43, align 1
  %223 = insertelement <32 x i8> %221, i8 %222, i32 4
  %224 = load i8, i8* %42, align 1
  %225 = insertelement <32 x i8> %223, i8 %224, i32 5
  %226 = load i8, i8* %41, align 1
  %227 = insertelement <32 x i8> %225, i8 %226, i32 6
  %228 = load i8, i8* %40, align 1
  %229 = insertelement <32 x i8> %227, i8 %228, i32 7
  %230 = load i8, i8* %39, align 1
  %231 = insertelement <32 x i8> %229, i8 %230, i32 8
  %232 = load i8, i8* %38, align 1
  %233 = insertelement <32 x i8> %231, i8 %232, i32 9
  %234 = load i8, i8* %37, align 1
  %235 = insertelement <32 x i8> %233, i8 %234, i32 10
  %236 = load i8, i8* %36, align 1
  %237 = insertelement <32 x i8> %235, i8 %236, i32 11
  %238 = load i8, i8* %35, align 1
  %239 = insertelement <32 x i8> %237, i8 %238, i32 12
  %240 = load i8, i8* %34, align 1
  %241 = insertelement <32 x i8> %239, i8 %240, i32 13
  %242 = load i8, i8* %33, align 1
  %243 = insertelement <32 x i8> %241, i8 %242, i32 14
  %244 = load i8, i8* %32, align 1
  %245 = insertelement <32 x i8> %243, i8 %244, i32 15
  %246 = load i8, i8* %31, align 1
  %247 = insertelement <32 x i8> %245, i8 %246, i32 16
  %248 = load i8, i8* %30, align 1
  %249 = insertelement <32 x i8> %247, i8 %248, i32 17
  %250 = load i8, i8* %29, align 1
  %251 = insertelement <32 x i8> %249, i8 %250, i32 18
  %252 = load i8, i8* %28, align 1
  %253 = insertelement <32 x i8> %251, i8 %252, i32 19
  %254 = load i8, i8* %27, align 1
  %255 = insertelement <32 x i8> %253, i8 %254, i32 20
  %256 = load i8, i8* %26, align 1
  %257 = insertelement <32 x i8> %255, i8 %256, i32 21
  %258 = load i8, i8* %25, align 1
  %259 = insertelement <32 x i8> %257, i8 %258, i32 22
  %260 = load i8, i8* %24, align 1
  %261 = insertelement <32 x i8> %259, i8 %260, i32 23
  %262 = load i8, i8* %23, align 1
  %263 = insertelement <32 x i8> %261, i8 %262, i32 24
  %264 = load i8, i8* %22, align 1
  %265 = insertelement <32 x i8> %263, i8 %264, i32 25
  %266 = load i8, i8* %21, align 1
  %267 = insertelement <32 x i8> %265, i8 %266, i32 26
  %268 = load i8, i8* %20, align 1
  %269 = insertelement <32 x i8> %267, i8 %268, i32 27
  %270 = load i8, i8* %19, align 1
  %271 = insertelement <32 x i8> %269, i8 %270, i32 28
  %272 = load i8, i8* %18, align 1
  %273 = insertelement <32 x i8> %271, i8 %272, i32 29
  %274 = load i8, i8* %17, align 1
  %275 = insertelement <32 x i8> %273, i8 %274, i32 30
  %276 = load i8, i8* %16, align 1
  %277 = insertelement <32 x i8> %275, i8 %276, i32 31
  store <32 x i8> %277, <32 x i8>* %48, align 32
  %278 = load <32 x i8>, <32 x i8>* %48, align 32
  %279 = bitcast <32 x i8> %278 to <4 x i64>
  store <4 x i64> %181, <4 x i64>* %81, align 32
  store <4 x i64> %279, <4 x i64>* %82, align 32
  %280 = load <4 x i64>, <4 x i64>* %81, align 32
  %281 = bitcast <4 x i64> %280 to <32 x i8>
  %282 = load <4 x i64>, <4 x i64>* %82, align 32
  %283 = bitcast <4 x i64> %282 to <32 x i8>
  %284 = call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %281, <32 x i8> %283) #5
  %285 = bitcast <32 x i8> %284 to <4 x i64>
  store <4 x i64> %285, <4 x i64>* %114, align 32
  %286 = load <4 x i64>, <4 x i64>* %114, align 32
  store i32 0, i32* %92, align 4
  store i32 1, i32* %93, align 4
  store i32 2, i32* %94, align 4
  store i32 4, i32* %95, align 4
  store i32 5, i32* %96, align 4
  store i32 6, i32* %97, align 4
  store i32 -1, i32* %98, align 4
  store i32 -1, i32* %99, align 4
  %287 = load i32, i32* %99, align 4
  %288 = load i32, i32* %98, align 4
  %289 = load i32, i32* %97, align 4
  %290 = load i32, i32* %96, align 4
  %291 = load i32, i32* %95, align 4
  %292 = load i32, i32* %94, align 4
  %293 = load i32, i32* %93, align 4
  %294 = load i32, i32* %92, align 4
  store i32 %287, i32* %83, align 4
  store i32 %288, i32* %84, align 4
  store i32 %289, i32* %85, align 4
  store i32 %290, i32* %86, align 4
  store i32 %291, i32* %87, align 4
  store i32 %292, i32* %88, align 4
  store i32 %293, i32* %89, align 4
  store i32 %294, i32* %90, align 4
  %295 = load i32, i32* %90, align 4
  %296 = insertelement <8 x i32> undef, i32 %295, i32 0
  %297 = load i32, i32* %89, align 4
  %298 = insertelement <8 x i32> %296, i32 %297, i32 1
  %299 = load i32, i32* %88, align 4
  %300 = insertelement <8 x i32> %298, i32 %299, i32 2
  %301 = load i32, i32* %87, align 4
  %302 = insertelement <8 x i32> %300, i32 %301, i32 3
  %303 = load i32, i32* %86, align 4
  %304 = insertelement <8 x i32> %302, i32 %303, i32 4
  %305 = load i32, i32* %85, align 4
  %306 = insertelement <8 x i32> %304, i32 %305, i32 5
  %307 = load i32, i32* %84, align 4
  %308 = insertelement <8 x i32> %306, i32 %307, i32 6
  %309 = load i32, i32* %83, align 4
  %310 = insertelement <8 x i32> %308, i32 %309, i32 7
  store <8 x i32> %310, <8 x i32>* %91, align 32
  %311 = load <8 x i32>, <8 x i32>* %91, align 32
  %312 = bitcast <8 x i32> %311 to <4 x i64>
  store <4 x i64> %286, <4 x i64>* %100, align 32
  store <4 x i64> %312, <4 x i64>* %101, align 32
  %313 = load <4 x i64>, <4 x i64>* %100, align 32
  %314 = bitcast <4 x i64> %313 to <8 x i32>
  %315 = load <4 x i64>, <4 x i64>* %101, align 32
  %316 = bitcast <4 x i64> %315 to <8 x i32>
  %317 = call <8 x i32> @llvm.x86.avx2.permd(<8 x i32> %314, <8 x i32> %316) #5
  %318 = bitcast <8 x i32> %317 to <4 x i64>
  ret <4 x i64> %318
}

declare i64 @chromium_base64_decode(i8*, i8*, i64) #1

; Function Attrs: argmemonly nounwind readonly
declare <8 x i32> @llvm.x86.avx2.maskload.d.256(i8*, <8 x i32>) #2

; Function Attrs: nounwind readnone
declare <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16>, <16 x i16>) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <32 x i8> @llvm.usub.sat.v32i8(<32 x i8>, <32 x i8>) #4

; Function Attrs: nounwind readnone
declare <8 x i32> @llvm.x86.avx2.psrli.d(<8 x i32>, i32) #3

; Function Attrs: nounwind readnone
declare <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8>, <32 x i8>) #3

; Function Attrs: nounwind readnone
declare i32 @llvm.x86.avx.ptestz.256(<4 x i64>, <4 x i64>) #3

; Function Attrs: nounwind readnone
declare <16 x i16> @llvm.x86.avx2.pmadd.ub.sw(<32 x i8>, <32 x i8>) #3

; Function Attrs: nounwind readnone
declare <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16>, <16 x i16>) #3

; Function Attrs: nounwind readnone
declare <8 x i32> @llvm.x86.avx2.permd(<8 x i32>, <8 x i32>) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="256" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+avx,+avx2,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+avx,+avx2,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind readonly }
attributes #3 = { nounwind readnone }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Homebrew clang version 12.0.1"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
