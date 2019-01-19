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
;Exercise 23.2.1.   Develop the recursive function a-fives, which consumes a natural number and recursively
;determines the corresponding term in the above series

;; a-fives: X-> X
;(define (a-fivesn) 8)         ; stub
(check-expect (a-fives 0) 8)   ; basecase
(check-expect (a-fives 2) 18)

(define (a-fives n)
  (cond
    [(zero? n) 8]
    [else
     (+
      5
      (a-fives (sub1 n)))]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 23.2.2.   Develop the non-recursive function a-fives-closed. It consumes a natural number and
;determines the corresponding term in the above series. A non-recursive function is sometimes called a closed form. 

;; a-fives-closed: X-> X
;(define (a-fives-closed n) 8)         ; stub
(check-expect (a-fives-closed 0) 8)   ; basecase
(check-expect (a-fives-closed 2) 18)

(define (a-fives-closed n)
  (local
    ((define f (+ 3 ( * 5 ( + n 1)))))
    f))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 23.2.3 Use series to determine the sum of the a-fives sequence for the bounds 3, 7, and
;88. Can an infinite arithmetic series have a sum?

;(define (sum-of-a-fives-seq n) 8)         ; stub
(check-expect (sum-of-a-fives-seq 0)   8) 
(check-expect (sum-of-a-fives-seq 1 ) 21)

(define (sum-of-a-fives-seq n)
  (series-local a-fives-closed n))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



