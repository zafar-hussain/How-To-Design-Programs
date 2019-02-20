;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname sum) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sum : lox -> x
;; returns the sum of all the items in the given list

;(define (sum lox) 0)       ; stub
(check-expect (sum '()) 0) ; basecase
(check-expect (sum '(1 2 3)) 6)

;; template used : structural recursion
#;
(define (sum lox)
  (cond
    [(empty? lox) 0]
    [else
     (+
      (first lox)
      (sum (rest lox)))]))

;; template used : accumulator

(define (sum lox)
  (local [
          (define (sum lox acc)
            (cond
              [(empty? lox) acc]
              [else
               (sum (rest lox) (+ (first lox) acc))]))]
    (sum lox 0)))
