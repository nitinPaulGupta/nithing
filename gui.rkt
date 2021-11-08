#lang racket/gui

;;; File:
;;;   gui.rkt
;;; Summary:
;;;   Provides some *very* simple GUI functions.
;;; Author:
;;;   Nitin Gupta
;;; Acknowledgements

; +--------------------+---------------------------------------------
; | Require Statements |
; +--------------------+
(require framework)

; +-----------------------+------------------------------------------
; | Exportation Statement |
; +-----------------------+
(provide
 install?)

; +-------------------+----------------------------------------------
; | String Procedures |
; +-------------------+
(define (on-click-y frame msg proc urlname)
  (let ([flag (apply proc urlname)])
    (cond
      ([(not flag) (send msg set-label "Thanks!")
                   (sleep 3)
                   (send frame show #f)]
       [flag (send msg set-label "Already installed!")
             (sleep 3)
             (send frame show #f)]))))


  (define (on-click-n frame msg)
    (send msg set-label "Check interactions panel.")
    (displayln "This File cannot be run\nwithout the pre-requisites.\n\n")
    (sleep 1)
    (displayln "Exiting...\n\n")
    (displayln "Required file not installed.\nPlease restart and upon pop-up click [Install *file name*]")
    (send frame show #f)
    (exit))


  (define (install? proc urlname)
    (define frame (new (class frame% (super-new)
                         (define/augment (on-close)
                           (on-click-n frame msg)))
                       [label "Approve Install"]
                       [width 400]
                       [height 200]))
  
    (define msg (new message% [parent frame]
                     [label (string-append (cadr urlname) " is required for operation. Please install.")]))
  
    (new button% [parent frame]
         [label (string-append "Install " (cadr urlname))]
         ; Callback procedure for a button click:
         [callback (lambda (button event)
                     (on-click-y frame msg proc urlname))])
  
    (new button% [parent frame]
         [label (string-append "Do not install " (cadr urlname) " (REQUIRED)")]
         [callback (lambda (button event)
                     (on-click-n frame msg))])
  
    (send frame show #t))