;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |natural numbers 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;#lang racket
;;(require test - engine/racket - tests)

; ; ; Exercise 11.2.1 Generalize hellos to repeat, which consumes a natural number n and a symbol
; ; ; and produces a list with n occurrences of the symbol.
; ; symbol - n - times:n (number)s (symbol) -  > listOfSymbols
; ; returns a listOfSymbols, with symbol repeated n times;

; Examples

(check-expect (symbol-n-times 0 'aSymbol) empty) ; basecase
(check-expect (symbol-n-times 1 'aSymbol)(cons 'aSymbol empty))
(check-expect (symbol-n-times 3 'test)(list 'test 'test 'test))

; (define (symbol-n-times n los) empty) ; stub

;; template
#;
(define (fn-for-los n los)
  (cond
    [(zero? n) ...]
    [else
     (...
      ... (first los)
      ... (fn-for-los (sub1 n) (rest los) )

      )]

    ))

(define (symbol-n-times n s)
  (cond
    [(zero? n) empty]
    [else 
     (cons 
      s 
      (symbol-n-times (sub1 n) s )
      )]
    ))


;; ++++++++++++++++++++++++++++++++++++++++++++++++
;;; Exercise 11.2.2 Develop the function tabulate-f, which tabulates the values of
;;; ;; f : number → number
(define (f x)
  (+ (* 3 (* x x))
     (+ (* -6 x)
        -1)))
;;; for some natural numbers. Specifically, it consumes a natural number n and produces a list of nposns.
;;; The first one combines n with (f n), the second one n-1 with (f n-1), etc.
;; example
(check-expect (tabulate-f 0) empty) ; basecase
(check-expect (tabulate-f 1) (cons (make-posn 1 (f 1)) empty))
(check-expect (tabulate-f 3) (list (make-posn 3 (f 3)) (make-posn 2 (f 2)) (make-posn 1 (f 1))))

;(define (tabulate-f n) empty) ; stub

(define (tabulate-f n)
  (cond
    [(zero? n) empty]
    [else
     (cons
      (make-posn n (f n))
      (tabulate-f (sub1 n))
      )]
    ))

;; +++++++++++++++++++++++++++++++++++++++++++++++
;;; Exercise 11.2.3 Develop apply-n. The function consumes a natural number, n. It applies the
;;; function move from exercise 10.3.6 n times to FACE, the list of shapes from exercise 10.3.1.
;;; Each application should translate the shape by one pixel. The purpose of the function is to
;;; simulate a continuously moving shape on a canvas, the last missing piece of the extended
;;; exercise 10.3.

;; +++++++++++++++++++++++++++++++++++++++++++++++
;;; Exercise 11.2.4 Lists may contain lists that contain lists and so on. Here is a data definition that
;;; takes this idea to an extreme:
;;; A deep-list is either
;;; 1. s where s is some symbol or
;;; 2. (cons dl empty), where dl is a deep list.
;;; Develop the function depth, which consumes a deep list and determines how many times cons
;;; was used to construct it.
;;; Develop the function make-deep, which consumes a symbol s and a natural number and
;;; produces a deep list containing s and constructed with n conses.



;(test)







