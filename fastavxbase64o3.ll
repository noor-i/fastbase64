; ModuleID = 'src/fastavxbase64.c'
source_filename = "src/fastavxbase64.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx14.0.0"

; Function Attrs: nounwind ssp uwtable
define dso_local i64 @fast_avx2_base64_encode(i8* %0, i8* %1, i64 %2) local_unnamed_addr #0 {
  %4 = icmp ugt i64 %2, 27
  br i1 %4, label %5, label %39

5:                                                ; preds = %3
  %6 = getelementptr inbounds i8, i8* %1, i64 -4
  %7 = bitcast i8* %6 to <8 x i32>*
  %8 = tail call <8 x i32> @llvm.masked.load.v8i32.p0v8i32(<8 x i32>* nonnull %7, i32 1, <8 x i1> <i1 false, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <8 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>)
  %9 = bitcast <8 x i32> %8 to <4 x i64>
  br label %10

10:                                               ; preds = %35, %5
  %11 = phi i8* [ %1, %5 ], [ %31, %35 ]
  %12 = phi i64 [ %2, %5 ], [ %33, %35 ]
  %13 = phi i8* [ %0, %5 ], [ %32, %35 ]
  %14 = phi <4 x i64> [ %9, %5 ], [ %38, %35 ]
  %15 = bitcast <4 x i64> %14 to <32 x i8>
  %16 = shufflevector <32 x i8> %15, <32 x i8> poison, <32 x i32> <i32 5, i32 4, i32 6, i32 5, i32 8, i32 7, i32 9, i32 8, i32 11, i32 10, i32 12, i32 11, i32 14, i32 13, i32 15, i32 14, i32 17, i32 16, i32 18, i32 17, i32 20, i32 19, i32 21, i32 20, i32 23, i32 22, i32 24, i32 23, i32 26, i32 25, i32 27, i32 26>
  %17 = bitcast <32 x i8> %16 to <16 x i16>
  %18 = and <16 x i16> %17, <i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032>
  %19 = tail call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %18, <16 x i16> <i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024>) #5
  %20 = and <16 x i16> %17, <i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63>
  %21 = shl <16 x i16> %20, <i16 4, i16 8, i16 4, i16 8, i16 4, i16 8, i16 4, i16 8, i16 4, i16 8, i16 4, i16 8, i16 4, i16 8, i16 4, i16 8>
  %22 = or <16 x i16> %21, %19
  %23 = bitcast <16 x i16> %22 to <32 x i8>
  %24 = tail call <32 x i8> @llvm.usub.sat.v32i8(<32 x i8> %23, <32 x i8> <i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51>) #5
  %25 = icmp sgt <32 x i8> %23, <i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25>
  %26 = zext <32 x i1> %25 to <32 x i8>
  %27 = add nuw <32 x i8> %24, %26
  %28 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> <i8 65, i8 71, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -19, i8 -16, i8 0, i8 0, i8 65, i8 71, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -19, i8 -16, i8 0, i8 0>, <32 x i8> %27) #5
  %29 = add <32 x i8> %28, %23
  %30 = bitcast i8* %13 to <32 x i8>*
  store <32 x i8> %29, <32 x i8>* %30, align 1, !tbaa !3
  %31 = getelementptr inbounds i8, i8* %11, i64 24
  %32 = getelementptr inbounds i8, i8* %13, i64 32
  %33 = add i64 %12, -24
  %34 = icmp ugt i64 %33, 31
  br i1 %34, label %35, label %39

35:                                               ; preds = %10
  %36 = getelementptr inbounds i8, i8* %11, i64 20
  %37 = bitcast i8* %36 to <4 x i64>*
  %38 = load <4 x i64>, <4 x i64>* %37, align 1, !tbaa !3
  br label %10

39:                                               ; preds = %10, %3
  %40 = phi i8* [ %1, %3 ], [ %31, %10 ]
  %41 = phi i64 [ %2, %3 ], [ %33, %10 ]
  %42 = phi i8* [ %0, %3 ], [ %32, %10 ]
  %43 = tail call i64 @chromium_base64_encode(i8* %42, i8* %40, i64 %41) #5
  %44 = icmp eq i64 %43, -1
  %45 = ptrtoint i8* %42 to i64
  %46 = ptrtoint i8* %0 to i64
  %47 = sub i64 %45, %46
  %48 = add i64 %47, %43
  %49 = select i1 %44, i64 -1, i64 %48
  ret i64 %49
}

declare i64 @chromium_base64_encode(i8*, i8*, i64) local_unnamed_addr #1

; Function Attrs: nounwind ssp uwtable
define dso_local i64 @fast_avx2_base64_decode(i8* %0, i8* %1, i64 %2) local_unnamed_addr #0 {
  %4 = icmp ugt i64 %2, 44
  br i1 %4, label %5, label %40

5:                                                ; preds = %3, %23
  %6 = phi i8* [ %38, %23 ], [ %0, %3 ]
  %7 = phi i8* [ %30, %23 ], [ %1, %3 ]
  %8 = phi i64 [ %29, %23 ], [ %2, %3 ]
  %9 = bitcast i8* %7 to <4 x i64>*
  %10 = load <4 x i64>, <4 x i64>* %9, align 1, !tbaa !3
  %11 = bitcast <4 x i64> %10 to <8 x i32>
  %12 = lshr <8 x i32> %11, <i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4>
  %13 = bitcast <4 x i64> %10 to <32 x i8>
  %14 = and <32 x i8> %13, <i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47>
  %15 = shufflevector <32 x i8> %14, <32 x i8> undef, <32 x i32> <i32 21, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 19, i32 26, i32 27, i32 27, i32 27, i32 26, i32 21, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 17, i32 19, i32 26, i32 27, i32 27, i32 27, i32 26>
  %16 = bitcast <32 x i8> %15 to <4 x i64>
  %17 = bitcast <8 x i32> %12 to <32 x i8>
  %18 = and <32 x i8> %17, <i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47>
  %19 = shufflevector <32 x i8> %18, <32 x i8> undef, <32 x i32> <i32 16, i32 16, i32 1, i32 2, i32 4, i32 8, i32 4, i32 8, i32 16, i32 16, i32 16, i32 16, i32 16, i32 16, i32 16, i32 16, i32 16, i32 16, i32 1, i32 2, i32 4, i32 8, i32 4, i32 8, i32 16, i32 16, i32 16, i32 16, i32 16, i32 16, i32 16, i32 16>
  %20 = bitcast <32 x i8> %19 to <4 x i64>
  %21 = tail call i32 @llvm.x86.avx.ptestz.256(<4 x i64> %16, <4 x i64> %20) #5
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %40, label %23

23:                                               ; preds = %5
  %24 = icmp eq <32 x i8> %13, <i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47>
  %25 = sext <32 x i1> %24 to <32 x i8>
  %26 = add nsw <32 x i8> %18, %25
  %27 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> <i8 0, i8 16, i8 19, i8 4, i8 -65, i8 -65, i8 -71, i8 -71, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 16, i8 19, i8 4, i8 -65, i8 -65, i8 -71, i8 -71, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, <32 x i8> %26) #5
  %28 = add <32 x i8> %27, %13
  %29 = add i64 %8, -32
  %30 = getelementptr inbounds i8, i8* %7, i64 32
  %31 = tail call <16 x i16> @llvm.x86.avx2.pmadd.ub.sw(<32 x i8> %28, <32 x i8> <i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1>) #5
  %32 = tail call <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16> %31, <16 x i16> <i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1>) #5
  %33 = bitcast <8 x i32> %32 to <32 x i8>
  %34 = shufflevector <32 x i8> %33, <32 x i8> <i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 0, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison>, <32 x i32> <i32 2, i32 1, i32 0, i32 6, i32 5, i32 4, i32 10, i32 9, i32 8, i32 14, i32 13, i32 12, i32 undef, i32 undef, i32 undef, i32 undef, i32 18, i32 17, i32 16, i32 22, i32 21, i32 20, i32 26, i32 25, i32 24, i32 30, i32 29, i32 28, i32 48, i32 48, i32 48, i32 48>
  %35 = bitcast <32 x i8> %34 to <8 x i32>
  %36 = shufflevector <8 x i32> %35, <8 x i32> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 4, i32 5, i32 6, i32 7, i32 7>
  %37 = bitcast i8* %6 to <8 x i32>*
  store <8 x i32> %36, <8 x i32>* %37, align 1, !tbaa !3
  %38 = getelementptr inbounds i8, i8* %6, i64 24
  %39 = icmp ugt i64 %29, 44
  br i1 %39, label %5, label %40

40:                                               ; preds = %23, %5, %3
  %41 = phi i64 [ %2, %3 ], [ %8, %5 ], [ %29, %23 ]
  %42 = phi i8* [ %1, %3 ], [ %7, %5 ], [ %30, %23 ]
  %43 = phi i8* [ %0, %3 ], [ %6, %5 ], [ %38, %23 ]
  %44 = tail call i64 @chromium_base64_decode(i8* %43, i8* %42, i64 %41) #5
  %45 = icmp eq i64 %44, -1
  %46 = ptrtoint i8* %43 to i64
  %47 = ptrtoint i8* %0 to i64
  %48 = sub i64 %46, %47
  %49 = add i64 %48, %44
  %50 = select i1 %45, i64 -1, i64 %49
  ret i64 %50
}

declare i64 @chromium_base64_decode(i8*, i8*, i64) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16>, <16 x i16>) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <32 x i8> @llvm.usub.sat.v32i8(<32 x i8>, <32 x i8>) #3

; Function Attrs: nounwind readnone
declare <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8>, <32 x i8>) #2

; Function Attrs: nounwind readnone
declare i32 @llvm.x86.avx.ptestz.256(<4 x i64>, <4 x i64>) #2

; Function Attrs: nounwind readnone
declare <16 x i16> @llvm.x86.avx2.pmadd.ub.sw(<32 x i8>, <32 x i8>) #2

; Function Attrs: nounwind readnone
declare <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16>, <16 x i16>) #2

; Function Attrs: argmemonly nofree nosync nounwind readonly willreturn
declare <8 x i32> @llvm.masked.load.v8i32.p0v8i32(<8 x i32>*, i32 immarg, <8 x i1>, <8 x i32>) #4

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="256" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+avx,+avx2,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+avx,+avx2,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nofree nosync nounwind readonly willreturn }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Homebrew clang version 12.0.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
