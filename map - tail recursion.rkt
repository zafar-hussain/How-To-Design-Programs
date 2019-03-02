;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |map - tail recursion|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 506. Design an accumulator-style version of map.

;; map applies the given function to each item of the given list
;; my-map : [x -> x] [listOf X]

;(define (my-map fn lox) '())              ; stub
(check-expect (my-map identity '()) '())  ; basecase
(check-expect (my-map (lambda (x) (* 2 x)) '(1 2 3)) '(2 4 6))

;; template used : structural recursion
#;
(define (my-map fn lox)
  (cond
    [(empty? lox) '()]
    [else
     (cons
      (fn (first lox))
      (my-map fn (rest lox)))]))

;; template used : tail recursion with accumulator
;; acc will be the list of items on which fn has been applied
;; acc will be returned on empty lox
;; as a list is to be returned, the results are cons and initial value to acc is '()

(define (my-map fn lox)
  (local [
          (define (my-map lox acc)
            (cond
              [(empty? lox) acc]
              [else
               (my-map (rest lox) (append acc (list (fn (first lox)))))]))]
    (my-map lox '())))