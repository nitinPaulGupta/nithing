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
(require racket/list)

; +-----------------------+------------------------------------------
; | Exportation Statement |
; +-----------------------+

(provide
 header-maker
 tab-maker)

; +-------------------+----------------------------------------------
; | String Procedures |
; +-------------------+
;;; (header-maker name) -> <void>?
;;;   name : string?
;;; creates a properly formed header for a file
(define (header-maker name)
  (display
   (string-append "; CSC-151-02 Fall 2021\n; "
                  name
                  "\n; Author: Nitin Gupta\n; Date: {???}\n; Acknowledgements:{???}")))

;;; (tab-maker name) -> <void>?
;;;   name : string?
;;; creates a pretty tab marker for a file
(define (tab-maker name)
  (display
   (let ([len (string-length name)])
   (string-append "; +" (list->string (make-list (+ 2 len) #\-)) "+" (list->string (make-list (- 69 (+ 6 len)) #\-)) "\n"
                  "; | " name " |\n"
                  "; +" (list->string (make-list (+ 2 (string-length name)) #\-)) "+\n"))))