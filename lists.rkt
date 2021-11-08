#lang racket/base


;;; File:
;;;   strings.rkt
;;; Summary:
;;;   A variety of useful procedures related to strings written by Nitin for
;;;   racket.
;;; Author:
;;;   Nitin Gupta
;;; Acknowledgements


; +--------------------+---------------------------------------------
; | Require Statements |
; +--------------------+
(require csc151)

; +-----------------------+------------------------------------------
; | Exportation Statement |
; +-----------------------+

(provide
 check-dupes)

; +-----------------+------------------------------------------------
; | List Procedures |
; +-----------------+

(define check-dupes
  (λ (lst elt)
    (length (filter (section equal? <> elt) lst))))