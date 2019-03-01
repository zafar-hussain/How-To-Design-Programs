;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |how-many  - tail recursion|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 500. Design an accumulator-style version of how-many,
;which is the function that determines the number of items on a list.
;
;The performance of how-many is O(n) where n is the length of the list.
;Does the accumulator version improve on this?


;; returns the count of the items in the given list
;; how-many : loX -> n

;(define (how-many lox) 0)          ; stub
(check-expect (how-many '()) 0)    ; basecase
(check-expect (how-many '(1 2 3 4)) 4)

;; template used : structural recursion
#;
(define (how-many lox)
  (cond
    [(empty? lox) 0]
    [else
     (add1
      (how-many (rest lox)))]))

;; template used : tail recursion with accumulator

(define (how-many lox)
  (local [
          (define (how-many lox acc)
            (cond
              [(empty? lox) acc]
              [else
               (how-many (rest lox)  (add1 acc))]))]
    (how-many lox 0)))
            

