; ModuleID = 'scalarbase64.c'
source_filename = "scalarbase64.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx14.0.0"

%struct.base64_state = type { i32, i32, i8 }

@base64_table_enc = internal constant [65 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00", align 16
@base64_table_dec = internal constant [256 x i8] c"\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF>\FF\FF\FF?456789:;<=\FF\FF\FF\FE\FF\FF\FF\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\FF\FF\FF\FF\FF\FF\1A\1B\1C\1D\1E\1F !\22#$%&'()*+,-./0123\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF", align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @base64_stream_encode_scalar(%struct.base64_state* %0, i8* %1, i64 %2, i8* %3, i64* %4) #0 {
  %6 = alloca %struct.base64_state*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i64*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i64, align 8
  %14 = alloca %struct.base64_state, align 4
  %15 = alloca i64, align 8
  store %struct.base64_state* %0, %struct.base64_state** %6, align 8
  store i8* %1, i8** %7, align 8
  store i64 %2, i64* %8, align 8
  store i8* %3, i8** %9, align 8
  store i64* %4, i64** %10, align 8
  %16 = load i8*, i8** %7, align 8
  store i8* %16, i8** %11, align 8
  %17 = load i8*, i8** %9, align 8
  store i8* %17, i8** %12, align 8
  store i64 0, i64* %13, align 8
  %18 = load %struct.base64_state*, %struct.base64_state** %6, align 8
  %19 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 4
  %21 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 1
  store i32 %20, i32* %21, align 4
  %22 = load %struct.base64_state*, %struct.base64_state** %6, align 8
  %23 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %22, i32 0, i32 2
  %24 = load i8, i8* %23, align 4
  %25 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 2
  store i8 %24, i8* %25, align 4
  %26 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 1
  %27 = load i32, i32* %26, align 4
  switch i32 %27, label %195 [
    i32 0, label %30
    i32 1, label %130
    i32 2, label %162
  ]

28:                                               ; No predecessors!
  br label %29

29:                                               ; preds = %167, %28
  br label %30

30:                                               ; preds = %5, %29
  br label %31

31:                                               ; preds = %34, %30
  %32 = load i64, i64* %8, align 8
  %33 = icmp uge i64 %32, 8
  br i1 %33, label %34, label %102

34:                                               ; preds = %31
  %35 = load i8*, i8** %11, align 8
  %36 = bitcast i8* %35 to i64*
  %37 = load i64, i64* %36, align 8
  store i64 %37, i64* %15, align 8
  %38 = load i64, i64* %15, align 8
  %39 = call i64 @llvm.bswap.i64(i64 %38)
  store i64 %39, i64* %15, align 8
  %40 = load i64, i64* %15, align 8
  %41 = lshr i64 %40, 58
  %42 = and i64 %41, 63
  %43 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = load i8*, i8** %12, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %12, align 8
  store i8 %44, i8* %45, align 1
  %47 = load i64, i64* %15, align 8
  %48 = lshr i64 %47, 52
  %49 = and i64 %48, 63
  %50 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %49
  %51 = load i8, i8* %50, align 1
  %52 = load i8*, i8** %12, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %12, align 8
  store i8 %51, i8* %52, align 1
  %54 = load i64, i64* %15, align 8
  %55 = lshr i64 %54, 46
  %56 = and i64 %55, 63
  %57 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %56
  %58 = load i8, i8* %57, align 1
  %59 = load i8*, i8** %12, align 8
  %60 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %60, i8** %12, align 8
  store i8 %58, i8* %59, align 1
  %61 = load i64, i64* %15, align 8
  %62 = lshr i64 %61, 40
  %63 = and i64 %62, 63
  %64 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = load i8*, i8** %12, align 8
  %67 = getelementptr inbounds i8, i8* %66, i32 1
  store i8* %67, i8** %12, align 8
  store i8 %65, i8* %66, align 1
  %68 = load i64, i64* %15, align 8
  %69 = lshr i64 %68, 34
  %70 = and i64 %69, 63
  %71 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %70
  %72 = load i8, i8* %71, align 1
  %73 = load i8*, i8** %12, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %12, align 8
  store i8 %72, i8* %73, align 1
  %75 = load i64, i64* %15, align 8
  %76 = lshr i64 %75, 28
  %77 = and i64 %76, 63
  %78 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %77
  %79 = load i8, i8* %78, align 1
  %80 = load i8*, i8** %12, align 8
  %81 = getelementptr inbounds i8, i8* %80, i32 1
  store i8* %81, i8** %12, align 8
  store i8 %79, i8* %80, align 1
  %82 = load i64, i64* %15, align 8
  %83 = lshr i64 %82, 22
  %84 = and i64 %83, 63
  %85 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %84
  %86 = load i8, i8* %85, align 1
  %87 = load i8*, i8** %12, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %88, i8** %12, align 8
  store i8 %86, i8* %87, align 1
  %89 = load i64, i64* %15, align 8
  %90 = lshr i64 %89, 16
  %91 = and i64 %90, 63
  %92 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %91
  %93 = load i8, i8* %92, align 1
  %94 = load i8*, i8** %12, align 8
  %95 = getelementptr inbounds i8, i8* %94, i32 1
  store i8* %95, i8** %12, align 8
  store i8 %93, i8* %94, align 1
  %96 = load i8*, i8** %11, align 8
  %97 = getelementptr inbounds i8, i8* %96, i64 6
  store i8* %97, i8** %11, align 8
  %98 = load i64, i64* %13, align 8
  %99 = add i64 %98, 8
  store i64 %99, i64* %13, align 8
  %100 = load i64, i64* %8, align 8
  %101 = sub i64 %100, 6
  store i64 %101, i64* %8, align 8
  br label %31, !llvm.loop !3

102:                                              ; preds = %31
  %103 = load i64, i64* %8, align 8
  %104 = add i64 %103, -1
  store i64 %104, i64* %8, align 8
  %105 = icmp eq i64 %103, 0
  br i1 %105, label %106, label %107

106:                                              ; preds = %102
  br label %194

107:                                              ; preds = %102
  %108 = load i8*, i8** %11, align 8
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = ashr i32 %110, 2
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %112
  %114 = load i8, i8* %113, align 1
  %115 = load i8*, i8** %12, align 8
  %116 = getelementptr inbounds i8, i8* %115, i32 1
  store i8* %116, i8** %12, align 8
  store i8 %114, i8* %115, align 1
  %117 = load i8*, i8** %11, align 8
  %118 = getelementptr inbounds i8, i8* %117, i32 1
  store i8* %118, i8** %11, align 8
  %119 = load i8, i8* %117, align 1
  %120 = zext i8 %119 to i32
  %121 = shl i32 %120, 4
  %122 = and i32 %121, 48
  %123 = trunc i32 %122 to i8
  %124 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 2
  store i8 %123, i8* %124, align 4
  %125 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 1
  %126 = load i32, i32* %125, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %125, align 4
  %128 = load i64, i64* %13, align 8
  %129 = add i64 %128, 1
  store i64 %129, i64* %13, align 8
  br label %130

130:                                              ; preds = %5, %107
  %131 = load i64, i64* %8, align 8
  %132 = add i64 %131, -1
  store i64 %132, i64* %8, align 8
  %133 = icmp eq i64 %131, 0
  br i1 %133, label %134, label %135

134:                                              ; preds = %130
  br label %194

135:                                              ; preds = %130
  %136 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 2
  %137 = load i8, i8* %136, align 4
  %138 = zext i8 %137 to i32
  %139 = load i8*, i8** %11, align 8
  %140 = load i8, i8* %139, align 1
  %141 = zext i8 %140 to i32
  %142 = ashr i32 %141, 4
  %143 = or i32 %138, %142
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %144
  %146 = load i8, i8* %145, align 1
  %147 = load i8*, i8** %12, align 8
  %148 = getelementptr inbounds i8, i8* %147, i32 1
  store i8* %148, i8** %12, align 8
  store i8 %146, i8* %147, align 1
  %149 = load i8*, i8** %11, align 8
  %150 = getelementptr inbounds i8, i8* %149, i32 1
  store i8* %150, i8** %11, align 8
  %151 = load i8, i8* %149, align 1
  %152 = zext i8 %151 to i32
  %153 = shl i32 %152, 2
  %154 = and i32 %153, 60
  %155 = trunc i32 %154 to i8
  %156 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 2
  store i8 %155, i8* %156, align 4
  %157 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 1
  %158 = load i32, i32* %157, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, i32* %157, align 4
  %160 = load i64, i64* %13, align 8
  %161 = add i64 %160, 1
  store i64 %161, i64* %13, align 8
  br label %162

162:                                              ; preds = %5, %135
  %163 = load i64, i64* %8, align 8
  %164 = add i64 %163, -1
  store i64 %164, i64* %8, align 8
  %165 = icmp eq i64 %163, 0
  br i1 %165, label %166, label %167

166:                                              ; preds = %162
  br label %194

167:                                              ; preds = %162
  %168 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 2
  %169 = load i8, i8* %168, align 4
  %170 = zext i8 %169 to i32
  %171 = load i8*, i8** %11, align 8
  %172 = load i8, i8* %171, align 1
  %173 = zext i8 %172 to i32
  %174 = ashr i32 %173, 6
  %175 = or i32 %170, %174
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %176
  %178 = load i8, i8* %177, align 1
  %179 = load i8*, i8** %12, align 8
  %180 = getelementptr inbounds i8, i8* %179, i32 1
  store i8* %180, i8** %12, align 8
  store i8 %178, i8* %179, align 1
  %181 = load i8*, i8** %11, align 8
  %182 = getelementptr inbounds i8, i8* %181, i32 1
  store i8* %182, i8** %11, align 8
  %183 = load i8, i8* %181, align 1
  %184 = zext i8 %183 to i32
  %185 = and i32 %184, 63
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %186
  %188 = load i8, i8* %187, align 1
  %189 = load i8*, i8** %12, align 8
  %190 = getelementptr inbounds i8, i8* %189, i32 1
  store i8* %190, i8** %12, align 8
  store i8 %188, i8* %189, align 1
  %191 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 1
  store i32 0, i32* %191, align 4
  %192 = load i64, i64* %13, align 8
  %193 = add i64 %192, 2
  store i64 %193, i64* %13, align 8
  br label %29

194:                                              ; preds = %166, %134, %106
  br label %195

195:                                              ; preds = %194, %5
  %196 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 1
  %197 = load i32, i32* %196, align 4
  %198 = load %struct.base64_state*, %struct.base64_state** %6, align 8
  %199 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %198, i32 0, i32 1
  store i32 %197, i32* %199, align 4
  %200 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 2
  %201 = load i8, i8* %200, align 4
  %202 = load %struct.base64_state*, %struct.base64_state** %6, align 8
  %203 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %202, i32 0, i32 2
  store i8 %201, i8* %203, align 4
  %204 = load i64, i64* %13, align 8
  %205 = load i64*, i64** %10, align 8
  store i64 %204, i64* %205, align 8
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.bswap.i64(i64) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @base64_stream_decode_scalar(%struct.base64_state* %0, i8* %1, i64 %2, i8* %3, i64* %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.base64_state*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i64*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8, align 1
  %16 = alloca i64, align 8
  %17 = alloca %struct.base64_state, align 4
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  store %struct.base64_state* %0, %struct.base64_state** %7, align 8
  store i8* %1, i8** %8, align 8
  store i64 %2, i64* %9, align 8
  store i8* %3, i8** %10, align 8
  store i64* %4, i64** %11, align 8
  store i32 0, i32* %12, align 4
  %21 = load i8*, i8** %8, align 8
  store i8* %21, i8** %13, align 8
  %22 = load i8*, i8** %10, align 8
  store i8* %22, i8** %14, align 8
  store i64 0, i64* %16, align 8
  %23 = load %struct.base64_state*, %struct.base64_state** %7, align 8
  %24 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %23, i32 0, i32 0
  %25 = load i32, i32* %24, align 4
  %26 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 0
  store i32 %25, i32* %26, align 4
  %27 = load %struct.base64_state*, %struct.base64_state** %7, align 8
  %28 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %27, i32 0, i32 1
  %29 = load i32, i32* %28, align 4
  %30 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 1
  store i32 %29, i32* %30, align 4
  %31 = load %struct.base64_state*, %struct.base64_state** %7, align 8
  %32 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %31, i32 0, i32 2
  %33 = load i8, i8* %32, align 4
  %34 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 2
  store i8 %33, i8* %34, align 4
  %35 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 0
  %36 = load i32, i32* %35, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %68

38:                                               ; preds = %5
  %39 = load i64*, i64** %11, align 8
  store i64 0, i64* %39, align 8
  store i32 0, i32* %12, align 4
  %40 = load i64, i64* %9, align 8
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %66

42:                                               ; preds = %38
  %43 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 0
  %44 = load i32, i32* %43, align 4
  %45 = icmp eq i32 %44, 1
  br i1 %45, label %46, label %66

46:                                               ; preds = %42
  %47 = load %struct.base64_state*, %struct.base64_state** %7, align 8
  %48 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %47, i32 0, i32 1
  store i32 0, i32* %48, align 4
  %49 = load %struct.base64_state*, %struct.base64_state** %7, align 8
  %50 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %49, i32 0, i32 0
  store i32 2, i32* %50, align 4
  %51 = load i8*, i8** %13, align 8
  %52 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %52, i8** %13, align 8
  %53 = load i8, i8* %51, align 1
  %54 = zext i8 %53 to i64
  %55 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = icmp eq i32 %57, 254
  br i1 %58, label %59, label %62

59:                                               ; preds = %46
  %60 = load i64, i64* %9, align 8
  %61 = icmp eq i64 %60, 1
  br label %62

62:                                               ; preds = %59, %46
  %63 = phi i1 [ false, %46 ], [ %61, %59 ]
  %64 = zext i1 %63 to i64
  %65 = select i1 %63, i32 1, i32 0
  store i32 %65, i32* %12, align 4
  br label %66

66:                                               ; preds = %62, %42, %38
  %67 = load i32, i32* %12, align 4
  store i32 %67, i32* %6, align 4
  br label %384

68:                                               ; preds = %5
  %69 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 1
  %70 = load i32, i32* %69, align 4
  switch i32 %70, label %368 [
    i32 0, label %73
    i32 1, label %221
    i32 2, label %258
    i32 3, label %326
  ]

71:                                               ; No predecessors!
  br label %72

72:                                               ; preds = %353, %71
  br label %73

73:                                               ; preds = %68, %72
  br label %74

74:                                               ; preds = %178, %73
  %75 = load i64, i64* %9, align 8
  %76 = icmp uge i64 %75, 13
  br i1 %76, label %77, label %196

77:                                               ; preds = %74
  %78 = load i8*, i8** %13, align 8
  %79 = bitcast i8* %78 to i64*
  %80 = load i64, i64* %79, align 8
  store i64 %80, i64* %18, align 8
  %81 = load i64, i64* %18, align 8
  %82 = call i64 @llvm.bswap.i64(i64 %81)
  store i64 %82, i64* %18, align 8
  %83 = load i64, i64* %18, align 8
  %84 = lshr i64 %83, 56
  %85 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %84
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i64
  store i64 %87, i64* %20, align 8
  %88 = icmp ugt i64 %87, 63
  br i1 %88, label %89, label %90

89:                                               ; preds = %77
  br label %196

90:                                               ; preds = %77
  %91 = load i64, i64* %20, align 8
  %92 = shl i64 %91, 58
  store i64 %92, i64* %19, align 8
  %93 = load i64, i64* %18, align 8
  %94 = lshr i64 %93, 48
  %95 = and i64 %94, 255
  %96 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %95
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i64
  store i64 %98, i64* %20, align 8
  %99 = icmp ugt i64 %98, 63
  br i1 %99, label %100, label %101

100:                                              ; preds = %90
  br label %196

101:                                              ; preds = %90
  %102 = load i64, i64* %20, align 8
  %103 = shl i64 %102, 52
  %104 = load i64, i64* %19, align 8
  %105 = or i64 %104, %103
  store i64 %105, i64* %19, align 8
  %106 = load i64, i64* %18, align 8
  %107 = lshr i64 %106, 40
  %108 = and i64 %107, 255
  %109 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %108
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i64
  store i64 %111, i64* %20, align 8
  %112 = icmp ugt i64 %111, 63
  br i1 %112, label %113, label %114

113:                                              ; preds = %101
  br label %196

114:                                              ; preds = %101
  %115 = load i64, i64* %20, align 8
  %116 = shl i64 %115, 46
  %117 = load i64, i64* %19, align 8
  %118 = or i64 %117, %116
  store i64 %118, i64* %19, align 8
  %119 = load i64, i64* %18, align 8
  %120 = lshr i64 %119, 32
  %121 = and i64 %120, 255
  %122 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %121
  %123 = load i8, i8* %122, align 1
  %124 = zext i8 %123 to i64
  store i64 %124, i64* %20, align 8
  %125 = icmp ugt i64 %124, 63
  br i1 %125, label %126, label %127

126:                                              ; preds = %114
  br label %196

127:                                              ; preds = %114
  %128 = load i64, i64* %20, align 8
  %129 = shl i64 %128, 40
  %130 = load i64, i64* %19, align 8
  %131 = or i64 %130, %129
  store i64 %131, i64* %19, align 8
  %132 = load i64, i64* %18, align 8
  %133 = lshr i64 %132, 24
  %134 = and i64 %133, 255
  %135 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %134
  %136 = load i8, i8* %135, align 1
  %137 = zext i8 %136 to i64
  store i64 %137, i64* %20, align 8
  %138 = icmp ugt i64 %137, 63
  br i1 %138, label %139, label %140

139:                                              ; preds = %127
  br label %196

140:                                              ; preds = %127
  %141 = load i64, i64* %20, align 8
  %142 = shl i64 %141, 34
  %143 = load i64, i64* %19, align 8
  %144 = or i64 %143, %142
  store i64 %144, i64* %19, align 8
  %145 = load i64, i64* %18, align 8
  %146 = lshr i64 %145, 16
  %147 = and i64 %146, 255
  %148 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %147
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i64
  store i64 %150, i64* %20, align 8
  %151 = icmp ugt i64 %150, 63
  br i1 %151, label %152, label %153

152:                                              ; preds = %140
  br label %196

153:                                              ; preds = %140
  %154 = load i64, i64* %20, align 8
  %155 = shl i64 %154, 28
  %156 = load i64, i64* %19, align 8
  %157 = or i64 %156, %155
  store i64 %157, i64* %19, align 8
  %158 = load i64, i64* %18, align 8
  %159 = lshr i64 %158, 8
  %160 = and i64 %159, 255
  %161 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %160
  %162 = load i8, i8* %161, align 1
  %163 = zext i8 %162 to i64
  store i64 %163, i64* %20, align 8
  %164 = icmp ugt i64 %163, 63
  br i1 %164, label %165, label %166

165:                                              ; preds = %153
  br label %196

166:                                              ; preds = %153
  %167 = load i64, i64* %20, align 8
  %168 = shl i64 %167, 22
  %169 = load i64, i64* %19, align 8
  %170 = or i64 %169, %168
  store i64 %170, i64* %19, align 8
  %171 = load i64, i64* %18, align 8
  %172 = and i64 %171, 255
  %173 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %172
  %174 = load i8, i8* %173, align 1
  %175 = zext i8 %174 to i64
  store i64 %175, i64* %20, align 8
  %176 = icmp ugt i64 %175, 63
  br i1 %176, label %177, label %178

177:                                              ; preds = %166
  br label %196

178:                                              ; preds = %166
  %179 = load i64, i64* %20, align 8
  %180 = shl i64 %179, 16
  %181 = load i64, i64* %19, align 8
  %182 = or i64 %181, %180
  store i64 %182, i64* %19, align 8
  %183 = load i64, i64* %19, align 8
  %184 = call i64 @llvm.bswap.i64(i64 %183)
  store i64 %184, i64* %19, align 8
  %185 = load i64, i64* %19, align 8
  %186 = load i8*, i8** %14, align 8
  %187 = bitcast i8* %186 to i64*
  store i64 %185, i64* %187, align 8
  %188 = load i8*, i8** %13, align 8
  %189 = getelementptr inbounds i8, i8* %188, i64 8
  store i8* %189, i8** %13, align 8
  %190 = load i8*, i8** %14, align 8
  %191 = getelementptr inbounds i8, i8* %190, i64 6
  store i8* %191, i8** %14, align 8
  %192 = load i64, i64* %16, align 8
  %193 = add i64 %192, 6
  store i64 %193, i64* %16, align 8
  %194 = load i64, i64* %9, align 8
  %195 = sub i64 %194, 8
  store i64 %195, i64* %9, align 8
  br label %74, !llvm.loop !5

196:                                              ; preds = %177, %165, %152, %139, %126, %113, %100, %89, %74
  %197 = load i64, i64* %9, align 8
  %198 = add i64 %197, -1
  store i64 %198, i64* %9, align 8
  %199 = icmp eq i64 %197, 0
  br i1 %199, label %200, label %201

200:                                              ; preds = %196
  store i32 1, i32* %12, align 4
  br label %367

201:                                              ; preds = %196
  %202 = load i8*, i8** %13, align 8
  %203 = getelementptr inbounds i8, i8* %202, i32 1
  store i8* %203, i8** %13, align 8
  %204 = load i8, i8* %202, align 1
  %205 = zext i8 %204 to i64
  %206 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %205
  %207 = load i8, i8* %206, align 1
  store i8 %207, i8* %15, align 1
  %208 = zext i8 %207 to i32
  %209 = icmp sge i32 %208, 254
  br i1 %209, label %210, label %212

210:                                              ; preds = %201
  %211 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 0
  store i32 2, i32* %211, align 4
  br label %367

212:                                              ; preds = %201
  %213 = load i8, i8* %15, align 1
  %214 = zext i8 %213 to i32
  %215 = shl i32 %214, 2
  %216 = trunc i32 %215 to i8
  %217 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 2
  store i8 %216, i8* %217, align 4
  %218 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 1
  %219 = load i32, i32* %218, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, i32* %218, align 4
  br label %221

221:                                              ; preds = %68, %212
  %222 = load i64, i64* %9, align 8
  %223 = add i64 %222, -1
  store i64 %223, i64* %9, align 8
  %224 = icmp eq i64 %222, 0
  br i1 %224, label %225, label %226

225:                                              ; preds = %221
  store i32 1, i32* %12, align 4
  br label %367

226:                                              ; preds = %221
  %227 = load i8*, i8** %13, align 8
  %228 = getelementptr inbounds i8, i8* %227, i32 1
  store i8* %228, i8** %13, align 8
  %229 = load i8, i8* %227, align 1
  %230 = zext i8 %229 to i64
  %231 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %230
  %232 = load i8, i8* %231, align 1
  store i8 %232, i8* %15, align 1
  %233 = zext i8 %232 to i32
  %234 = icmp sge i32 %233, 254
  br i1 %234, label %235, label %237

235:                                              ; preds = %226
  %236 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 0
  store i32 2, i32* %236, align 4
  br label %367

237:                                              ; preds = %226
  %238 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 2
  %239 = load i8, i8* %238, align 4
  %240 = zext i8 %239 to i32
  %241 = load i8, i8* %15, align 1
  %242 = zext i8 %241 to i32
  %243 = ashr i32 %242, 4
  %244 = or i32 %240, %243
  %245 = trunc i32 %244 to i8
  %246 = load i8*, i8** %14, align 8
  %247 = getelementptr inbounds i8, i8* %246, i32 1
  store i8* %247, i8** %14, align 8
  store i8 %245, i8* %246, align 1
  %248 = load i8, i8* %15, align 1
  %249 = zext i8 %248 to i32
  %250 = shl i32 %249, 4
  %251 = trunc i32 %250 to i8
  %252 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 2
  store i8 %251, i8* %252, align 4
  %253 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 1
  %254 = load i32, i32* %253, align 4
  %255 = add nsw i32 %254, 1
  store i32 %255, i32* %253, align 4
  %256 = load i64, i64* %16, align 8
  %257 = add i64 %256, 1
  store i64 %257, i64* %16, align 8
  br label %258

258:                                              ; preds = %68, %237
  %259 = load i64, i64* %9, align 8
  %260 = add i64 %259, -1
  store i64 %260, i64* %9, align 8
  %261 = icmp eq i64 %259, 0
  br i1 %261, label %262, label %263

262:                                              ; preds = %258
  store i32 1, i32* %12, align 4
  br label %367

263:                                              ; preds = %258
  %264 = load i8*, i8** %13, align 8
  %265 = getelementptr inbounds i8, i8* %264, i32 1
  store i8* %265, i8** %13, align 8
  %266 = load i8, i8* %264, align 1
  %267 = zext i8 %266 to i64
  %268 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %267
  %269 = load i8, i8* %268, align 1
  store i8 %269, i8* %15, align 1
  %270 = zext i8 %269 to i32
  %271 = icmp sge i32 %270, 254
  br i1 %271, label %272, label %305

272:                                              ; preds = %263
  %273 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 1
  %274 = load i32, i32* %273, align 4
  %275 = add nsw i32 %274, 1
  store i32 %275, i32* %273, align 4
  %276 = load i8, i8* %15, align 1
  %277 = zext i8 %276 to i32
  %278 = icmp eq i32 %277, 254
  br i1 %278, label %279, label %304

279:                                              ; preds = %272
  %280 = load i64, i64* %9, align 8
  %281 = add i64 %280, -1
  store i64 %281, i64* %9, align 8
  %282 = icmp ne i64 %280, 0
  br i1 %282, label %283, label %302

283:                                              ; preds = %279
  %284 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 1
  store i32 0, i32* %284, align 4
  %285 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 0
  store i32 2, i32* %285, align 4
  %286 = load i8*, i8** %13, align 8
  %287 = getelementptr inbounds i8, i8* %286, i32 1
  store i8* %287, i8** %13, align 8
  %288 = load i8, i8* %286, align 1
  %289 = zext i8 %288 to i64
  %290 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %289
  %291 = load i8, i8* %290, align 1
  store i8 %291, i8* %15, align 1
  %292 = load i8, i8* %15, align 1
  %293 = zext i8 %292 to i32
  %294 = icmp eq i32 %293, 254
  br i1 %294, label %295, label %298

295:                                              ; preds = %283
  %296 = load i64, i64* %9, align 8
  %297 = icmp eq i64 %296, 0
  br label %298

298:                                              ; preds = %295, %283
  %299 = phi i1 [ false, %283 ], [ %297, %295 ]
  %300 = zext i1 %299 to i64
  %301 = select i1 %299, i32 1, i32 0
  store i32 %301, i32* %12, align 4
  br label %367

302:                                              ; preds = %279
  %303 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 0
  store i32 1, i32* %303, align 4
  store i32 1, i32* %12, align 4
  br label %367

304:                                              ; preds = %272
  br label %367

305:                                              ; preds = %263
  %306 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 2
  %307 = load i8, i8* %306, align 4
  %308 = zext i8 %307 to i32
  %309 = load i8, i8* %15, align 1
  %310 = zext i8 %309 to i32
  %311 = ashr i32 %310, 2
  %312 = or i32 %308, %311
  %313 = trunc i32 %312 to i8
  %314 = load i8*, i8** %14, align 8
  %315 = getelementptr inbounds i8, i8* %314, i32 1
  store i8* %315, i8** %14, align 8
  store i8 %313, i8* %314, align 1
  %316 = load i8, i8* %15, align 1
  %317 = zext i8 %316 to i32
  %318 = shl i32 %317, 6
  %319 = trunc i32 %318 to i8
  %320 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 2
  store i8 %319, i8* %320, align 4
  %321 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 1
  %322 = load i32, i32* %321, align 4
  %323 = add nsw i32 %322, 1
  store i32 %323, i32* %321, align 4
  %324 = load i64, i64* %16, align 8
  %325 = add i64 %324, 1
  store i64 %325, i64* %16, align 8
  br label %326

326:                                              ; preds = %68, %305
  %327 = load i64, i64* %9, align 8
  %328 = add i64 %327, -1
  store i64 %328, i64* %9, align 8
  %329 = icmp eq i64 %327, 0
  br i1 %329, label %330, label %331

330:                                              ; preds = %326
  store i32 1, i32* %12, align 4
  br label %367

331:                                              ; preds = %326
  %332 = load i8*, i8** %13, align 8
  %333 = getelementptr inbounds i8, i8* %332, i32 1
  store i8* %333, i8** %13, align 8
  %334 = load i8, i8* %332, align 1
  %335 = zext i8 %334 to i64
  %336 = getelementptr inbounds [256 x i8], [256 x i8]* @base64_table_dec, i64 0, i64 %335
  %337 = load i8, i8* %336, align 1
  store i8 %337, i8* %15, align 1
  %338 = zext i8 %337 to i32
  %339 = icmp sge i32 %338, 254
  br i1 %339, label %340, label %353

340:                                              ; preds = %331
  %341 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 1
  store i32 0, i32* %341, align 4
  %342 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 0
  store i32 2, i32* %342, align 4
  %343 = load i8, i8* %15, align 1
  %344 = zext i8 %343 to i32
  %345 = icmp eq i32 %344, 254
  br i1 %345, label %346, label %349

346:                                              ; preds = %340
  %347 = load i64, i64* %9, align 8
  %348 = icmp eq i64 %347, 0
  br label %349

349:                                              ; preds = %346, %340
  %350 = phi i1 [ false, %340 ], [ %348, %346 ]
  %351 = zext i1 %350 to i64
  %352 = select i1 %350, i32 1, i32 0
  store i32 %352, i32* %12, align 4
  br label %367

353:                                              ; preds = %331
  %354 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 2
  %355 = load i8, i8* %354, align 4
  %356 = zext i8 %355 to i32
  %357 = load i8, i8* %15, align 1
  %358 = zext i8 %357 to i32
  %359 = or i32 %356, %358
  %360 = trunc i32 %359 to i8
  %361 = load i8*, i8** %14, align 8
  %362 = getelementptr inbounds i8, i8* %361, i32 1
  store i8* %362, i8** %14, align 8
  store i8 %360, i8* %361, align 1
  %363 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 2
  store i8 0, i8* %363, align 4
  %364 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 1
  store i32 0, i32* %364, align 4
  %365 = load i64, i64* %16, align 8
  %366 = add i64 %365, 1
  store i64 %366, i64* %16, align 8
  br label %72

367:                                              ; preds = %349, %330, %304, %302, %298, %262, %235, %225, %210, %200
  br label %368

368:                                              ; preds = %367, %68
  %369 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 0
  %370 = load i32, i32* %369, align 4
  %371 = load %struct.base64_state*, %struct.base64_state** %7, align 8
  %372 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %371, i32 0, i32 0
  store i32 %370, i32* %372, align 4
  %373 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 1
  %374 = load i32, i32* %373, align 4
  %375 = load %struct.base64_state*, %struct.base64_state** %7, align 8
  %376 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %375, i32 0, i32 1
  store i32 %374, i32* %376, align 4
  %377 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %17, i32 0, i32 2
  %378 = load i8, i8* %377, align 4
  %379 = load %struct.base64_state*, %struct.base64_state** %7, align 8
  %380 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %379, i32 0, i32 2
  store i8 %378, i8* %380, align 4
  %381 = load i64, i64* %16, align 8
  %382 = load i64*, i64** %11, align 8
  store i64 %381, i64* %382, align 8
  %383 = load i32, i32* %12, align 4
  store i32 %383, i32* %6, align 4
  br label %384

384:                                              ; preds = %368, %66
  %385 = load i32, i32* %6, align 4
  ret i32 %385
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local void @scalar_base64_encode(i8* %0, i64 %1, i8* %2, i64* %3) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca %struct.base64_state, align 4
  store i8* %0, i8** %5, align 8
  store i64 %1, i64* %6, align 8
  store i8* %2, i8** %7, align 8
  store i64* %3, i64** %8, align 8
  call void @base64_stream_encode_init(%struct.base64_state* %11)
  %12 = load i8*, i8** %5, align 8
  %13 = load i64, i64* %6, align 8
  %14 = load i8*, i8** %7, align 8
  call void @base64_stream_encode(%struct.base64_state* %11, i8* %12, i64 %13, i8* %14, i64* %9)
  %15 = load i8*, i8** %7, align 8
  %16 = load i64, i64* %9, align 8
  %17 = getelementptr inbounds i8, i8* %15, i64 %16
  call void @base64_stream_encode_final(%struct.base64_state* %11, i8* %17, i64* %10)
  %18 = load i64, i64* %9, align 8
  %19 = load i64, i64* %10, align 8
  %20 = add i64 %18, %19
  %21 = load i64*, i64** %8, align 8
  store i64 %20, i64* %21, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @base64_stream_encode_init(%struct.base64_state* %0) #0 {
  %2 = alloca %struct.base64_state*, align 8
  store %struct.base64_state* %0, %struct.base64_state** %2, align 8
  %3 = load %struct.base64_state*, %struct.base64_state** %2, align 8
  %4 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %3, i32 0, i32 0
  store i32 0, i32* %4, align 4
  %5 = load %struct.base64_state*, %struct.base64_state** %2, align 8
  %6 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %5, i32 0, i32 1
  store i32 0, i32* %6, align 4
  %7 = load %struct.base64_state*, %struct.base64_state** %2, align 8
  %8 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %7, i32 0, i32 2
  store i8 0, i8* %8, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @base64_stream_encode(%struct.base64_state* %0, i8* %1, i64 %2, i8* %3, i64* %4) #0 {
  %6 = alloca %struct.base64_state*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i64*, align 8
  store %struct.base64_state* %0, %struct.base64_state** %6, align 8
  store i8* %1, i8** %7, align 8
  store i64 %2, i64* %8, align 8
  store i8* %3, i8** %9, align 8
  store i64* %4, i64** %10, align 8
  %11 = load %struct.base64_state*, %struct.base64_state** %6, align 8
  %12 = load i8*, i8** %7, align 8
  %13 = load i64, i64* %8, align 8
  %14 = load i8*, i8** %9, align 8
  %15 = load i64*, i64** %10, align 8
  call void @base64_stream_encode_scalar(%struct.base64_state* %11, i8* %12, i64 %13, i8* %14, i64* %15)
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @base64_stream_encode_final(%struct.base64_state* %0, i8* %1, i64* %2) #0 {
  %4 = alloca %struct.base64_state*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i8*, align 8
  store %struct.base64_state* %0, %struct.base64_state** %4, align 8
  store i8* %1, i8** %5, align 8
  store i64* %2, i64** %6, align 8
  %8 = load i8*, i8** %5, align 8
  store i8* %8, i8** %7, align 8
  %9 = load %struct.base64_state*, %struct.base64_state** %4, align 8
  %10 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %9, i32 0, i32 1
  %11 = load i32, i32* %10, align 4
  %12 = icmp eq i32 %11, 1
  br i1 %12, label %13, label %27

13:                                               ; preds = %3
  %14 = load %struct.base64_state*, %struct.base64_state** %4, align 8
  %15 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %14, i32 0, i32 2
  %16 = load i8, i8* %15, align 4
  %17 = zext i8 %16 to i64
  %18 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %17
  %19 = load i8, i8* %18, align 1
  %20 = load i8*, i8** %7, align 8
  %21 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %21, i8** %7, align 8
  store i8 %19, i8* %20, align 1
  %22 = load i8*, i8** %7, align 8
  %23 = getelementptr inbounds i8, i8* %22, i32 1
  store i8* %23, i8** %7, align 8
  store i8 61, i8* %22, align 1
  %24 = load i8*, i8** %7, align 8
  %25 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %25, i8** %7, align 8
  store i8 61, i8* %24, align 1
  %26 = load i64*, i64** %6, align 8
  store i64 3, i64* %26, align 8
  br label %46

27:                                               ; preds = %3
  %28 = load %struct.base64_state*, %struct.base64_state** %4, align 8
  %29 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %28, i32 0, i32 1
  %30 = load i32, i32* %29, align 4
  %31 = icmp eq i32 %30, 2
  br i1 %31, label %32, label %44

32:                                               ; preds = %27
  %33 = load %struct.base64_state*, %struct.base64_state** %4, align 8
  %34 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %33, i32 0, i32 2
  %35 = load i8, i8* %34, align 4
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds [65 x i8], [65 x i8]* @base64_table_enc, i64 0, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = load i8*, i8** %7, align 8
  %40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %40, i8** %7, align 8
  store i8 %38, i8* %39, align 1
  %41 = load i8*, i8** %7, align 8
  %42 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %42, i8** %7, align 8
  store i8 61, i8* %41, align 1
  %43 = load i64*, i64** %6, align 8
  store i64 2, i64* %43, align 8
  br label %46

44:                                               ; preds = %27
  %45 = load i64*, i64** %6, align 8
  store i64 0, i64* %45, align 8
  br label %46

46:                                               ; preds = %44, %32, %13
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define dso_local i32 @scalar_base64_decode(i8* %0, i64 %1, i8* %2, i64* %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64*, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct.base64_state, align 4
  store i8* %0, i8** %6, align 8
  store i64 %1, i64* %7, align 8
  store i8* %2, i8** %8, align 8
  store i64* %3, i64** %9, align 8
  call void @base64_stream_decode_init(%struct.base64_state* %11)
  %12 = load i8*, i8** %6, align 8
  %13 = load i64, i64* %7, align 8
  %14 = load i8*, i8** %8, align 8
  %15 = load i64*, i64** %9, align 8
  %16 = call i32 @base64_stream_decode(%struct.base64_state* %11, i8* %12, i64 %13, i8* %14, i64* %15)
  store i32 %16, i32* %10, align 4
  %17 = load i32, i32* %10, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %25

19:                                               ; preds = %4
  %20 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %11, i32 0, i32 1
  %21 = load i32, i32* %20, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %19
  %24 = load i32, i32* %10, align 4
  store i32 %24, i32* %5, align 4
  br label %26

25:                                               ; preds = %19, %4
  store i32 0, i32* %5, align 4
  br label %26

26:                                               ; preds = %25, %23
  %27 = load i32, i32* %5, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @base64_stream_decode_init(%struct.base64_state* %0) #0 {
  %2 = alloca %struct.base64_state*, align 8
  store %struct.base64_state* %0, %struct.base64_state** %2, align 8
  %3 = load %struct.base64_state*, %struct.base64_state** %2, align 8
  %4 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %3, i32 0, i32 0
  store i32 0, i32* %4, align 4
  %5 = load %struct.base64_state*, %struct.base64_state** %2, align 8
  %6 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %5, i32 0, i32 1
  store i32 0, i32* %6, align 4
  %7 = load %struct.base64_state*, %struct.base64_state** %2, align 8
  %8 = getelementptr inbounds %struct.base64_state, %struct.base64_state* %7, i32 0, i32 2
  store i8 0, i8* %8, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @base64_stream_decode(%struct.base64_state* %0, i8* %1, i64 %2, i8* %3, i64* %4) #0 {
  %6 = alloca %struct.base64_state*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i64*, align 8
  store %struct.base64_state* %0, %struct.base64_state** %6, align 8
  store i8* %1, i8** %7, align 8
  store i64 %2, i64* %8, align 8
  store i8* %3, i8** %9, align 8
  store i64* %4, i64** %10, align 8
  %11 = load %struct.base64_state*, %struct.base64_state** %6, align 8
  %12 = load i8*, i8** %7, align 8
  %13 = load i64, i64* %8, align 8
  %14 = load i8*, i8** %9, align 8
  %15 = load i64*, i64** %10, align 8
  %16 = call i32 @base64_stream_decode_scalar(%struct.base64_state* %11, i8* %12, i64 %13, i8* %14, i64* %15)
  ret i32 %16
}

attributes #0 = { noinline nounwind optnone ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Homebrew clang version 12.0.1"}
!3 = distinct !{!3, !4}
!4 = !{!"llvm.loop.mustprogress"}
!5 = distinct !{!5, !4}
