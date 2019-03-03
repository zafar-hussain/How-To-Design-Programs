;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname build-list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Task 2 Design build-l*st using an accumulator-style approach.
;The function must satisfy the following tests:
;(check-expect (build-l*st n f) (build-list n f))
;
;for any natural number n and function f.

;; builds a list of n items with the f appled to each item
;; build-l*st : x [x -> y] -> [listOf y]

;(define (build-l*st n f) '())                  ; stub
(check-expect (build-l*st 0 identity) '())     ; basecase
(check-expect (build-l*st 3 identity) '(0 1 2)) 
;(check-expect (build-l*st n f) (build-list n f))

;; template used : structural recursion

(define (build-l*st n f)
  (local [
          (define (build-l*st n acc)
            (cond
              [(zero? n) acc]
              [else
               (build-l*st (sub1 n) (append (list (f (sub1 n))) acc))]))]
    (build-l*st n '())))