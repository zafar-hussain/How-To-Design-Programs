;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |natural numbers alternative|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))



;#lang racket
;(require test-engine/racket-tests)

;; !: N → N
;; to compute n · (n − 1) · … · 2 · 1
(check-expect (! 0) 1)
(check-expect (! 3) (* 3 (* 2 1)))
(check-expect (! 10) 3628800)

;(define (! n) 1) ; stub
;
(define (! n) 
  (cond
    [(zero? n) 1]
    [else
     (*
      n
      (! (sub1 n))
      )]
    ))

;
;(test)
;

;; !>n<m -> number number -> number
;; factorial between n m, where m > n
;;examples 
(check-expect (!>n<m 0 0 ) 1) ;basecase
(check-expect (!>n<m 1 10) (! 10))
(check-expect (!>n<m 20 23) (* 21 (*  22 23)))

;(define (!>n<m n m) 1) ; stub
(define (!>n<m n m)
  (cond
    [(= m n) 1 ]
    [else
     (*
      m
      (!>n<m n (sub1 m))
      )]
    ))

;Exercise 11.4.3 Develop product-from-minus-11. The function consumes an integer n greater or
;equal to -11 and produces the product of all the integers between -11 (exclusive) and n
;(inclusive).