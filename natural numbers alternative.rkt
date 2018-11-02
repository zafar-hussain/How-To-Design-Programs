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

;; product-from-minus-11 : number -> number
;; returns the product of all the numbers from n down to right before -11  


(check-expect (product-from-minus-11 -11) 1) ; basecase
(check-expect (product-from-minus-11 -10) (* 1 -10))
(check-expect (product-from-minus-11   -9) (* 1 (* -10 -9)))
;(check-expect (product-from-minus-11 -12) (error 'product-from-minus-11' "n should be greater than -11"))

;(define (product-from-minus-11 n) 1) ; stub

(define (product-from-minus-11 n)
  (cond
    [(< n -11) (error 'product-from-minus-11' "n should be greater than -11")]
    [(= -11 n) 1]
    [else
     (*
      n
      (product-from-minus-11 (sub1 n))
      )]
    ))

;Exercise 11.4.4 In exercise 11.2.2, we developed a function that tabulates some mathematical
;function f for an interval of the shape (0, n].
;Develop the function tabulate-f 20, which tabulates the values of f for natural numbers greater
;than 20. Specifically, the function consumes a natural number n greater or equal to 20 and
;produces a list of posns, each of which has the shape (make-posn n (f n)) for some n between 20
;(exclusive) and n (inclusive).

;; tabulate-f-20 : func, number -> listOfPosn
;; returns a list of Posn comprising of (n, (f n))
(define (f x) (add1 x))
(check-expect (tabulate-f-20 f 20) empty) ; basecase
(check-expect (tabulate-f-20 f 21) (cons (make-posn 21 22) empty))
(check-expect (tabulate-f-20 f 22) (list (make-posn 22 23) (make-posn 21 22)))
;(check-expect (tabulate-f-20 f 19) (error "n should be greater or equal to 20"))

;(define (tabulate-f-20 f n) empty) ; stub
(define (tabulate-f-20 f n)
  (cond
    [(< n 20) (error "n should be greater or equal to 20")]
    [(= n 20) empty]
    [else
     (cons
      (make-posn n (f n))
      (tabulate-f-20 f (sub1 n)))
     ]))

;Exercise 11.4.5 In exercises 11.2.2 and 11.4.4, we developed functions that tabulate f from some
;natural number or natural number [ > = 20] down to 0 or 20 (exclusive), respectively.
;Develop the function tabulate-f-lim, which tabulates the values of f in an analogous manner
;from some natural number n down to some other natural number limit