;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Tail recursion practice|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 31.3.3 Develop an accumulator-style version of product, the function that computes the
;product of a list of numbers. Show the stage that explains what the accumulator represents

;; product : lox -> x
;; returns the product of number in a list

;(define (product lox)             1)         ;; stub
(check-expect (product        '()) 1)         ;; terminating condition
(check-expect (product '( 1 3 5)) 15)

;; structural recursion
#;
(define (product lox)
  (cond
    [(empty? lox) 1]
    [else
     (*
      (first lox)
      (product (rest lox)))]))

;; tail recursion with accumulator

;;(product '(2 3 4)) -> (product '(3 4) (* 2 1)))
;;                      (product '(4)   (* 3 2)))
;;                      (product '()    (* 4 6)))
;;                      (* 24 1)
(define (product lox)
  (local [
          (define (product lox acc)
            (cond
              [(empty? lox) acc]
              [else
               (product (rest lox) (* (first lox) acc))]))]
    (product lox 1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 31.3.4 Develop an accumulator-style version of how-many, which is the function that
;determines the number of items on a list. Show the stage that explains what the accumulator
;represents

;; how-many : lox -> n
;; returns the number of items in the given list

;(define (how-many lox) 0)        ; stub
(check-expect (how-many '()) 0)  ; basecase
(check-expect (how-many '(a b c)) 3)

;; template used : structural recursion
#;
(define (how-many lox)
  (cond
    [(empty? lox) 0] ;; ,- acc must be a number initial value 0
    [else
     (add1
      (how-many (rest lox)))]))


;; template used : tail recursion with an accumulator

(define (how-many lox)
  (local [
          (define (how-many lox acc)
            (cond
              [(empty? lox) acc]
              [else
               (how-many (rest lox) (add1 acc))]))]
    (how-many lox 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 31.3.5 Develop an accumulator-style version of add-to-pi, the function that adds a
;natural number to pi without using + (see section 11.5). Show the stage that explains what the
;accumulator represents.

;; add-to-pi : n -> n
;; returns the sum of the given number  and pi, without using the operator "+"
(define PI 3.14)
;(define (add-to-pi n) PI)          ; stub

(check-within (add-to-pi 0) 3.14 0.001)  ; basecase
(check-within (add-to-pi 2) 5.14 0.001)
(check-within (add-to-pi 6) 9.14 0.001)

;; template used : structural recursion
#;
(define (add-to-pi n)
  (cond
    [(zero? n) PI]
    [else
     (add1
      (add-to-pi (sub1 n)))])) 

;; template used : tail recursion with an accumulator

(define (add-to-pi n)
  ;  (local [
  ;          (define (add-to-pi n acc)
  ;            (cond
  ;              [(zero? n) acc]
  ;              [else
  ;               (add-to-pi (sub1 n) (add1 acc))]))]
  ;    (add-to-pi n PI)))
  (add-n-to-x PI n))

;Generalize the function so that it adds two numbers, the first one a natural number, without
;using +

;; add-n-to-x : x n -> x
;; returns the sum of x and n without using the operator "+"

;(define (add-n-to-x x n) x)         ; stub
(check-expect (add-n-to-x 99 0) 99) ; basecase
(check-expect (add-n-to-x 99 10) 109)

(define (add-n-to-x x n)
  (local [
          (define (add-n-to-x n acc)
            (cond
              [(zero? n) acc]
              [else
               (add-n-to-x (sub1 n) (add1 acc))]))]
    (add-n-to-x n x)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
