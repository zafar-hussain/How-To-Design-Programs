;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname drawings) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;#lang racket
(require htdp/draw)

;Exercise 6.6.1 Provide a structure definition and a data definition for representing colored circles.
; A circle is characterized by three pieces of information: its center, its radius, and the
;color of its perimeter.

;; as circle needs a posn structure for center
;; posn -> make-posn x y ; a point in cartecian cordinate system
;; posn -> number number
;(define-struct posn [x y])
;; examples of posn
(define p00 (make-posn 0 0))
(define p100100 (make-posn 100 100))
(define p10 (make-posn 1 0))
(define p11 (make-posn 1 1))

;; aCircle -> make-cirle center radius color
;; aCircle ->            posn   number symbol
; The first is a posn structure, the second a number, and the third a (color) symbol.

(define-struct aCircle [center radius color])
;; examples for circle
(define c00 (make-aCircle p00 10 'red))
(define c100100 (make-aCircle p100100 10 'green))

;Develop the template fun-for-circle, which outlines a function that consumes circles. Its result is undetermined.
;; function template
#;
(define (fn-for-aCircle c)
  ... (aCircle-center c)
  ... (aCircle-radius c)
  ... (aCircle-color  c)
  )

;Exercise 6.6.2 Use fun-for-circle to develop draw-a-circle. The function consumes a circle
;structure and draws the corresponding circle on the screen. Use (start 300 300) to create the
;canvas before testing the function.

;; draw-a-circle : aCircle -> image?

;; consumes and draws a circle, centered at given posn, of radius and color extractred from circle-struct, returns true? if success
;; examples
(start 300 300)
(check-expect (draw-a-circle c00) (draw-circle (make-posn 0 0)  10 'red))       ;base-case
(check-expect (draw-a-circle c00) (draw-circle (make-posn 0 0) 10 'red))
(check-expect (draw-a-circle c100100) (draw-circle (make-posn 100 100) 10 'green))

;; (define (draw-a-circle c) (draw-circle (make-posn 10 10) 10 'purple))

(define (draw-a-circle c)
  (
   draw-circle
   (aCircle-center c)
   (aCircle-radius c)
   (aCircle-color  c)
       )
  )


;Exercise 6.6.3 Use the template fun-for-circle to develop in-circle?.
; The function consumes a circle structure and a posn and determines whether or not the pixel is inside the circle.
; All pixels whose distance to the center is less or equal to the radius are inside the circle; the others are outside.
; Consider the circle in figure 14. The circle’s center is (make-posn 6 2), its radius is 1. The
;pixel labeled A, located at (make-posn 6 1.5), is inside the circle. The pixel labeled B, located at
;(make-posn 8 6), is outside.

;; in-circle? : circle posn ->  boolean
;; returns true if the distance of given point (posn) to center of circle is less than radius of circle
;; a helper function distance-between-points is required

;; distance-between-points : posn posn -> number
;; returns the euler distance between given posn (points)
;; examples
(check-expect (distance-between-points p00 p00) 0) ; basecase
(che
(define (distance-between-points p1 p2) 0) ; stub



