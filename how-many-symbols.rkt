;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname how-many-symbols) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 9.5.2 Develop the function how-many-symbols, which consumes a list of symbols and
;produces the number of items in the list.

;; how-many-symbols : los -> number
;; returns the number of items in a list
(check-expect (how-many-symbols empty) 0) ; basecase
(check-expect (how-many-symbols (cons 'aSymbol empty)) 1)
(check-expect (how-many-symbols (list '1 '2 '3)) 3)

;(define (how-many-symbols los) 0) ; stub

;; template
#;
(define (fn-for-los los)
  (cond
    [(empty? los) ...]
    [else
     (...
      ... (first los)
      ... (fn-for-los (rest los)))]
    ))
   
;; code
(define (how-many-symbols los)
  (cond
    [(empty? los) 0]
    [else
     (add1
      (how-many-symbols (rest los)))]
    ))

;Develop the function how-many-numbers, which counts how many numbers are in a list of
;numbers.
(check-expect (how-many-numbers empty) 0) ; basecase
(check-expect (how-many-numbers (cons 99 empty)) 1)
(check-expect (how-many-numbers (list 1 2 3)) 3)

;(define (how-many-numbers los) 0) ; stub
(define (how-many-numbers los) (how-many-symbols  los))


; How do how-many-symbols and how-many-numbers differ?