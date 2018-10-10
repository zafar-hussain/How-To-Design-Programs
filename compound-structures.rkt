;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname compound-structures) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;#lang racket
;(require test-engine/racket-tests)

;;; Exercise 6.1.1 Evaluate the following expressions:
;;; 1. (distance-to-0 (make-posn 3 4))
;;; 2. (distance-to-0 (make-posn (* 2 3) (* 2 4)))
;;; 3. (distance-to-0 (make-posn 12 (−6 1)))

;; posn -> (make-struct x y) -> struct
;; x y -> struct

;;(define-struct posn  ( x y))


;; distance-to-0 : posn -> number
;; returns the euler distance to (0, 0) from the given point
;; the formula for euler distance to zero being : (sqrt (x^2 + y^2))
;; Examples
(check-expect (distance-to-0 (make-posn 0 0)) 0) ; basecase
(check-within (distance-to-0 (make-posn 1 1)) (sqrt 2) 0.0001)

;(define (distance-to-0 aPosn) 0) ; stub

;; template
#;
(define (fn-for-posn aPosn)
  (
   .... (posn-x aPosn) ....
   .... (posn-y aPosn) ....
        ))
    

(define (distance-to-0 aPosn)
  (
   sqrt (
         + 
         (sqr (posn-x aPosn))
         (sqr (posn-y aPosn)))))
   


;;(test)