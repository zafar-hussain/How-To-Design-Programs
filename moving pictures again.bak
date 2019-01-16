;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |moving pictures again|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Exercise 6.6.1 Provide a structure definition and a data definition for representing colored
;;circles. A circle is characterized by three pieces of information: its center, its radius, and the
;;color of its perimeter. The first is a posn structure, the second a number, and the third a (color)
;;symbol

;; circle : make-circle (center radius color) : (posn number 'symbol)

(define-struct circle (center radius color))

(define red-circle   (make-circle (make-posn 100 100) 20 'red))
(define green-circle (make-circle (make-posn 200 200) 30 'green))
(define blue-circle  (make-circle (make-posn 100 100) 40 'blue))

;; template : structure
#;
(define (fn-for-circle aCircle)
  (circle-center aCircle)        ; returns a posn with x and y co-ordinates
  (circle-radius aCircle)
  (circle-color aCircle))