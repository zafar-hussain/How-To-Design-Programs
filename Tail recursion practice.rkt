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

(define (product lox)
  (local [
          (define (product lox acc)
            (cond
              [(empty? lox) acc]
              [else
               (product (rest lox) (* (first lox) acc))]))]
    (product lox 1)))
