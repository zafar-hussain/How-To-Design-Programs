;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Finger Exercises with Abstract List Functions|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Exercise 21.2.1 Use build-list
;;1. to create the lists (list 0 ... 3) and (list 1 ... 4);
;;2. to create the list (list .1 .01 .001 .0001)

;;(build-list n f) → (listof X)
;;Constructs a list by applying f to the numbers between 0 and (- n 1)
;;
;;  n : nat
;;  f : (nat -> X)

;(define (my-build-list n f) '())               ; stub
;(check-expect (my-build-list 0 identity) '())  ; basecase , (identity: X -> X) used as the function f
(check-expect (my-build-list 3 identity) (list 0 1 2))
(check-expect (my-build-list 4 add1)     (list 1 2 3 4))

(define (my-build-list n f)
  (local
    ((define (aux x n f)
       (cond
         [(= x n) '()]
         [else
          (cons
           (f x)
           (aux (add1 x) n f))])))
    (aux 0 n f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;3. to define evens, which consumes a natural number n and creates the list of the first n even
;numbers;

;(define (evens n) '())       ;stub
(check-expect (evens 4) (list 2 4 6 8))

(define (evens n)
  (local
    ((define (doubl-it x) (* (add1 x) 2)))
  (build-list n doubl-it)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
4. to define tabulate from exercise 21.1.1