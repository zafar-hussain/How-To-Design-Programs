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