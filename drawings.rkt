;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname drawings) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;#lang racket
(require 2htdp/image)

;Exercise 6.6.1 Provide a structure definition and a data definition for representing colored circles.
; A circle is characterized by three pieces of information: its center, its radius, and the
;color of its perimeter.

;; as circle needs a aPosn structure for center
;; aPosn -> make-aPosn x y ; a point in cartecian cordinate system
;; aPosn -> number number
(define-struct aPosn [x y])
;; examples of aPosn
(define p00 (make-aPosn 0 0))
(define p01 (make-aPosn 0 1))
(define p10 (make-aPosn 1 0))
(define p11 (make-aPosn 1 1))

;; aCircle -> make-cirle center radius color
;; aCircle ->            aPosn   number symbol
; The first is a aPosn structure, the second a number, and the third a (color) symbol.

(define-struct aCircle [center radius color])
;; examples for circle
(define c00 (make-aCircle p00 10 'red))
(define c01 (make-aCircle p01 10 'green))

;Develop the template fun-for-circle, which outlines a function that consumes circles. Its result is undetermined.
;; function template
#;
(define (fn-for-aCircle c)
  ... (aCircle-center (aPosn-x c))
  ... (aCircle-center (aPosn-y c))
  ... (aCircle-radius c)
  ... (aCircle-color c)
  )




