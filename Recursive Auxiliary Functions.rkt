;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Recursive Auxiliary Functions|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;#lang racket
;(require test-engine/racket-tests)
;

;; insertion-sort : listofNumbers -> listofNumbers
;; sorts the given list by insertion sort in descending
(check-expect (insertion-sort empty) empty) ; basecase
(check-expect (insertion-sort (cons 9 (cons 10 (cons 1  empty)))) (cons 10 (cons 9 (cons 1 empty))))
(check-expect (insertion-sort (list  1 2 3 4 5)) (list 5 4 3 2 1))

;(define (insertion-sort lon) empty) ; stub

(define (insertion-sort lon)
  (cond
    [(empty? lon) empty]
    [else
     (insert
      (first lon)
      (insertion-sort (rest lon))
      )]
    ))

;; insert : atomic, listOfNumbers -> listOfNumbers
;; inserts the atomic in the listOfNumbers in descending order

(check-expect (insert 3 empty) (cons 3 empty)) ; basecase
(check-expect (insert 8 (cons 10 (cons 9 (cons 1 empty)))) (cons 10 (cons 9 (cons 8 (cons 1 empty)))))

(define (insert atomic lon) (cons atomic empty) ; stub

;(test)
;
