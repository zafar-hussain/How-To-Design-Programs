;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Creating Lists,-Testing Functions|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require htdp/draw)

;#lang racket
;(require test-engine/racket-tests)
;
;  
;
;
;(test)
;

;Exercise 11.3.1 Scheme provides the operation random. It consumes a natural number n greater
;than 1, and produces a random integer between 0 and n - 1:
;;; random : N → N
;;; to compute a natural number between 0 and n-1
;(define (random n) …)
;Two successive uses of (random n) may produce two distinct results.
;Now consider the following definition:
;;; random-n-m : integer integer → integer
;;; …
;;; Assume: n < m
;(define (random-n-m n m)
;(+ (random (− m n)) n))
;Formulate a succinct and precise purpose statement for random-n-m. Use a number line with aninterval to explain the result of (random n). Use a symbolic evaluation to support your
;explanation

;; random-n-m ; integer integer -> integer
;; returns a random number within the range of n m
;; ++++++0++++++++n+++++++++++++++m (n < m)

(define (random-n-m n m) (+ (random (- m n)) n))

;Exercise 11.3.2 Develop the function tie-dyed. It consumes a natural number and produces a list
;of numbers. Each of these should be between 20 and 120. Use tie-dyed to test draw-circles from
;exercise 9.5.8.

;; tie-dyed : n -> listOfnumbers
;; consumes a natural number and returns a list of random numbers between 20 and 120
;; uses draw-circles to test
(check-expect (tie-dyed 0) empty) ; basecase

;(define (tie-dyed n) empty) ; stub

(define (tie-dyed n)
  (cond
    [(zero? n) empty]
    [else
     (cons
      (random-n-m 20 120)
      (tie-dyed (sub1 n)))
     ]
    ))

;Exercise 9.5.8 Develop the function draw-circles, which consumes a posn p and a list of
;numbers. Each number of the list represents the radius of some circle. The function draws
;concentric red circles around p on a canvas, using the operation draw-circle.

;; draw-circles : posn , lostOfNumbers -> boolean
;; draws circles of radii from the given listOfNumbers and centered at the given posn
(start 500 500)
(check-expect (draw-circles (make-posn 100 100) empty) true); basecase
(check-expect (draw-circles (make-posn 100 100) (cons 10 (cons 20 empty))) (and
                                                                            (draw-circle  (make-posn 100 100) 10 'red)
                                                                            (draw-circle  (make-posn 100 100) 20 'red)))


;(define (draw-circles p loN) true) ; stub
;; lon and be one of (empty or cons)
(define (draw-circles p loN)
  (cond
    [(empty? loN) true]
    [else
     (and
      (draw-circle p (first loN) 'red)
      (draw-circles p (rest loN))
      )]
    ))
  
(draw-circles (make-posn 200 200) (tie-dyed 10))



;Exercise 11.3.3 Develop the function create-temps. It consumes a natural number n and two
;integers, called low and high. It produces a list of n integers that are between low and high.
;Use create-temps to test check-range from exercise 9.5.4.
;Finally, discuss the following questions. Can we simply feed the result of create-temps into
;check-range or do we need to know the list that create-temps produced? Are there values for low
;and high such that we don’t need to know the result of create-temps and yet we can predict the
;result of the test? Which function tests which? What does this tell us about testing with
;automatically generated test data?


;Exercise 11.3.4 Develop the function create-prices, which consumes a natural number and
;produces a list with a corresponding of prices between $.10 and $10.00 with increments of a
;dime. Use create-prices to test dollar-store? from exercise 9.5.3.
;Hint: How many dimes are there between $.10 and $10.00?

