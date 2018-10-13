#lang racket
(require test-engine/racket-tests)

;;; Exercise 6.5.2 Develop the function time → seconds, which consumes a time structure (see
;;; exercise 6.4.2) and produces the number of seconds since midnight that the time structure
;;; represents.
;;; Example:
;;; (time → seconds (make-time 12 30 2))
;;; ;; expected value:
;;; 45002

;; give-seconds : time -> seconds
;; given a structure time, returns total number of seconds
;; structure 0f time : make-time hours minutes seconds : number number number
(define-struct time [hours minutes seconds])
;; template 
#;
(define (fn-for-time t)
(
    ... (time-hours t) ...
    ... (time-minutes t) ...
    ... (time-seconds t) ...
))

;; Examples of time
(define t000 (make-time 0 0 0)) ; basecase
(define t001 (make-time 0 0 1)) ; a second
(define t010 (make-time 0 1 0)) ; a minute
(define t100 (make-time 1 0 0)) ; an hour
(define t101 (make-time 1 0 1)) ; one hour and a second
(define t111 (make-time 1 1 1)) ; one hour, a minute and a second

;; Examples  for give-seconds

(check-expect (give-seconds t000) 0)
(check-expect (give-seconds t001) 1)
(check-expect (give-seconds t010) (+ 0 (* 60 1) 0))           ; a minute
(check-expect (give-seconds t100) (+ (* 1 60 60) 0 0))        ; an hour
(check-expect (give-seconds t101) (+ (* 1 60 60) 0 1))        ; an hour and a second
(check-expect (give-seconds t111) (+ (* 1 60 60) (* 1 60) 1)) ; one hour, a minute and a second

;; (define (give-seconds t) 0) ; stub

;; defination for give-seconds
(define (give-seconds t)
(
    +
    (* (time-hours t) 60 60)
    (* (time-minutes t) 60)
    (time-seconds t) 
))

(test)

