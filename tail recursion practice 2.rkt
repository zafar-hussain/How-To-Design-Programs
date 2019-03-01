;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |tail recursion practice 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; return the sum of the given listOf Numbers
;; sum : [listOf N] -> n

;(define (sum lon) 0)        ; stub
(check-expect (sum '()) 0)   ; basecase
(check-expect (sum '(10 0 6)) 16)

;; template used : structural recursion
#;
(define (sum lon)
  (cond
    [(empty? lon) 0]
    [else
     (+
      (first lon)
      (sum (rest lon)))]))

;; template used : tail recursion with an accumulator
(define (sum lon)
  (local [
          (define (sum lon acc)
            (cond
              [(empty? lon) acc]
              [else
               (sum (rest lon) (+ (first lon) acc))]))]
    (sum lon 0)))
;; (sum (10 0 6)) ->
;; (sum (0 6) ( .. 10 acc))
;; (sum (6) (.. 0 .. 10 acc))
;; (sum '() (.. 6 .. 0 .. 10 acc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; return the factorial for the given number
;; factorial : n -> n


;(define (factorial lon) 1)         ; stub
(check-expect (factorial 0) 1)   ; basecase
(check-expect (factorial 3) (* 3 (* 2 (* 1 1))))

;; template used : structural recursion

;> (time (factorial 10000))
;cpu time: 125 real time: 118 gc time: 93

(define (factorial n)
  (cond
    [(zero? n) 1]
    [else
     (*
      n
      (factorial (sub1 n)))]))

;; template used : tail recursion with an accumulator

;(check-expect (factorial 3) 6)
;(check-expect (factorial 3) (factorial  3                  1))
;(check-expect (factorial 3) (factorial  2            (* 3  1)))
;(check-expect (factorial 3) (factorial  1       (* 2 (* 3  1))))
;(check-expect (factorial 3) (factorial  0  (* 1 (* 2 (* 3  1)))))

;> (time (factorial 10000))
;cpu time: 110 real time: 107 gc time: 32
#;
(define (factorial n)
  (local [
          (define (factorial n acc)
            (cond
              [(zero? n) acc]
              [else
               (factorial (sub1 n) (* n  acc))]))]
    (factorial n 1)))