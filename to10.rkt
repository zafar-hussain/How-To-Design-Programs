;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname to10) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 504. Design to10. It consumes a list of digits and produces the corresponding number.
;The first item on the list is the most significant digit.
;Hence, when applied to '(1 0 2), it produces 102.

;; returns a number comprising the numbers given in a list of numbers
;; to10 : lon -> n
;; we will need to do a sum of products of items and expt number positionZA~QQQQQQQ


;(define (to10 lon) 0)           ; stub
(check-expect (to10 '()) 0)     ; basecase
(check-expect (to10 '(1 2 3)) (+ (* 100 1) (* 10 2) (* 1 3)))

;; acc is the accumulated sum of products, initial value 0
;; acc will be returned
;; we will use a decrementing index that will be multiplied with each item, initial value be lenght of lon

(define (to10 lon)
  (local [
          (define (to10 lon i acc )
            (cond
              [(empty? lon) acc]
              [else
               (to10 (rest lon) (sub1 i ) (+ (* (expt 10 i) (first lon)) acc))]))]
    (to10 lon (sub1 (length lon)) 0)))