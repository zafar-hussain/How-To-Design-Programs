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
(stop)

;; (define (draw-a-circle c) (draw-circle (make-posn 10 10) 10 'purple))

(define (draw-a-circle c)
  (draw-circle
   (aCircle-center c)
   (aCircle-radius c)
   (aCircle-color  c)
   ))



;; a helper function distance-between-points is required

;; distance-between-points : posn posn -> number
;; returns the euler distance between given posn (points)
;; examples
(check-expect (distance-between-points p00 p00) 0) ; basecase
(check-expect (distance-between-points p00 p10) 1)
(check-within (distance-between-points p10 p100100) (sqrt (+ (sqr (- 1 100)) (sqr ( - 0 100)))) 0.0001)

;(define (distance-between-points p1 p2) 0) ; stub

(define (distance-between-points p1 p2)
  (sqrt
   (+
    (sqr
     (- (posn-x p1) (posn-x p2)))
    (sqr
     (- (posn-y p1) (posn-y p2))))))

;Exercise 6.6.3 Use the template fun-for-circle to develop in-circle?.
; The function consumes a circle structure and a posn and determines whether or not the pixel is inside the circle.
; All pixels whose distance to the center is less or equal to the radius are inside the circle; the others are outside.
; Consider the circle in figure 14. The circle’s center is (make-posn 6 2), its radius is 1. The
;pixel labeled A, located at (make-posn 6 1.5), is inside the circle. The pixel labeled B, located at
;(make-posn 8 6), is outside.

;; in-circle? : circle posn ->  boolean
;; returns true if the distance of given point (posn) to center of circle is less than radius of circle

(check-expect (in-circle? c00 p100100) false) ; basecase
(check-expect (in-circle? c00 p00) true)

;(define (in-circle? c p) false) ; stub
(define (in-circle? c p)
  (
   cond
    [(<= (distance-between-points (aCircle-center c) p) (aCircle-radius c)) true]
    [else false]
    )
  )


;Exercise 6.6.4 Use the template fun-for-circle to develop translate-circle. The function
;consumes a circle structure and a number delta. The result is a circle whose center is delta pixels
;to the right of the input. The function has no effect on the canvas.
;Geometric Translation: Moving a geometric shape along a straight line is referred to as a
;translation.

;; translate-circle : circle number -> circle
;; returns a circle structure with the center-x increased by the given delta
;; examples
(check-expect (translate-circle (make-aCircle (make-posn 0 0) 0 'red) 0) (make-aCircle (make-posn 0 0) 0 'red)) 
(check-expect (translate-circle (make-aCircle (make-posn 1 1) 10 'black) 99) (make-aCircle (make-posn 100 1) 10 'black)) 

;(define (translate-circle c n) (make-aCircle (make-posn 0 0) 0 'red)) ;stub
(define (translate-circle c n)
  (
   make-aCircle
   (make-posn
    (+ (posn-x (aCircle-center c)) n)
    (posn-y (aCircle-center c))
    )
   (aCircle-radius c)
   (aCircle-color  c)
   ))

;Exercise 6.6.5 Use the template fun-for-circle to develop clear-a-circle. The function consumes
;a circle structure and clears the corresponding circle on the canvas.

;; clear-circle : aCircle -> boolean
;; clears the given circle
(check-expect (clear-a-circle c00) (clear-circle (make-posn 0 0) 10 'red))


;;(define (clear-a-circle c) false) ; stub
(define (clear-a-circle c)
  (clear-circle
   (aCircle-center c)
   (aCircle-radius c)
   (aCircle-color  c)
   ))

;Exercise 6.6.6 Define the function draw-and-clear-circle, which draws a circle structure, waits
;for a short time, and clears it

;; draw-and-clear-circle : circle -> boolean
;; give a circlr, draws it with draw-a-circle, waits with sleep-for-a-while,and then clears it with clear-a-circle
(start 300 300)
(check-expect (draw-and-clear-circle c100100)
              (
               and
               (draw-a-circle c100100)
               (sleep-for-a-while 10)
               (clear-a-circle c100100)))
(stop)

;(define (draw-and-clear-circle c) false) ; stub

(define (draw-and-clear-circle c)
  (
   and
   (draw-a-circle c)
   (sleep-for-a-while 1)
   (clear-a-circle c)
   ))

;The following function is the key ingredient for moving a circle across a canvas, one step at a
;time:
;; move-circle : number circle → circle
;; to draw and clear a circle, translate it by delta pixels
(start 300 300)
(check-expect (move-circle c00     100) (draw-a-circle (make-aCircle (make-posn (+ 10 0) 0)      10 'red)))
(check-expect (move-circle c100100 100) (draw-a-circle (make-aCircle (make-posn (+ 10 100)  100) 10 'green)))
;;(stop)

;;(define (move-circle c n) false) ; stub

(define (move-circle c n)
(and
 (draw-and-clear-circle c)
 (draw-a-circle (translate-circle c n))
 ))

;Exercise 6.6.7 Provide a structure definition and a data definition for representing colored
;rectangles. A rectangle is characterized by four pieces of information: its upper-left corner, its
;width, its height, and its fill color. The first is a posn structure, the second and third quantities are
;plain numbers, and the last one is a color.
;Develop the template fun-for-rect, which outlines a function that consumes rectangles. Its
;result is undetermined