;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname add-to-pi) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 501. Design an accumulator-style version of add-to-pi. The function adds a natural number to pi without using +:
;; N -> Number 
;; adds n to pi without using +
(check-within (add-to-pi 2) (+ 2 pi) 0.001)

#;
(define (add-to-pi n)
  (cond
    [(zero? n) pi]
    [else (add1 (add-to-pi (sub1 n)))]))

(define (add-to-pi n)
  (local [
          (define (add-to-pi n acc)
            (cond
              [(zero? n) acc]
              [else
               (add-to-pi (sub1 n) (add1 acc))]))]
    (add-to-pi n pi)))
  