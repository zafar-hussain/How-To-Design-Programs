;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |priduct - tail recursion|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 499. Design an accumulator-style version of product, the function that computes the product of a list of numbers. Stop when you have formulated the accumulator invariant and have someone check it.
;
;The performance of product is O(n) where n is the length of the list. Does the accumulator version improve on this?



;; returns the product of a list of numbers
;; product : lon -> n

;(define (product lon) 1)          ; stub
(check-expect (product '()) 1)    ; basecase
(check-expect (product '(1 2 3)) 6)

;; template used : structural recursion
;(time (product (build-list 10000 add1)))
;cpu time: 140 real time: 140 gc time: 78

(define (product lon)
  (cond
    [(empty? lon) 1]
    [else
     (*
      (first lon)
      (product (rest lon)))]))


;; template used : tail recursion with an accumulator
;(time (product (build-list 10000 add1)))
;cpu time: 156 real time: 161 gc time: 80
#;
(define (product lon)
  (local [
          (define (product lon acc)
            (cond
              [(empty? lon) acc]
              [else
               (product (rest lon) (* (first lon) acc))]))]
    (product lon 1)))

  