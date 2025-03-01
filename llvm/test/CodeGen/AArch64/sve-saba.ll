; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple aarch64-unknown-linux-gnu -mattr=+sve2 < %s | FileCheck %s

; SABA from ADD(ABS(SUB NSW))

define <vscale x 2 x i64> @saba_abs_d(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b, <vscale x 2 x i64> %c) #0 {
; CHECK-LABEL: saba_abs_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d
; CHECK-NEXT:    sub z1.d, z1.d, z2.d
; CHECK-NEXT:    abs z1.d, p0/m, z1.d
; CHECK-NEXT:    add z0.d, z0.d, z1.d
; CHECK-NEXT:    ret
  %sub = sub nsw <vscale x 2 x i64> %b, %c
  %abs = call <vscale x 2 x i64> @llvm.abs.nxv2i64(<vscale x 2 x i64> %sub, i1 true)
  %add = add <vscale x 2 x i64> %a, %abs
  ret <vscale x 2 x i64> %add
}

define <vscale x 4 x i32> @saba_abs_s(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b, <vscale x 4 x i32> %c) #0 {
; CHECK-LABEL: saba_abs_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s
; CHECK-NEXT:    sub z1.s, z1.s, z2.s
; CHECK-NEXT:    abs z1.s, p0/m, z1.s
; CHECK-NEXT:    add z0.s, z0.s, z1.s
; CHECK-NEXT:    ret
  %sub = sub nsw <vscale x 4 x i32> %b, %c
  %abs = call <vscale x 4 x i32> @llvm.abs.nxv4i32(<vscale x 4 x i32> %sub, i1 true)
  %add = add <vscale x 4 x i32> %a, %abs
  ret <vscale x 4 x i32> %add
}

define <vscale x 8 x i16> @saba_abs_h(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b, <vscale x 8 x i16> %c) #0 {
; CHECK-LABEL: saba_abs_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h
; CHECK-NEXT:    sub z1.h, z1.h, z2.h
; CHECK-NEXT:    abs z1.h, p0/m, z1.h
; CHECK-NEXT:    add z0.h, z0.h, z1.h
; CHECK-NEXT:    ret
  %sub = sub nsw <vscale x 8 x i16> %b, %c
  %abs = call <vscale x 8 x i16> @llvm.abs.nxv8i16(<vscale x 8 x i16> %sub, i1 true)
  %add = add <vscale x 8 x i16> %a, %abs
  ret <vscale x 8 x i16> %add
}

define <vscale x 16 x i8> @saba_abs_b(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c) #0 {
; CHECK-LABEL: saba_abs_b:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.b
; CHECK-NEXT:    sub z1.b, z1.b, z2.b
; CHECK-NEXT:    abs z1.b, p0/m, z1.b
; CHECK-NEXT:    add z0.b, z0.b, z1.b
; CHECK-NEXT:    ret
  %sub = sub nsw <vscale x 16 x i8> %b, %c
  %abs = call <vscale x 16 x i8> @llvm.abs.nxv16i8(<vscale x 16 x i8> %sub, i1 true)
  %add = add <vscale x 16 x i8> %a, %abs
  ret <vscale x 16 x i8> %add
}

; SABA from ADD(SABD)

define <vscale x 2 x i64> @saba_sabd_d(<vscale x 2 x i64> %a, <vscale x 2 x i64> %b, <vscale x 2 x i64> %c) #0 {
; CHECK-LABEL: saba_sabd_d:
; CHECK:       // %bb.0:
; CHECK-NEXT:    saba z0.d, z1.d, z2.d
; CHECK-NEXT:    ret
  %true = call <vscale x 2 x i1> @llvm.aarch64.sve.ptrue.nxv2i1(i32 31)
  %sabd = call <vscale x 2 x i64> @llvm.aarch64.sve.sabd.nxv2i64(<vscale x 2 x i1> %true, <vscale x 2 x i64> %b, <vscale x 2 x i64> %c)
  %add = add <vscale x 2 x i64> %sabd, %a
  ret <vscale x 2 x i64> %add
}

define <vscale x 4 x i32> @saba_sabd_s(<vscale x 4 x i32> %a, <vscale x 4 x i32> %b, <vscale x 4 x i32> %c) #0 {
; CHECK-LABEL: saba_sabd_s:
; CHECK:       // %bb.0:
; CHECK-NEXT:    saba z0.s, z1.s, z2.s
; CHECK-NEXT:    ret
  %true = call <vscale x 4 x i1> @llvm.aarch64.sve.ptrue.nxv4i1(i32 31)
  %sabd = call <vscale x 4 x i32> @llvm.aarch64.sve.sabd.nxv4i32(<vscale x 4 x i1> %true, <vscale x 4 x i32> %b, <vscale x 4 x i32> %c)
  %add = add <vscale x 4 x i32> %sabd, %a
  ret <vscale x 4 x i32> %add
}

define <vscale x 8 x i16> @saba_sabd_h(<vscale x 8 x i16> %a, <vscale x 8 x i16> %b, <vscale x 8 x i16> %c) #0 {
; CHECK-LABEL: saba_sabd_h:
; CHECK:       // %bb.0:
; CHECK-NEXT:    saba z0.h, z1.h, z2.h
; CHECK-NEXT:    ret
  %true = call <vscale x 8 x i1> @llvm.aarch64.sve.ptrue.nxv8i1(i32 31)
  %sabd = call <vscale x 8 x i16> @llvm.aarch64.sve.sabd.nxv8i16(<vscale x 8 x i1> %true, <vscale x 8 x i16> %b, <vscale x 8 x i16> %c)
  %add = add <vscale x 8 x i16> %sabd, %a
  ret <vscale x 8 x i16> %add
}

define <vscale x 16 x i8> @saba_sabd_b(<vscale x 16 x i8> %a, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c) #0 {
; CHECK-LABEL: saba_sabd_b:
; CHECK:       // %bb.0:
; CHECK-NEXT:    saba z0.b, z1.b, z2.b
; CHECK-NEXT:    ret
  %true = call <vscale x 16 x i1> @llvm.aarch64.sve.ptrue.nxv16i1(i32 31)
  %sabd = call <vscale x 16 x i8> @llvm.aarch64.sve.sabd.nxv16i8(<vscale x 16 x i1> %true, <vscale x 16 x i8> %b, <vscale x 16 x i8> %c)
  %add = add <vscale x 16 x i8> %sabd, %a
  ret <vscale x 16 x i8> %add
}

declare <vscale x 2 x i64> @llvm.abs.nxv2i64(<vscale x 2 x i64>, i1)
declare <vscale x 4 x i32> @llvm.abs.nxv4i32(<vscale x 4 x i32>, i1)
declare <vscale x 8 x i16> @llvm.abs.nxv8i16(<vscale x 8 x i16>, i1)
declare <vscale x 16 x i8> @llvm.abs.nxv16i8(<vscale x 16 x i8>, i1)

declare <vscale x  2 x i1> @llvm.aarch64.sve.ptrue.nxv2i1(i32)
declare <vscale x  4 x i1> @llvm.aarch64.sve.ptrue.nxv4i1(i32)
declare <vscale x  8 x i1> @llvm.aarch64.sve.ptrue.nxv8i1(i32)
declare <vscale x 16 x i1> @llvm.aarch64.sve.ptrue.nxv16i1(i32)

declare <vscale x 2 x i64> @llvm.aarch64.sve.sabd.nxv2i64(<vscale x  2 x i1>, <vscale x 2 x i64>, <vscale x 2 x i64>)
declare <vscale x 4 x i32> @llvm.aarch64.sve.sabd.nxv4i32(<vscale x  4 x i1>, <vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 8 x i16> @llvm.aarch64.sve.sabd.nxv8i16(<vscale x  8 x i1>, <vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 16 x i8> @llvm.aarch64.sve.sabd.nxv16i8(<vscale x 16 x i1>, <vscale x 16 x i8>, <vscale x 16 x i8>)
