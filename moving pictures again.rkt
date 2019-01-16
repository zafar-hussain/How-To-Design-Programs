;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |moving pictures again|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require htdp/draw)
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 6.6.2 Use fun-for-circle to develop draw-a-circle. The function consumes a circle
;structure and draws the corresponding circle on the screen. Use (start 300 300) to create the
;canvas before testing the function.

;; draw-a-circle : (make-circle (posn number symbol))
;; draws the given circle structure

(define (draw-a-circle aCircle)
  (draw-circle
   (circle-center aCircle)      
   (circle-radius aCircle)
   (circle-color aCircle)))

;(require htdp/draw)
;(start 300 300) 
;(draw-a-circle red-circle)
;(sleep-for-a-while 2)
;(draw-a-circle blue-circle)
;(sleep-for-a-while 2)
;(stop)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 6.6.4 Use the template fun-for-circle to develop translate-circle. The function
;consumes a circle structure and a number delta. The result is a circle whose center is delta pixels
;to the right of the input.The function has no effect on the canvas.

;; translate-circle: make-circle (center radius color), X -> make-circle (center radius color)
;; returna s new cirsle-struct with  X added  to the x-co-ordinates of the center posn of the given circle

;(define (translate-circle aCircle delta) (make-circle (make-posn 0 0) 0 'red))
(check-expect ( translate-circle (make-circle (make-posn 10 10) 10 'red) 10) (make-circle (make-posn 20 10) 10 'red))

(define (translate-circle aCircle delta)
  (make-circle
   (make-posn (+ delta (posn-x (circle-center aCircle)))  (posn-y (circle-center aCircle)))       ; returns a posn with x and y co-ordinates
   (circle-radius aCircle)
   (circle-color aCircle)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 6.6.5 Use the template fun-for-circle to develop clear-a-circle. The function consumes
;a circle structure and clears the corresponding circle on the canvas.

;(define (clear-a-circle aCircle) #f)    ;ctub
(start 300 300) 
(draw-a-circle red-circle)
(check-expect (clear-a-circle red-circle) #t)
(sleep-for-a-while 2)
(stop)

(define (clear-a-circle aCircle)
  (clear-circle
   (circle-center aCircle)        ; returns a posn with x and y co-ordinates
   (circle-radius aCircle)
   (circle-color aCircle)))


;(start 300 300) 
;(draw-a-circle red-circle)
;(sleep-for-a-while 2)
;(clear-a-circle red-circle)
;(sleep-for-a-while 2)
;(stop)