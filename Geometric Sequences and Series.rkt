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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; index : 0 1   2   3 
;; value : 3 15 75 375

;Exercise 23.3.2 Develop the non-recursive function g-fives-closed. It consumes a natural number
;and determines the corresponding term in the above series

;; g-fives-close: X -> X
;; returns the geometric multiple for the given number

;(define (g-fives-closed n) 3)        ; stub
(check-expect (g-fives-closed 0) 3)  ; basecase
(check-expect (g-fives-closed 1) 15)
(check-expect (g-fives-closed 2) 75)

(define (g-fives-closed n)
  (* 3 (expt 5 n)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 23.3.3 Develop the function seq-g-fives, which consumes a natural number n and
;creates the sequence of the first n terms according to g-fives or g-fives-closed


;; seq-g-fives: X -> listOf X
;; returns a listOf g-fives, given a number n

;(define (seq-g-fives n) '(3))      ; stub
(check-expect (seq-g-fives 0) '(3)) ; basecase
(check-expect (seq-g-fives 3) '(3 15 75 375))

(define (seq-g-fives n)
  (build-list (add1 n) g-fives-closed))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
;Exercise 23.3.4 Develop geometric-series. The function consumes two numbers: start and s. Its
;result is a function that represents the geometric series whose starting point is start and whose
;factor is s. For example, (geometric-series 3 5) yields g-fives (or g-fives-closed).
              
;; geometric-series: X X -> X
;; consumes start and s and returns a function like (g-fives-closed n)

(check-expect ((geometric-series 3 5) 3) 375)

(define (geometric-series start s)
  (local
    ((define (f n)
       (* start (expt s n))))
    f))
    
