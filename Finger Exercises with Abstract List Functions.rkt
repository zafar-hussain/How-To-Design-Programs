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
    (my-build-list n doubl-it)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;4. to define tabulate from exercise 21.1.1
;(define (tabulate-Sin N) '())      ; stub
(check-expect (tabulate-Sin 0) '())
(check-within (tabulate-Sin 5) (list (sin 0) (sin 1) (sin 2) (sin 3) (sin 4)) 0.1)

(define (tabulate-Sin N)
  (my-build-list N sin))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;5. to define diagonal, which consumes a natural number n and creates a list of lists of 0 and 1.
;;Example:
;;(equal? (diagonal 3)
;;(list
;;(list 1 0 0)
;;(list 0 1 0)
;;(list 0 0 1)))
;;Use local if function definitions require auxiliary functions
;
;(define (diagonal N)      '())   ; stub
;(check-expect (diagonal 0) '())   ; basecase
;(check-expect (diagonal 3)
;              (list
;               (list 1 0 0)
;               (list 0 1 0)
;               (list 0 0 1)))
;
;;; f: X -> X
;;; returns 1 if given number is 3 else 0 
;
;(check-expect (f 2) 1)
;(check-expect (f 1) 0)
;(check-expect (f 0) 0)
;
;(define (f x ) (if (=  x 2) 1 0))
;
;;; rows : N -> list of N
;;; returns a list with 1 at the nth position and  zeros
;
;;(define (rows N) '())                 ; stub
;(check-expect (rows 2) (list 0 0 1))
;(check-expect (rows 1) (list 0 1 0))
;(check-expect (rows 0) (list 1 0 0))
;
;(define (rows N) (build-list 3 f))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 21.2.2 Use map to define the following functions:
;1. convert-euro, which converts a list of U.S. dollar amounts into a list of euro amounts based
;on an exchange rate of 1.22 euro for each dollar;

;; map: (f: X -> Y) listOfX -> listOfY
;; applies the given function to each element of the given list
(define (f x) (* x 1.22))

;(define (my-map f lon) '())                          ; stub
(check-expect (my-map f '())           '())          ; basecase 
(check-expect (my-map f  (list 1 2 3)) (list 1.22 2.44 3.66))

(define (my-map f lon)
  (cond
    [(empty? lon) '()]
    [else
     (cons
      (f (first lon))
      (my-map f (rest lon)))]))