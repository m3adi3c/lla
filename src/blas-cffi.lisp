;;;;  currently my take on BLAS: maybe not needed at all, could do
;;;;  everything in CL.  If use BLAS at all, I would only use Level 3,
;;;;  with a fraction of the options.
;;;;
;;;;  currently using: xGEMM.
;;;;  
;;;;  !!!! quick and dirty fix.  types defined in lapack-cffi.lisp
;;;;
;;;;  !!!! commented out: cdotc, cdotu, lsame, zdotc, zdotu
;;;;  !!!! not sure I want to to those in Fortran, why not Lisp?
;;;;  !!!! possibly a zillion others like that
;;;;

(IN-PACKAGE :lla)



(CFFI:DEFCFUN ("caxpy_" %CAXPY) :VOID (N FORTRAN-INT)
              (CA FORTRAN-COMPLEX-FLOAT) (CX CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT) (CY CFFI-FNV-COMPLEX-FLOAT)
              (INCY FORTRAN-INT))
;; (EXPORT '%CAXPY :BLAS-CFFI)

(CFFI:DEFCFUN ("ccopy_" %CCOPY) :VOID (N FORTRAN-INT)
              (CX CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT)
              (CY CFFI-FNV-COMPLEX-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%CCOPY :BLAS-CFFI)

;; (CFFI:DEFCFUN ("cdotc_" %CDOTC) :COMPLEX-FLOAT (N FORTRAN-INT)
;;               (CX CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT)
;;               (CY CFFI-FNV-COMPLEX-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%CDOTC :BLAS-CFFI)

;; (CFFI:DEFCFUN ("cdotu_" %CDOTU) :COMPLEX-FLOAT (N FORTRAN-INT)
;;               (CX CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT)
;;               (CY CFFI-FNV-COMPLEX-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%CDOTU :BLAS-CFFI)

(CFFI:DEFCFUN ("cgbmv_" %CGBMV) :VOID (TRANS :STRING) (M FORTRAN-INT)
              (N FORTRAN-INT) (KL FORTRAN-INT) (KU FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-FLOAT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT) (X CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT) (BETA FORTRAN-COMPLEX-FLOAT)
              (Y CFFI-FNV-COMPLEX-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%CGBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("cgemm_" %CGEMM) :VOID (TRANSA :STRING) (TRANSB :STRING)
              (M FORTRAN-INT) (N FORTRAN-INT) (K FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-FLOAT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT) (B CFFI-FNV-COMPLEX-FLOAT) (LDB FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-FLOAT) (C CFFI-FNV-COMPLEX-FLOAT)
              (LDC FORTRAN-INT))
;; (EXPORT '%CGEMM :BLAS-CFFI)

(CFFI:DEFCFUN ("cgemv_" %CGEMV) :VOID (TRANS :STRING) (M FORTRAN-INT)
              (N FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-FLOAT)
              (A CFFI-FNV-COMPLEX-FLOAT) (LDA FORTRAN-INT)
              (X CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-FLOAT) (Y CFFI-FNV-COMPLEX-FLOAT)
              (INCY FORTRAN-INT))
;; (EXPORT '%CGEMV :BLAS-CFFI)

(CFFI:DEFCFUN ("cgerc_" %CGERC) :VOID (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-FLOAT) (X CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT) (Y CFFI-FNV-COMPLEX-FLOAT)
              (INCY FORTRAN-INT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT))
;; (EXPORT '%CGERC :BLAS-CFFI)

(CFFI:DEFCFUN ("cgeru_" %CGERU) :VOID (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-FLOAT) (X CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT) (Y CFFI-FNV-COMPLEX-FLOAT)
              (INCY FORTRAN-INT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT))
;; (EXPORT '%CGERU :BLAS-CFFI)

(CFFI:DEFCFUN ("chbmv_" %CHBMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (K FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-FLOAT)
              (A CFFI-FNV-COMPLEX-FLOAT) (LDA FORTRAN-INT)
              (X CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-FLOAT) (Y CFFI-FNV-COMPLEX-FLOAT)
              (INCY FORTRAN-INT))
;; (EXPORT '%CHBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("chemm_" %CHEMM) :VOID (SIDE :STRING) (UPLO :STRING)
              (M FORTRAN-INT) (N FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-FLOAT)
              (A CFFI-FNV-COMPLEX-FLOAT) (LDA FORTRAN-INT)
              (B CFFI-FNV-COMPLEX-FLOAT) (LDB FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-FLOAT) (C CFFI-FNV-COMPLEX-FLOAT)
              (LDC FORTRAN-INT))
;; (EXPORT '%CHEMM :BLAS-CFFI)

(CFFI:DEFCFUN ("chemv_" %CHEMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-FLOAT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT) (X CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT) (BETA FORTRAN-COMPLEX-FLOAT)
              (Y CFFI-FNV-COMPLEX-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%CHEMV :BLAS-CFFI)

(CFFI:DEFCFUN ("cher_" %CHER) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (X CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT))
;; (EXPORT '%CHER :BLAS-CFFI)

(CFFI:DEFCFUN ("cher2_" %CHER2) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-FLOAT) (X CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT) (Y CFFI-FNV-COMPLEX-FLOAT)
              (INCY FORTRAN-INT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT))
;; (EXPORT '%CHER2 :BLAS-CFFI)

(CFFI:DEFCFUN ("cher2k_" %CHER2K) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-FLOAT)
              (A CFFI-FNV-COMPLEX-FLOAT) (LDA FORTRAN-INT)
              (B CFFI-FNV-COMPLEX-FLOAT) (LDB FORTRAN-INT)
              (BETA FORTRAN-FLOAT) (C CFFI-FNV-COMPLEX-FLOAT)
              (LDC FORTRAN-INT))
;; (EXPORT '%CHER2K :BLAS-CFFI)

(CFFI:DEFCFUN ("cherk_" %CHERK) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-FLOAT)
              (A CFFI-FNV-COMPLEX-FLOAT) (LDA FORTRAN-INT)
              (BETA FORTRAN-FLOAT) (C CFFI-FNV-COMPLEX-FLOAT)
              (LDC FORTRAN-INT))
;; (EXPORT '%CHERK :BLAS-CFFI)

(CFFI:DEFCFUN ("chpmv_" %CHPMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-FLOAT) (AP CFFI-FNV-COMPLEX-FLOAT)
              (X CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-FLOAT) (Y CFFI-FNV-COMPLEX-FLOAT)
              (INCY FORTRAN-INT))
;; (EXPORT '%CHPMV :BLAS-CFFI)

(CFFI:DEFCFUN ("chpr_" %CHPR) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (X CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT) (AP CFFI-FNV-COMPLEX-FLOAT))
;; (EXPORT '%CHPR :BLAS-CFFI)

(CFFI:DEFCFUN ("chpr2_" %CHPR2) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-FLOAT) (X CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT) (Y CFFI-FNV-COMPLEX-FLOAT)
              (INCY FORTRAN-INT) (AP CFFI-FNV-COMPLEX-FLOAT))
;; (EXPORT '%CHPR2 :BLAS-CFFI)

(CFFI:DEFCFUN ("crotg_" %CROTG) :VOID (CA FORTRAN-COMPLEX-FLOAT)
              (CB FORTRAN-COMPLEX-FLOAT) (C FORTRAN-FLOAT)
              (S FORTRAN-COMPLEX-FLOAT))
;; (EXPORT '%CROTG :BLAS-CFFI)

(CFFI:DEFCFUN ("cscal_" %CSCAL) :VOID (N FORTRAN-INT)
              (CA FORTRAN-COMPLEX-FLOAT) (CX CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT))
;; (EXPORT '%CSCAL :BLAS-CFFI)

(CFFI:DEFCFUN ("csscal_" %CSSCAL) :VOID (N FORTRAN-INT) (SA FORTRAN-FLOAT)
              (CX CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%CSSCAL :BLAS-CFFI)

(CFFI:DEFCFUN ("cswap_" %CSWAP) :VOID (N FORTRAN-INT)
              (CX CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT)
              (CY CFFI-FNV-COMPLEX-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%CSWAP :BLAS-CFFI)

(CFFI:DEFCFUN ("csymm_" %CSYMM) :VOID (SIDE :STRING) (UPLO :STRING)
              (M FORTRAN-INT) (N FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-FLOAT)
              (A CFFI-FNV-COMPLEX-FLOAT) (LDA FORTRAN-INT)
              (B CFFI-FNV-COMPLEX-FLOAT) (LDB FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-FLOAT) (C CFFI-FNV-COMPLEX-FLOAT)
              (LDC FORTRAN-INT))
;; (EXPORT '%CSYMM :BLAS-CFFI)

(CFFI:DEFCFUN ("csyr2k_" %CSYR2K) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-FLOAT)
              (A CFFI-FNV-COMPLEX-FLOAT) (LDA FORTRAN-INT)
              (B CFFI-FNV-COMPLEX-FLOAT) (LDB FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-FLOAT) (C CFFI-FNV-COMPLEX-FLOAT)
              (LDC FORTRAN-INT))
;; (EXPORT '%CSYR2K :BLAS-CFFI)

(CFFI:DEFCFUN ("csyrk_" %CSYRK) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-FLOAT)
              (A CFFI-FNV-COMPLEX-FLOAT) (LDA FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-FLOAT) (C CFFI-FNV-COMPLEX-FLOAT)
              (LDC FORTRAN-INT))
;; (EXPORT '%CSYRK :BLAS-CFFI)

(CFFI:DEFCFUN ("ctbmv_" %CTBMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (K FORTRAN-INT)
              (A CFFI-FNV-COMPLEX-FLOAT) (LDA FORTRAN-INT)
              (X CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%CTBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("ctbsv_" %CTBSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (K FORTRAN-INT)
              (A CFFI-FNV-COMPLEX-FLOAT) (LDA FORTRAN-INT)
              (X CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%CTBSV :BLAS-CFFI)

(CFFI:DEFCFUN ("ctpmv_" %CTPMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (AP CFFI-FNV-COMPLEX-FLOAT)
              (X CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%CTPMV :BLAS-CFFI)

(CFFI:DEFCFUN ("ctpsv_" %CTPSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (AP CFFI-FNV-COMPLEX-FLOAT)
              (X CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%CTPSV :BLAS-CFFI)

(CFFI:DEFCFUN ("ctrmm_" %CTRMM) :VOID (SIDE :STRING) (UPLO :STRING)
              (TRANSA :STRING) (DIAG :STRING) (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-FLOAT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT) (B CFFI-FNV-COMPLEX-FLOAT) (LDB FORTRAN-INT))
;; (EXPORT '%CTRMM :BLAS-CFFI)

(CFFI:DEFCFUN ("ctrmv_" %CTRMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT) (X CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT))
;; (EXPORT '%CTRMV :BLAS-CFFI)

(CFFI:DEFCFUN ("ctrsm_" %CTRSM) :VOID (SIDE :STRING) (UPLO :STRING)
              (TRANSA :STRING) (DIAG :STRING) (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-FLOAT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT) (B CFFI-FNV-COMPLEX-FLOAT) (LDB FORTRAN-INT))
;; (EXPORT '%CTRSM :BLAS-CFFI)

(CFFI:DEFCFUN ("ctrsv_" %CTRSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (A CFFI-FNV-COMPLEX-FLOAT)
              (LDA FORTRAN-INT) (X CFFI-FNV-COMPLEX-FLOAT)
              (INCX FORTRAN-INT))
;; (EXPORT '%CTRSV :BLAS-CFFI)

(CFFI:DEFCFUN ("dasum_" %DASUM) :DOUBLE (N FORTRAN-INT) (DX CFFI-FNV-DOUBLE)
              (INCX FORTRAN-INT))
;; (EXPORT '%DASUM :BLAS-CFFI)

(CFFI:DEFCFUN ("daxpy_" %DAXPY) :VOID (N FORTRAN-INT) (DA FORTRAN-DOUBLE)
              (DX CFFI-FNV-DOUBLE) (INCX FORTRAN-INT) (DY CFFI-FNV-DOUBLE)
              (INCY FORTRAN-INT))
;; (EXPORT '%DAXPY :BLAS-CFFI)

(CFFI:DEFCFUN ("dcabs1_" %DCABS1) :DOUBLE (Z FORTRAN-COMPLEX-DOUBLE))
;; (EXPORT '%DCABS1 :BLAS-CFFI)

(CFFI:DEFCFUN ("dcopy_" %DCOPY) :VOID (N FORTRAN-INT) (DX CFFI-FNV-DOUBLE)
              (INCX FORTRAN-INT) (DY CFFI-FNV-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%DCOPY :BLAS-CFFI)

(CFFI:DEFCFUN ("ddot_" %DDOT) :DOUBLE (N FORTRAN-INT) (DX CFFI-FNV-DOUBLE)
              (INCX FORTRAN-INT) (DY CFFI-FNV-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%DDOT :BLAS-CFFI)

(CFFI:DEFCFUN ("dgbmv_" %DGBMV) :VOID (TRANS :STRING) (M FORTRAN-INT)
              (N FORTRAN-INT) (KL FORTRAN-INT) (KU FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT)
              (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT) (BETA FORTRAN-DOUBLE)
              (Y CFFI-FNV-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%DGBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("dgemm_" %DGEMM) :VOID (TRANSA :STRING) (TRANSB :STRING)
              (M FORTRAN-INT) (N FORTRAN-INT) (K FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT)
              (B CFFI-FNV-DOUBLE) (LDB FORTRAN-INT) (BETA FORTRAN-DOUBLE)
              (C CFFI-FNV-DOUBLE) (LDC FORTRAN-INT))
;; (EXPORT '%DGEMM :BLAS-CFFI)

(CFFI:DEFCFUN ("dgemv_" %DGEMV) :VOID (TRANS :STRING) (M FORTRAN-INT)
              (N FORTRAN-INT) (ALPHA FORTRAN-DOUBLE) (A CFFI-FNV-DOUBLE)
              (LDA FORTRAN-INT) (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT)
              (BETA FORTRAN-DOUBLE) (Y CFFI-FNV-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%DGEMV :BLAS-CFFI)

(CFFI:DEFCFUN ("dger_" %DGER) :VOID (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT)
              (Y CFFI-FNV-DOUBLE) (INCY FORTRAN-INT) (A CFFI-FNV-DOUBLE)
              (LDA FORTRAN-INT))
;; (EXPORT '%DGER :BLAS-CFFI)

(CFFI:DEFCFUN ("dnrm2_" %DNRM2) :DOUBLE (N FORTRAN-INT) (X CFFI-FNV-DOUBLE)
              (INCX FORTRAN-INT))
;; (EXPORT '%DNRM2 :BLAS-CFFI)

(CFFI:DEFCFUN ("drot_" %DROT) :VOID (N FORTRAN-INT) (DX CFFI-FNV-DOUBLE)
              (INCX FORTRAN-INT) (DY CFFI-FNV-DOUBLE) (INCY FORTRAN-INT)
              (C FORTRAN-DOUBLE) (S FORTRAN-DOUBLE))
;; (EXPORT '%DROT :BLAS-CFFI)

(CFFI:DEFCFUN ("drotg_" %DROTG) :VOID (DA FORTRAN-DOUBLE) (DB FORTRAN-DOUBLE)
              (C FORTRAN-DOUBLE) (S FORTRAN-DOUBLE))
;; (EXPORT '%DROTG :BLAS-CFFI)

(CFFI:DEFCFUN ("dsbmv_" %DSBMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (K FORTRAN-INT) (ALPHA FORTRAN-DOUBLE) (A CFFI-FNV-DOUBLE)
              (LDA FORTRAN-INT) (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT)
              (BETA FORTRAN-DOUBLE) (Y CFFI-FNV-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%DSBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("dscal_" %DSCAL) :VOID (N FORTRAN-INT) (DA FORTRAN-DOUBLE)
              (DX CFFI-FNV-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%DSCAL :BLAS-CFFI)

(CFFI:DEFCFUN ("dspmv_" %DSPMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (AP CFFI-FNV-DOUBLE)
              (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT) (BETA FORTRAN-DOUBLE)
              (Y CFFI-FNV-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%DSPMV :BLAS-CFFI)

(CFFI:DEFCFUN ("dspr_" %DSPR) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT)
              (AP CFFI-FNV-DOUBLE))
;; (EXPORT '%DSPR :BLAS-CFFI)

(CFFI:DEFCFUN ("dspr2_" %DSPR2) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT)
              (Y CFFI-FNV-DOUBLE) (INCY FORTRAN-INT) (AP CFFI-FNV-DOUBLE))
;; (EXPORT '%DSPR2 :BLAS-CFFI)

(CFFI:DEFCFUN ("dswap_" %DSWAP) :VOID (N FORTRAN-INT) (DX CFFI-FNV-DOUBLE)
              (INCX FORTRAN-INT) (DY CFFI-FNV-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%DSWAP :BLAS-CFFI)

(CFFI:DEFCFUN ("dsymm_" %DSYMM) :VOID (SIDE :STRING) (UPLO :STRING)
              (M FORTRAN-INT) (N FORTRAN-INT) (ALPHA FORTRAN-DOUBLE)
              (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT) (B CFFI-FNV-DOUBLE)
              (LDB FORTRAN-INT) (BETA FORTRAN-DOUBLE) (C CFFI-FNV-DOUBLE)
              (LDC FORTRAN-INT))
;; (EXPORT '%DSYMM :BLAS-CFFI)

(CFFI:DEFCFUN ("dsymv_" %DSYMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT)
              (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT) (BETA FORTRAN-DOUBLE)
              (Y CFFI-FNV-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%DSYMV :BLAS-CFFI)

(CFFI:DEFCFUN ("dsyr_" %DSYR) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT)
              (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT))
;; (EXPORT '%DSYR :BLAS-CFFI)

(CFFI:DEFCFUN ("dsyr2_" %DSYR2) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT)
              (Y CFFI-FNV-DOUBLE) (INCY FORTRAN-INT) (A CFFI-FNV-DOUBLE)
              (LDA FORTRAN-INT))
;; (EXPORT '%DSYR2 :BLAS-CFFI)

(CFFI:DEFCFUN ("dsyr2k_" %DSYR2K) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-DOUBLE)
              (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT) (B CFFI-FNV-DOUBLE)
              (LDB FORTRAN-INT) (BETA FORTRAN-DOUBLE) (C CFFI-FNV-DOUBLE)
              (LDC FORTRAN-INT))
;; (EXPORT '%DSYR2K :BLAS-CFFI)

(CFFI:DEFCFUN ("dsyrk_" %DSYRK) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-DOUBLE)
              (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT) (BETA FORTRAN-DOUBLE)
              (C CFFI-FNV-DOUBLE) (LDC FORTRAN-INT))
;; (EXPORT '%DSYRK :BLAS-CFFI)

(CFFI:DEFCFUN ("dtbmv_" %DTBMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (K FORTRAN-INT)
              (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT) (X CFFI-FNV-DOUBLE)
              (INCX FORTRAN-INT))
;; (EXPORT '%DTBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("dtbsv_" %DTBSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (K FORTRAN-INT)
              (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT) (X CFFI-FNV-DOUBLE)
              (INCX FORTRAN-INT))
;; (EXPORT '%DTBSV :BLAS-CFFI)

(CFFI:DEFCFUN ("dtpmv_" %DTPMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (AP CFFI-FNV-DOUBLE)
              (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%DTPMV :BLAS-CFFI)

(CFFI:DEFCFUN ("dtpsv_" %DTPSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (AP CFFI-FNV-DOUBLE)
              (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%DTPSV :BLAS-CFFI)

(CFFI:DEFCFUN ("dtrmm_" %DTRMM) :VOID (SIDE :STRING) (UPLO :STRING)
              (TRANSA :STRING) (DIAG :STRING) (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT)
              (B CFFI-FNV-DOUBLE) (LDB FORTRAN-INT))
;; (EXPORT '%DTRMM :BLAS-CFFI)

(CFFI:DEFCFUN ("dtrmv_" %DTRMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (A CFFI-FNV-DOUBLE)
              (LDA FORTRAN-INT) (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%DTRMV :BLAS-CFFI)

(CFFI:DEFCFUN ("dtrsm_" %DTRSM) :VOID (SIDE :STRING) (UPLO :STRING)
              (TRANSA :STRING) (DIAG :STRING) (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (A CFFI-FNV-DOUBLE) (LDA FORTRAN-INT)
              (B CFFI-FNV-DOUBLE) (LDB FORTRAN-INT))
;; (EXPORT '%DTRSM :BLAS-CFFI)

(CFFI:DEFCFUN ("dtrsv_" %DTRSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (A CFFI-FNV-DOUBLE)
              (LDA FORTRAN-INT) (X CFFI-FNV-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%DTRSV :BLAS-CFFI)

(CFFI:DEFCFUN ("dzasum_" %DZASUM) :DOUBLE (N FORTRAN-INT)
              (ZX CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%DZASUM :BLAS-CFFI)

(CFFI:DEFCFUN ("dznrm2_" %DZNRM2) :DOUBLE (N FORTRAN-INT)
              (X CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%DZNRM2 :BLAS-CFFI)

(CFFI:DEFCFUN ("icamax_" %ICAMAX) :INT32 (N FORTRAN-INT)
              (CX CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%ICAMAX :BLAS-CFFI)

(CFFI:DEFCFUN ("idamax_" %IDAMAX) :INT32 (N FORTRAN-INT) (DX CFFI-FNV-DOUBLE)
              (INCX FORTRAN-INT))
;; (EXPORT '%IDAMAX :BLAS-CFFI)

(CFFI:DEFCFUN ("isamax_" %ISAMAX) :INT32 (N FORTRAN-INT) (SX CFFI-FNV-FLOAT)
              (INCX FORTRAN-INT))
;; (EXPORT '%ISAMAX :BLAS-CFFI)

(CFFI:DEFCFUN ("izamax_" %IZAMAX) :INT32 (N FORTRAN-INT)
              (ZX CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%IZAMAX :BLAS-CFFI)

;; (CFFI:DEFCFUN ("lsame_" %LSAME) LOGICAL (CA :STRING) (CB :STRING))
;; (EXPORT '%LSAME :BLAS-CFFI)

(CFFI:DEFCFUN ("sasum_" %SASUM) :FLOAT (N FORTRAN-INT) (SX CFFI-FNV-FLOAT)
              (INCX FORTRAN-INT))
;; (EXPORT '%SASUM :BLAS-CFFI)

(CFFI:DEFCFUN ("saxpy_" %SAXPY) :VOID (N FORTRAN-INT) (SA FORTRAN-FLOAT)
              (SX CFFI-FNV-FLOAT) (INCX FORTRAN-INT) (SY CFFI-FNV-FLOAT)
              (INCY FORTRAN-INT))
;; (EXPORT '%SAXPY :BLAS-CFFI)

(CFFI:DEFCFUN ("scasum_" %SCASUM) :FLOAT (N FORTRAN-INT)
              (CX CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%SCASUM :BLAS-CFFI)

(CFFI:DEFCFUN ("scnrm2_" %SCNRM2) :FLOAT (N FORTRAN-INT)
              (X CFFI-FNV-COMPLEX-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%SCNRM2 :BLAS-CFFI)

(CFFI:DEFCFUN ("scopy_" %SCOPY) :VOID (N FORTRAN-INT) (SX CFFI-FNV-FLOAT)
              (INCX FORTRAN-INT) (SY CFFI-FNV-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%SCOPY :BLAS-CFFI)

(CFFI:DEFCFUN ("sdot_" %SDOT) :FLOAT (N FORTRAN-INT) (SX CFFI-FNV-FLOAT)
              (INCX FORTRAN-INT) (SY CFFI-FNV-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%SDOT :BLAS-CFFI)

(CFFI:DEFCFUN ("sgbmv_" %SGBMV) :VOID (TRANS :STRING) (M FORTRAN-INT)
              (N FORTRAN-INT) (KL FORTRAN-INT) (KU FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT)
              (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT) (BETA FORTRAN-FLOAT)
              (Y CFFI-FNV-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%SGBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("sgemm_" %SGEMM) :VOID (TRANSA :STRING) (TRANSB :STRING)
              (M FORTRAN-INT) (N FORTRAN-INT) (K FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT)
              (B CFFI-FNV-FLOAT) (LDB FORTRAN-INT) (BETA FORTRAN-FLOAT)
              (C CFFI-FNV-FLOAT) (LDC FORTRAN-INT))
;; (EXPORT '%SGEMM :BLAS-CFFI)

(CFFI:DEFCFUN ("sgemv_" %SGEMV) :VOID (TRANS :STRING) (M FORTRAN-INT)
              (N FORTRAN-INT) (ALPHA FORTRAN-FLOAT) (A CFFI-FNV-FLOAT)
              (LDA FORTRAN-INT) (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT)
              (BETA FORTRAN-FLOAT) (Y CFFI-FNV-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%SGEMV :BLAS-CFFI)

(CFFI:DEFCFUN ("sger_" %SGER) :VOID (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT)
              (Y CFFI-FNV-FLOAT) (INCY FORTRAN-INT) (A CFFI-FNV-FLOAT)
              (LDA FORTRAN-INT))
;; (EXPORT '%SGER :BLAS-CFFI)

(CFFI:DEFCFUN ("snrm2_" %SNRM2) :FLOAT (N FORTRAN-INT) (X CFFI-FNV-FLOAT)
              (INCX FORTRAN-INT))
;; (EXPORT '%SNRM2 :BLAS-CFFI)

(CFFI:DEFCFUN ("srot_" %SROT) :VOID (N FORTRAN-INT) (SX CFFI-FNV-FLOAT)
              (INCX FORTRAN-INT) (SY CFFI-FNV-FLOAT) (INCY FORTRAN-INT)
              (C FORTRAN-FLOAT) (S FORTRAN-FLOAT))
;; (EXPORT '%SROT :BLAS-CFFI)

(CFFI:DEFCFUN ("srotg_" %SROTG) :VOID (SA FORTRAN-FLOAT) (SB FORTRAN-FLOAT)
              (C FORTRAN-FLOAT) (S FORTRAN-FLOAT))
;; (EXPORT '%SROTG :BLAS-CFFI)

(CFFI:DEFCFUN ("ssbmv_" %SSBMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (K FORTRAN-INT) (ALPHA FORTRAN-FLOAT) (A CFFI-FNV-FLOAT)
              (LDA FORTRAN-INT) (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT)
              (BETA FORTRAN-FLOAT) (Y CFFI-FNV-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%SSBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("sscal_" %SSCAL) :VOID (N FORTRAN-INT) (SA FORTRAN-FLOAT)
              (SX CFFI-FNV-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%SSCAL :BLAS-CFFI)

(CFFI:DEFCFUN ("sspmv_" %SSPMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (AP CFFI-FNV-FLOAT) (X CFFI-FNV-FLOAT)
              (INCX FORTRAN-INT) (BETA FORTRAN-FLOAT) (Y CFFI-FNV-FLOAT)
              (INCY FORTRAN-INT))
;; (EXPORT '%SSPMV :BLAS-CFFI)

(CFFI:DEFCFUN ("sspr_" %SSPR) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT)
              (AP CFFI-FNV-FLOAT))
;; (EXPORT '%SSPR :BLAS-CFFI)

(CFFI:DEFCFUN ("sspr2_" %SSPR2) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT)
              (Y CFFI-FNV-FLOAT) (INCY FORTRAN-INT) (AP CFFI-FNV-FLOAT))
;; (EXPORT '%SSPR2 :BLAS-CFFI)

(CFFI:DEFCFUN ("sswap_" %SSWAP) :VOID (N FORTRAN-INT) (SX CFFI-FNV-FLOAT)
              (INCX FORTRAN-INT) (SY CFFI-FNV-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%SSWAP :BLAS-CFFI)

(CFFI:DEFCFUN ("ssymm_" %SSYMM) :VOID (SIDE :STRING) (UPLO :STRING)
              (M FORTRAN-INT) (N FORTRAN-INT) (ALPHA FORTRAN-FLOAT)
              (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT) (B CFFI-FNV-FLOAT)
              (LDB FORTRAN-INT) (BETA FORTRAN-FLOAT) (C CFFI-FNV-FLOAT)
              (LDC FORTRAN-INT))
;; (EXPORT '%SSYMM :BLAS-CFFI)

(CFFI:DEFCFUN ("ssymv_" %SSYMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT)
              (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT) (BETA FORTRAN-FLOAT)
              (Y CFFI-FNV-FLOAT) (INCY FORTRAN-INT))
;; (EXPORT '%SSYMV :BLAS-CFFI)

(CFFI:DEFCFUN ("ssyr_" %SSYR) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT)
              (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT))
;; (EXPORT '%SSYR :BLAS-CFFI)

(CFFI:DEFCFUN ("ssyr2_" %SSYR2) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT)
              (Y CFFI-FNV-FLOAT) (INCY FORTRAN-INT) (A CFFI-FNV-FLOAT)
              (LDA FORTRAN-INT))
;; (EXPORT '%SSYR2 :BLAS-CFFI)

(CFFI:DEFCFUN ("ssyr2k_" %SSYR2K) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-FLOAT)
              (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT) (B CFFI-FNV-FLOAT)
              (LDB FORTRAN-INT) (BETA FORTRAN-FLOAT) (C CFFI-FNV-FLOAT)
              (LDC FORTRAN-INT))
;; (EXPORT '%SSYR2K :BLAS-CFFI)

(CFFI:DEFCFUN ("ssyrk_" %SSYRK) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-FLOAT)
              (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT) (BETA FORTRAN-FLOAT)
              (C CFFI-FNV-FLOAT) (LDC FORTRAN-INT))
;; (EXPORT '%SSYRK :BLAS-CFFI)

(CFFI:DEFCFUN ("stbmv_" %STBMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (K FORTRAN-INT)
              (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT) (X CFFI-FNV-FLOAT)
              (INCX FORTRAN-INT))
;; (EXPORT '%STBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("stbsv_" %STBSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (K FORTRAN-INT)
              (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT) (X CFFI-FNV-FLOAT)
              (INCX FORTRAN-INT))
;; (EXPORT '%STBSV :BLAS-CFFI)

(CFFI:DEFCFUN ("stpmv_" %STPMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (AP CFFI-FNV-FLOAT)
              (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%STPMV :BLAS-CFFI)

(CFFI:DEFCFUN ("stpsv_" %STPSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (AP CFFI-FNV-FLOAT)
              (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%STPSV :BLAS-CFFI)

(CFFI:DEFCFUN ("strmm_" %STRMM) :VOID (SIDE :STRING) (UPLO :STRING)
              (TRANSA :STRING) (DIAG :STRING) (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT)
              (B CFFI-FNV-FLOAT) (LDB FORTRAN-INT))
;; (EXPORT '%STRMM :BLAS-CFFI)

(CFFI:DEFCFUN ("strmv_" %STRMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (A CFFI-FNV-FLOAT)
              (LDA FORTRAN-INT) (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%STRMV :BLAS-CFFI)

(CFFI:DEFCFUN ("strsm_" %STRSM) :VOID (SIDE :STRING) (UPLO :STRING)
              (TRANSA :STRING) (DIAG :STRING) (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-FLOAT) (A CFFI-FNV-FLOAT) (LDA FORTRAN-INT)
              (B CFFI-FNV-FLOAT) (LDB FORTRAN-INT))
;; (EXPORT '%STRSM :BLAS-CFFI)

(CFFI:DEFCFUN ("strsv_" %STRSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (A CFFI-FNV-FLOAT)
              (LDA FORTRAN-INT) (X CFFI-FNV-FLOAT) (INCX FORTRAN-INT))
;; (EXPORT '%STRSV :BLAS-CFFI)

(CFFI:DEFCFUN ("xerbla_" %XERBLA) :VOID (SRNAME :STRING) (INFO FORTRAN-INT))
;; (EXPORT '%XERBLA :BLAS-CFFI)

(CFFI:DEFCFUN ("zaxpy_" %ZAXPY) :VOID (N FORTRAN-INT)
              (ZA FORTRAN-COMPLEX-DOUBLE) (ZX CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT) (ZY CFFI-FNV-COMPLEX-DOUBLE)
              (INCY FORTRAN-INT))
;; (EXPORT '%ZAXPY :BLAS-CFFI)

(CFFI:DEFCFUN ("zcopy_" %ZCOPY) :VOID (N FORTRAN-INT)
              (ZX CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT)
              (ZY CFFI-FNV-COMPLEX-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%ZCOPY :BLAS-CFFI)

;; (CFFI:DEFCFUN ("zdotc_" %ZDOTC) :COMPLEX-DOUBLE (N FORTRAN-INT)
;;               (ZX CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT)
;;               (ZY CFFI-FNV-COMPLEX-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%ZDOTC :BLAS-CFFI)

;; (CFFI:DEFCFUN ("zdotu_" %ZDOTU) :COMPLEX-DOUBLE (N FORTRAN-INT)
;;               (ZX CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT)
;;               (ZY CFFI-FNV-COMPLEX-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%ZDOTU :BLAS-CFFI)

(CFFI:DEFCFUN ("zdscal_" %ZDSCAL) :VOID (N FORTRAN-INT) (DA FORTRAN-DOUBLE)
              (ZX CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%ZDSCAL :BLAS-CFFI)

(CFFI:DEFCFUN ("zgbmv_" %ZGBMV) :VOID (TRANS :STRING) (M FORTRAN-INT)
              (N FORTRAN-INT) (KL FORTRAN-INT) (KU FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-DOUBLE) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT) (X CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT) (BETA FORTRAN-COMPLEX-DOUBLE)
              (Y CFFI-FNV-COMPLEX-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%ZGBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("zgemm_" %ZGEMM) :VOID (TRANSA :STRING) (TRANSB :STRING)
              (M FORTRAN-INT) (N FORTRAN-INT) (K FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-DOUBLE) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT) (B CFFI-FNV-COMPLEX-DOUBLE)
              (LDB FORTRAN-INT) (BETA FORTRAN-COMPLEX-DOUBLE)
              (C CFFI-FNV-COMPLEX-DOUBLE) (LDC FORTRAN-INT))
;; (EXPORT '%ZGEMM :BLAS-CFFI)

(CFFI:DEFCFUN ("zgemv_" %ZGEMV) :VOID (TRANS :STRING) (M FORTRAN-INT)
              (N FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-DOUBLE)
              (A CFFI-FNV-COMPLEX-DOUBLE) (LDA FORTRAN-INT)
              (X CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-DOUBLE) (Y CFFI-FNV-COMPLEX-DOUBLE)
              (INCY FORTRAN-INT))
;; (EXPORT '%ZGEMV :BLAS-CFFI)

(CFFI:DEFCFUN ("zgerc_" %ZGERC) :VOID (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-DOUBLE) (X CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT) (Y CFFI-FNV-COMPLEX-DOUBLE)
              (INCY FORTRAN-INT) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT))
;; (EXPORT '%ZGERC :BLAS-CFFI)

(CFFI:DEFCFUN ("zgeru_" %ZGERU) :VOID (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-DOUBLE) (X CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT) (Y CFFI-FNV-COMPLEX-DOUBLE)
              (INCY FORTRAN-INT) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT))
;; (EXPORT '%ZGERU :BLAS-CFFI)

(CFFI:DEFCFUN ("zhbmv_" %ZHBMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (K FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-DOUBLE)
              (A CFFI-FNV-COMPLEX-DOUBLE) (LDA FORTRAN-INT)
              (X CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-DOUBLE) (Y CFFI-FNV-COMPLEX-DOUBLE)
              (INCY FORTRAN-INT))
;; (EXPORT '%ZHBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("zhemm_" %ZHEMM) :VOID (SIDE :STRING) (UPLO :STRING)
              (M FORTRAN-INT) (N FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-DOUBLE)
              (A CFFI-FNV-COMPLEX-DOUBLE) (LDA FORTRAN-INT)
              (B CFFI-FNV-COMPLEX-DOUBLE) (LDB FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-DOUBLE) (C CFFI-FNV-COMPLEX-DOUBLE)
              (LDC FORTRAN-INT))
;; (EXPORT '%ZHEMM :BLAS-CFFI)

(CFFI:DEFCFUN ("zhemv_" %ZHEMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-DOUBLE) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT) (X CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT) (BETA FORTRAN-COMPLEX-DOUBLE)
              (Y CFFI-FNV-COMPLEX-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%ZHEMV :BLAS-CFFI)

(CFFI:DEFCFUN ("zher_" %ZHER) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (X CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT))
;; (EXPORT '%ZHER :BLAS-CFFI)

(CFFI:DEFCFUN ("zher2_" %ZHER2) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-DOUBLE) (X CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT) (Y CFFI-FNV-COMPLEX-DOUBLE)
              (INCY FORTRAN-INT) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT))
;; (EXPORT '%ZHER2 :BLAS-CFFI)

(CFFI:DEFCFUN ("zher2k_" %ZHER2K) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-DOUBLE)
              (A CFFI-FNV-COMPLEX-DOUBLE) (LDA FORTRAN-INT)
              (B CFFI-FNV-COMPLEX-DOUBLE) (LDB FORTRAN-INT)
              (BETA FORTRAN-DOUBLE) (C CFFI-FNV-COMPLEX-DOUBLE)
              (LDC FORTRAN-INT))
;; (EXPORT '%ZHER2K :BLAS-CFFI)

(CFFI:DEFCFUN ("zherk_" %ZHERK) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-DOUBLE)
              (A CFFI-FNV-COMPLEX-DOUBLE) (LDA FORTRAN-INT)
              (BETA FORTRAN-DOUBLE) (C CFFI-FNV-COMPLEX-DOUBLE)
              (LDC FORTRAN-INT))
;; (EXPORT '%ZHERK :BLAS-CFFI)

(CFFI:DEFCFUN ("zhpmv_" %ZHPMV) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-DOUBLE) (AP CFFI-FNV-COMPLEX-DOUBLE)
              (X CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-DOUBLE) (Y CFFI-FNV-COMPLEX-DOUBLE)
              (INCY FORTRAN-INT))
;; (EXPORT '%ZHPMV :BLAS-CFFI)

(CFFI:DEFCFUN ("zhpr_" %ZHPR) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-DOUBLE) (X CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT) (AP CFFI-FNV-COMPLEX-DOUBLE))
;; (EXPORT '%ZHPR :BLAS-CFFI)

(CFFI:DEFCFUN ("zhpr2_" %ZHPR2) :VOID (UPLO :STRING) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-DOUBLE) (X CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT) (Y CFFI-FNV-COMPLEX-DOUBLE)
              (INCY FORTRAN-INT) (AP CFFI-FNV-COMPLEX-DOUBLE))
;; (EXPORT '%ZHPR2 :BLAS-CFFI)

(CFFI:DEFCFUN ("zrotg_" %ZROTG) :VOID (CA FORTRAN-COMPLEX-DOUBLE)
              (CB FORTRAN-COMPLEX-DOUBLE) (C FORTRAN-DOUBLE)
              (S FORTRAN-COMPLEX-DOUBLE))
;; (EXPORT '%ZROTG :BLAS-CFFI)

(CFFI:DEFCFUN ("zscal_" %ZSCAL) :VOID (N FORTRAN-INT)
              (ZA FORTRAN-COMPLEX-DOUBLE) (ZX CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT))
;; (EXPORT '%ZSCAL :BLAS-CFFI)

(CFFI:DEFCFUN ("zswap_" %ZSWAP) :VOID (N FORTRAN-INT)
              (ZX CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT)
              (ZY CFFI-FNV-COMPLEX-DOUBLE) (INCY FORTRAN-INT))
;; (EXPORT '%ZSWAP :BLAS-CFFI)

(CFFI:DEFCFUN ("zsymm_" %ZSYMM) :VOID (SIDE :STRING) (UPLO :STRING)
              (M FORTRAN-INT) (N FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-DOUBLE)
              (A CFFI-FNV-COMPLEX-DOUBLE) (LDA FORTRAN-INT)
              (B CFFI-FNV-COMPLEX-DOUBLE) (LDB FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-DOUBLE) (C CFFI-FNV-COMPLEX-DOUBLE)
              (LDC FORTRAN-INT))
;; (EXPORT '%ZSYMM :BLAS-CFFI)

(CFFI:DEFCFUN ("zsyr2k_" %ZSYR2K) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-DOUBLE)
              (A CFFI-FNV-COMPLEX-DOUBLE) (LDA FORTRAN-INT)
              (B CFFI-FNV-COMPLEX-DOUBLE) (LDB FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-DOUBLE) (C CFFI-FNV-COMPLEX-DOUBLE)
              (LDC FORTRAN-INT))
;; (EXPORT '%ZSYR2K :BLAS-CFFI)

(CFFI:DEFCFUN ("zsyrk_" %ZSYRK) :VOID (UPLO :STRING) (TRANS :STRING)
              (N FORTRAN-INT) (K FORTRAN-INT) (ALPHA FORTRAN-COMPLEX-DOUBLE)
              (A CFFI-FNV-COMPLEX-DOUBLE) (LDA FORTRAN-INT)
              (BETA FORTRAN-COMPLEX-DOUBLE) (C CFFI-FNV-COMPLEX-DOUBLE)
              (LDC FORTRAN-INT))
;; (EXPORT '%ZSYRK :BLAS-CFFI)

(CFFI:DEFCFUN ("ztbmv_" %ZTBMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (K FORTRAN-INT)
              (A CFFI-FNV-COMPLEX-DOUBLE) (LDA FORTRAN-INT)
              (X CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%ZTBMV :BLAS-CFFI)

(CFFI:DEFCFUN ("ztbsv_" %ZTBSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (K FORTRAN-INT)
              (A CFFI-FNV-COMPLEX-DOUBLE) (LDA FORTRAN-INT)
              (X CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%ZTBSV :BLAS-CFFI)

(CFFI:DEFCFUN ("ztpmv_" %ZTPMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (AP CFFI-FNV-COMPLEX-DOUBLE)
              (X CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%ZTPMV :BLAS-CFFI)

(CFFI:DEFCFUN ("ztpsv_" %ZTPSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (AP CFFI-FNV-COMPLEX-DOUBLE)
              (X CFFI-FNV-COMPLEX-DOUBLE) (INCX FORTRAN-INT))
;; (EXPORT '%ZTPSV :BLAS-CFFI)

(CFFI:DEFCFUN ("ztrmm_" %ZTRMM) :VOID (SIDE :STRING) (UPLO :STRING)
              (TRANSA :STRING) (DIAG :STRING) (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-DOUBLE) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT) (B CFFI-FNV-COMPLEX-DOUBLE)
              (LDB FORTRAN-INT))
;; (EXPORT '%ZTRMM :BLAS-CFFI)

(CFFI:DEFCFUN ("ztrmv_" %ZTRMV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT) (X CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT))
;; (EXPORT '%ZTRMV :BLAS-CFFI)

(CFFI:DEFCFUN ("ztrsm_" %ZTRSM) :VOID (SIDE :STRING) (UPLO :STRING)
              (TRANSA :STRING) (DIAG :STRING) (M FORTRAN-INT) (N FORTRAN-INT)
              (ALPHA FORTRAN-COMPLEX-DOUBLE) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT) (B CFFI-FNV-COMPLEX-DOUBLE)
              (LDB FORTRAN-INT))
;; (EXPORT '%ZTRSM :BLAS-CFFI)

(CFFI:DEFCFUN ("ztrsv_" %ZTRSV) :VOID (UPLO :STRING) (TRANS :STRING)
              (DIAG :STRING) (N FORTRAN-INT) (A CFFI-FNV-COMPLEX-DOUBLE)
              (LDA FORTRAN-INT) (X CFFI-FNV-COMPLEX-DOUBLE)
              (INCX FORTRAN-INT))
;; (EXPORT '%ZTRSV :BLAS-CFFI)

