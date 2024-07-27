; ModuleID = 'src/fastavxbase64.c'
source_filename = "src/fastavxbase64.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx14.0.0"

; Function Attrs: nounwind ssp uwtable
define dso_local i64 @fast_avx2_base64_encode(i8* %0, i8* %1, i64 %2) local_unnamed_addr #0 {
  %4 = icmp ugt i64 %2, 27
  br i1 %4, label %5, label %32

5:                                                ; preds = %3
  %6 = getelementptr inbounds i8, i8* %1, i64 -4
  %7 = bitcast i8* %6 to <8 x i32>*
  %8 = call <8 x i32> @llvm.masked.load.v8i32.p0v8i32(<8 x i32>* nonnull %7, i32 1, <8 x i1> <i1 false, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <8 x i32> <i32 0, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>)
  %9 = bitcast <8 x i32> %8 to <4 x i64>
  %10 = call fastcc <4 x i64> @enc_reshuffle(<4 x i64> %9)
  %11 = call fastcc <4 x i64> @enc_translate(<4 x i64> %10)
  %12 = bitcast i8* %0 to <4 x i64>*
  store <4 x i64> %11, <4 x i64>* %12, align 1, !tbaa !3
  %13 = getelementptr inbounds i8, i8* %1, i64 24
  %14 = getelementptr inbounds i8, i8* %0, i64 32
  %15 = add i64 %2, -24
  %16 = icmp ugt i64 %15, 31
  br i1 %16, label %17, label %32

17:                                               ; preds = %5, %17
  %18 = phi i64 [ %30, %17 ], [ %15, %5 ]
  %19 = phi i8* [ %29, %17 ], [ %14, %5 ]
  %20 = phi i8* [ %28, %17 ], [ %13, %5 ]
  %21 = phi i8* [ %20, %17 ], [ %1, %5 ]
  %22 = getelementptr inbounds i8, i8* %21, i64 20
  %23 = bitcast i8* %22 to <4 x i64>*
  %24 = load <4 x i64>, <4 x i64>* %23, align 1, !tbaa !3
  %25 = call fastcc <4 x i64> @enc_reshuffle(<4 x i64> %24)
  %26 = call fastcc <4 x i64> @enc_translate(<4 x i64> %25)
  %27 = bitcast i8* %19 to <4 x i64>*
  store <4 x i64> %26, <4 x i64>* %27, align 1, !tbaa !3
  %28 = getelementptr inbounds i8, i8* %20, i64 24
  %29 = getelementptr inbounds i8, i8* %19, i64 32
  %30 = add i64 %18, -24
  %31 = icmp ugt i64 %30, 31
  br i1 %31, label %17, label %32, !llvm.loop !6

32:                                               ; preds = %17, %5, %3
  %33 = phi i8* [ %1, %3 ], [ %13, %5 ], [ %28, %17 ]
  %34 = phi i64 [ %2, %3 ], [ %15, %5 ], [ %30, %17 ]
  %35 = phi i8* [ %0, %3 ], [ %14, %5 ], [ %29, %17 ]
  %36 = call i64 @chromium_base64_encode(i8* %35, i8* %33, i64 %34) #6
  %37 = icmp eq i64 %36, -1
  %38 = ptrtoint i8* %35 to i64
  %39 = ptrtoint i8* %0 to i64
  %40 = sub i64 %38, %39
  %41 = add i64 %40, %36
  %42 = select i1 %37, i64 -1, i64 %41
  ret i64 %42
}

; Function Attrs: inlinehint nounwind readnone ssp uwtable willreturn
define internal fastcc <4 x i64> @enc_reshuffle(<4 x i64> %0) unnamed_addr #1 {
  %2 = bitcast <4 x i64> %0 to <32 x i8>
  %3 = shufflevector <32 x i8> %2, <32 x i8> poison, <32 x i32> <i32 5, i32 4, i32 6, i32 5, i32 8, i32 7, i32 9, i32 8, i32 11, i32 10, i32 12, i32 11, i32 14, i32 13, i32 15, i32 14, i32 17, i32 16, i32 18, i32 17, i32 20, i32 19, i32 21, i32 20, i32 23, i32 22, i32 24, i32 23, i32 26, i32 25, i32 27, i32 26>
  %4 = bitcast <32 x i8> %3 to <16 x i16>
  %5 = and <16 x i16> %4, <i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032, i16 -1024, i16 4032>
  %6 = call <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16> %5, <16 x i16> <i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024, i16 64, i16 1024>) #6
  %7 = bitcast <32 x i8> %3 to <16 x i16>
  %8 = and <16 x i16> %7, <i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63, i16 1008, i16 63>
  %9 = shl <16 x i16> %8, <i16 4, i16 8, i16 4, i16 8, i16 4, i16 8, i16 4, i16 8, i16 4, i16 8, i16 4, i16 8, i16 4, i16 8, i16 4, i16 8>
  %10 = or <16 x i16> %6, %9
  %11 = bitcast <16 x i16> %10 to <4 x i64>
  ret <4 x i64> %11
}

; Function Attrs: inlinehint nounwind readnone ssp uwtable willreturn
define internal fastcc <4 x i64> @enc_translate(<4 x i64> %0) unnamed_addr #1 {
  %2 = bitcast <4 x i64> %0 to <32 x i8>
  %3 = call <32 x i8> @llvm.usub.sat.v32i8(<32 x i8> %2, <32 x i8> <i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51, i8 51>) #6
  %4 = icmp sgt <32 x i8> %2, <i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25, i8 25>
  %5 = zext <32 x i1> %4 to <32 x i8>
  %6 = add nuw <32 x i8> %3, %5
  %7 = call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> <i8 65, i8 71, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -19, i8 -16, i8 0, i8 0, i8 65, i8 71, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -4, i8 -19, i8 -16, i8 0, i8 0>, <32 x i8> %6) #6
  %8 = add <32 x i8> %7, %2
  %9 = bitcast <32 x i8> %8 to <4 x i64>
  ret <4 x i64> %9
}

declare i64 @chromium_base64_encode(i8*, i8*, i64) local_unnamed_addr #2

; Function Attrs: nounwind ssp uwtable
define dso_local i64 @fast_avx2_base64_decode(i8* %0, i8* %1, i64 %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %37, %3
  %5 = phi i64 [ %2, %3 ], [ %38, %37 ]
  %6 = phi i8* [ %1, %3 ], [ %39, %37 ]
  %7 = phi i8* [ %0, %3 ], [ %40, %37 ]
  %8 = icmp ugt i64 %5, 44
  br i1 %8, label %9, label %41

9:                                                ; preds = %4
  %10 = bitcast i8* %6 to <4 x i64>*
  %11 = load <4 x i64>, <4 x i64>* %10, align 1, !tbaa !3
  %12 = bitcast <4 x i64> %11 to <8 x i32>
  %13 = lshr <8 x i32> %12, <i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4>
  %14 = bitcast <4 x i64> %11 to <32 x i8>
  %15 = and <32 x i8> %14, <i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47>
  %16 = call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> <i8 21, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 19, i8 26, i8 27, i8 27, i8 27, i8 26, i8 21, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 17, i8 19, i8 26, i8 27, i8 27, i8 27, i8 26>, <32 x i8> %15) #6
  %17 = bitcast <32 x i8> %16 to <4 x i64>
  %18 = bitcast <4 x i64> %11 to <32 x i8>
  %19 = bitcast <8 x i32> %13 to <32 x i8>
  %20 = and <32 x i8> %19, <i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47>
  %21 = call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> <i8 16, i8 16, i8 1, i8 2, i8 4, i8 8, i8 4, i8 8, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 1, i8 2, i8 4, i8 8, i8 4, i8 8, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16, i8 16>, <32 x i8> %20) #6
  %22 = bitcast <32 x i8> %21 to <4 x i64>
  %23 = call i32 @llvm.x86.avx.ptestz.256(<4 x i64> %17, <4 x i64> %22) #6
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %37, label %25

25:                                               ; preds = %9
  %26 = icmp eq <32 x i8> %18, <i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47, i8 47>
  %27 = sext <32 x i1> %26 to <32 x i8>
  %28 = add nsw <32 x i8> %20, %27
  %29 = call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> <i8 0, i8 16, i8 19, i8 4, i8 -65, i8 -65, i8 -71, i8 -71, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 16, i8 19, i8 4, i8 -65, i8 -65, i8 -71, i8 -71, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, <32 x i8> %28) #6
  %30 = add <32 x i8> %29, %18
  %31 = bitcast <32 x i8> %30 to <4 x i64>
  %32 = add i64 %5, -32
  %33 = getelementptr inbounds i8, i8* %6, i64 32
  %34 = call fastcc <4 x i64> @dec_reshuffle(<4 x i64> %31)
  %35 = bitcast i8* %7 to <4 x i64>*
  store <4 x i64> %34, <4 x i64>* %35, align 1, !tbaa !3
  %36 = getelementptr inbounds i8, i8* %7, i64 24
  br label %37

37:                                               ; preds = %9, %25
  %38 = phi i64 [ %32, %25 ], [ %5, %9 ]
  %39 = phi i8* [ %33, %25 ], [ %6, %9 ]
  %40 = phi i8* [ %36, %25 ], [ %7, %9 ]
  br i1 %24, label %41, label %4, !llvm.loop !8

41:                                               ; preds = %37, %4
  %42 = phi i64 [ %38, %37 ], [ %5, %4 ]
  %43 = phi i8* [ %39, %37 ], [ %6, %4 ]
  %44 = phi i8* [ %40, %37 ], [ %7, %4 ]
  %45 = call i64 @chromium_base64_decode(i8* %44, i8* %43, i64 %42) #6
  %46 = icmp eq i64 %45, -1
  %47 = ptrtoint i8* %44 to i64
  %48 = ptrtoint i8* %0 to i64
  %49 = sub i64 %47, %48
  %50 = add i64 %49, %45
  %51 = select i1 %46, i64 -1, i64 %50
  ret i64 %51
}

; Function Attrs: inlinehint nounwind readnone ssp uwtable willreturn
define internal fastcc <4 x i64> @dec_reshuffle(<4 x i64> %0) unnamed_addr #1 {
  %2 = bitcast <4 x i64> %0 to <32 x i8>
  %3 = call <16 x i16> @llvm.x86.avx2.pmadd.ub.sw(<32 x i8> %2, <32 x i8> <i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1, i8 64, i8 1>) #6
  %4 = call <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16> %3, <16 x i16> <i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1, i16 4096, i16 1>) #6
  %5 = bitcast <8 x i32> %4 to <32 x i8>
  %6 = shufflevector <32 x i8> %5, <32 x i8> <i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 0, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison, i8 poison>, <32 x i32> <i32 2, i32 1, i32 0, i32 6, i32 5, i32 4, i32 10, i32 9, i32 8, i32 14, i32 13, i32 12, i32 undef, i32 undef, i32 undef, i32 undef, i32 18, i32 17, i32 16, i32 22, i32 21, i32 20, i32 26, i32 25, i32 24, i32 30, i32 29, i32 28, i32 48, i32 48, i32 48, i32 48>
  %7 = bitcast <32 x i8> %6 to <8 x i32>
  %8 = shufflevector <8 x i32> %7, <8 x i32> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 4, i32 5, i32 6, i32 7, i32 7>
  %9 = bitcast <8 x i32> %8 to <4 x i64>
  ret <4 x i64> %9
}

declare i64 @chromium_base64_decode(i8*, i8*, i64) local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare <16 x i16> @llvm.x86.avx2.pmulhu.w(<16 x i16>, <16 x i16>) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <32 x i8> @llvm.usub.sat.v32i8(<32 x i8>, <32 x i8>) #4

; Function Attrs: nounwind readnone
declare <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8>, <32 x i8>) #3

; Function Attrs: nounwind readnone
declare i32 @llvm.x86.avx.ptestz.256(<4 x i64>, <4 x i64>) #3

; Function Attrs: nounwind readnone
declare <16 x i16> @llvm.x86.avx2.pmadd.ub.sw(<32 x i8>, <32 x i8>) #3

; Function Attrs: nounwind readnone
declare <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16>, <16 x i16>) #3

; Function Attrs: argmemonly nofree nosync nounwind readonly willreturn
declare <8 x i32> @llvm.masked.load.v8i32.p0v8i32(<8 x i32>*, i32 immarg, <8 x i1>, <8 x i32>) #5

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="256" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+avx,+avx2,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind readnone ssp uwtable willreturn "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="256" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+avx,+avx2,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+avx,+avx2,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { argmemonly nofree nosync nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Homebrew clang version 12.0.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !9, !7}
!9 = !{!"llvm.loop.mustprogress"}
