;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Mathematical Examples|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; make-even : X -> X[even]
;; given a number, it returns a corresponding even number

;define (make-even n) 0)             ; stub
(check-expect (make-even 0) 0)
(check-expect (make-even 3) 6)

(define (make-even n) (* n 2))
  
;; series-even : X -> X
;; given a number, resturns the sum of corresponfing even numbers

;(define (series-even n) 0)        ; stub
(check-expect (series-even 0) 0)  ; basecase
(check-expect (series-even 9) 90)

(define (series-even n)
  (cond
    [(zero? n) (make-even n)]
    [else
     (+
      (make-even n)
      (series-even (sub1 n)))]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; make-odd : X -> X[odd]
;; given a number, it returns a corresponding odd number

;define (make-odd n) 0)             ; stub
(check-expect (make-odd 0) 1)
(check-expect (make-odd 3) 7)

(define (make-odd n) (add1 (* n 2)))
  
;; series-odd : X -> X
;; given a number, resturns the sum of corresponfing odd numbers

;(define (series-odd n) 0)        ; stub
(check-expect (series-odd 0) 1)  ; basecase
(check-expect (series-odd 9) 100)

(define (series-odd n)
  (cond
    [(zero? n) (make-odd n)]
    [else
     (+
      (make-odd n)
      (series-odd (sub1 n)))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 23.1.1.                    Use local to create series-local from series-even and series-odd.
;Show with a hand-evaluation that (series-local make-even) is equivalent to series-even.

;; series-local :(f: X -> X) -> X
;; based on the given function, it will return a sum of either even or odd series

;(define (series-local f n) 0)      ; stub
(check-expect (series-local make-even 0)                0)
(check-expect (series-local make-even 10) (series-even 10))
(check-expect (series-local make-odd  10)  (series-odd 10))

(define (series-local f n)
  (local
    ((define (series n)
       (cond
         [(zero? n) (f n)]
         [else
          (+
           (f n)
           (series (sub1 n)))])))
    (series n)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;index  0  1  2  3  4  5 ...
;series 8 13 18 23 28 33 ...
;Exercise 23.2.1.   Develop the recursive function g-fives, which consumes a natural number and recursively
;determines the corresponding term in the above series

;; g-fives: X-> X
;(define (g-fives n) 8)         ; stub
(check-expect (g-fives 0) 8)   ; basecase
(check-expect (g-fives 2) 18)

(define (g-fives n)
  (cond
    [(zero? n) 8]
    [else
     (+
      5
      (g-fives (sub1 n)))]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 23.2.2.   Develop the non-recursive function g-fives-closed. It consumes a natural number and
;determines the corresponding term in the above series. A non-recursive function is sometimes called a closed form. 

;; g-fives-closed: X-> X
;(define (g-fives-closed n) 8)         ; stub
(check-expect (g-fives-closed 0) 8)   ; basecase
(check-expect (g-fives-closed 2) 18)

(define (g-fives-closed n)
  (local
    ((define f (+ 3 ( * 5 ( + n 1)))))
    f))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 23.3.3.   Develop the function seq-g-fives, which consumes a natural number n and creates the sequence
;of the first n terms according to g-fives or g-fives-closed

;(define (seq-g-fives n) '())      ; stub
(check-expect (seq-g-fives 0) '(8))
(check-expect (seq-g-fives 5) '(8 13 18 23 28 33))

(define (seq-g-fives n)
  (build-list (add1 n) g-fives-closed))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 23.3.4.   Develop geometric-series. The function consumes two numbers: start and s. Its result is a function that
;represents the geometric series whose starting point is start and whose factor is s. For example, (geometric-series 3 5) yields
;g-fives (or g-fives-closed)

;; geometric-series: X Y -> listOf X
;; returns a geomentric series (list) whose starting point and factor is given

;(define (geometric-series start s)     8)     ; start
(check-expect (geometric-series 3 5)   8)
;(check-expect (geometric-series 3 5) 8)

;(define (geometric-series start s)
;  (local
;    ((define (f n) (+ start ( * s ( + n 1)))))
;    f))
;  






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 23.3.5.   Use series to determine the sum of the g-fives sequence for the bounds 3, 7, and 88. Use series to
;determine the sum of (geometric-series 1 .1) for the bounds 3, 7, 88. Can an infinite geometric series have a sum?

