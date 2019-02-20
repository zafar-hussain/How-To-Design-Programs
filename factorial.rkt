;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname factorial) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; design factorial function

;; facttorial : x -> x
;; returns the factorial of the given function

;(define (factorial x) 1)        ; stub
(check-expect (factorial 0) 1)  ; terminating condition
(check-expect (factorial 3) 6)

;; template used : structural recursion
;; cpu time: 203 real time: 196 gc time: 140
#;
(define (factorial x)
  (cond
    [(zero? x) 1]
    [else
     (*
      x
      (factorial (sub1 x)))]))

;; template use : accumulator
;; (factorial 10000 : cpu time: 172 real time: 175 gc time: 140

(define (factorial x)
  (local [
          (define (factorial x acc)
            (cond
              [(zero? x) acc]
              [else
               (factorial (sub1 x) (* x acc))]))]
    (factorial x 1)))