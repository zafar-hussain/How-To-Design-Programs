;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Geometric Sequences and Series|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; index : 0 1   2   3 
;; value : 3 15 75 375
;Exercise 23.3.1 Develop the recursive function g-fives, which consumes a natural number and
;recursively determines the corresponding term in the above geometric sequence.

;; g-fives: X -> X
;; returns the corresponding g-five for the given number recursively

;(define (g-fives n) 3)        ; stub
(check-expect (g-fives 0) 3)  ; basecase
(check-expect (g-fives 1) 15)
(check-expect (g-fives 2) 75)

(define (g-fives n)
  (cond
    [(zero? n) 3]
    [else
     (*
      5
      (g-fives (sub1 n)))]
    ))  