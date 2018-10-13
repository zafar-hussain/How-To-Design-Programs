#lang racket
(require 2htdp/image)

;Exercise 6.6.1 Provide a structure definition and a data definition for representing colored circles.
; A circle is characterized by three pieces of information: its center, its radius, and the
;color of its perimeter.


;; posn -> make-posn x y ; a point in cartecian cordinate system
;; posn -> number number
(define-struct posn [x y])
;; examples of posn
(define p00 (make-posn 0 0))
(define p01 (make-posn 0 1))
(define p10 (make-posn 1 0))
(define p11 (make-posn 1 1))

;; aCircle -> make-cirle center radius color
;; aCircle ->            posn   number symbol

(define-struct aCircle [center radius color])



; The first is a posn structure, the second a number, and the third a (color) symbol.

;Develop the template fun-for-circle, which outlines a function that consumes circles. Its result is undetermined.