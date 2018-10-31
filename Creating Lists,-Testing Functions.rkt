;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Creating Lists,-Testing Functions|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
(check-expect (tie-dyed 1) 

(define (tie-dyed n) empty) ; stub