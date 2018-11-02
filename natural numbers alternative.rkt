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

;; tabulate-f-lim: limit, n -> n
(check-expect (tabulate-f-lim f 20 20) empty) ; basecase
(check-expect (tabulate-f-lim f 10 11) (cons (make-posn 11 (f 11)) empty))
(check-expect (tabulate-f-lim f 15 17) (list (make-posn 17 (f 17)) (make-posn 16 (f 16))))

;(define (tabulate-f-lim f limit n) empty) ; stub
(define (tabulate-f-lim f limit n)
  (cond
    [(= limit n) empty] 
    [else
     (cons
      (make-posn n (f n))
      (tabulate-f-lim f limit (sub1 n))
      )]
    ))

;Develop the function
;;; tabulate-f-up-to-20 : N [ < = 20] → N
;(define (tabulate-f-up-to-20 n-below-20) ...)
;which tabulates the values of f for natural numbers less than 20. Specifically, it consumes a
;natural number n less than or equal to 20 and produces a list of posns, each of which has the
;shape (make-posn n (f n)) for some n between 0 and n (inclusively)

;; tabulate-f-up-to-20 : N [ < = 20] → listOfPosn
;;  consumes a natural number n less than or equal to 20 and produces a list of posns
(check-expect (tabulate-f-up-to-20 f 20) empty) ; basecase
(check-expect (tabulate-f-up-to-20 f 19) (cons (make-posn 19 (f 19)) empty))
(check-expect (tabulate-f-up-to-20 f 18) (list (make-posn 18 (f 18)) (make-posn 19 (f 19))))

;(define (tabulate-f-up-to-20 f n) empty) ; stub

(define (tabulate-f-up-to-20 f n)
  (cond
    [(= n 20) empty]
    [else
     (cons
      (make-posn n (f n))
      (tabulate-f-up-to-20 f (add1 n))
      )]
    ))


;Exercise 11.4.7 Develop the function is-not-divisible-by <=i. It consumes a natural number [ > = 1],
; i, and a natural number m, with i < m. If m is not divisible by any number between 1
;(exclusive) and i (inclusive), the function produces true; otherwise, its output is false.
;Use is-not-divisible-by <=i to define prime?, which consumes a natural number and
;determines whether or not it is prime.

;; is-not-divisible-by<=i : m i[>= 1 && < m]
;; returns true if m is not divisible by any number (1 i] else false
(check-expect (is-not-divisible-by<=i 3 2) true) ; basecase 
(check-expect (is-not-divisible-by<=i 4 2) false)
(check-expect (is-not-divisible-by<=i 9 3) false)
(check-expect (is-not-divisible-by<=i 11 10) true)

;(define (is-not-divisible-by<=i m i) true) ; stub
(define (is-not-divisible-by<=i m i)
  (cond
    [(= i 1) true]
    [else
     (and
      (not (zero? (modulo m i)))
      (is-not-divisible-by<=i m (sub1 i))
      )]))



;Exercise 11.5.1 Define add, which consumes two natural numbers, n and x, and produces n + x
;without using Scheme’s +

;; add : n[number] x[number] -> number
;; returns the sum of n and x without using '+' operator
(check-expect (add  0 99) 99) ; basecase
(check-expect (add 99 1) 100)

;(define (add n x) 0) ; stub
(define (add n x)
  (cond
    [(zero? n) x]
    [else
     (add1
      (add (sub1 n) x))
     ]))


;Exercise 11.5.2 Develop the function multiply-by-pi, which consumes a natural number and
;multiplies it by 3.14 without using *. For example,
;(= (multiply-by-pi 0) 0)
;(= (multiply-by-pi 2) 6.28)
;(= (multiply-by-pi 3) 9.42)

;Define multiply, which consumes two natural numbers, n and x, and produces n * x without
;using Scheme’s *.Eliminate + from these definitions, too.

;; multiply : n[number] x[number] -> number
;; returns n times x without using '*' operator
(check-expect (multiply 0 99)           0) ; basecase
(check-expect (multiply 1 99)  (add 0 99))
(check-expect (multiply 2 99) (add 99 99))

;(define (multiply n x) 0) ; stub
(define (multiply n x)
  (cond
    [(zero? n) 0]
    [else
     (add
      x
      (multiply (sub1 n) x))]
    ))


;Exercise 11.5.3 Develop the function exponent, which consumes a natural number n and a
;number x and computes x to the power n

;; exponent : x n -> n [ all are numbers]
;; returns x to the power n, or multiplies x to x, n times
(check-expect (exponent 8 0) 1) ; basecase
(check-expect (exponent 8 1) 8)
(check-expect (exponent 8 2) (multiply 8 8))

;(define (exponent x n) 1) ; stub
(define (exponent x n)
  (cond
    [(zero? n) 1]
    [else
     (multiply
      x
      (exponent x (sub1 n))
      )]
    ))

