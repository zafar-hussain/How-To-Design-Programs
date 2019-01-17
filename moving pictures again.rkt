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

;Exercise 6.6.3 Use the template fun-for-circle to develop in-circle?. The function consumes a
;circle structure and a posn and determines whether or not the pixel is inside the circle. All pixels
;whose distance to the center is less or equal to the radius are inside the circle; the others are
;outside


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
;(start 300 300) 
;(draw-a-circle red-circle)
;(check-expect (clear-a-circle red-circle) #t)
;(sleep-for-a-while 2)
;(stop)

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 6.6.6 Define the function draw-and-clear-circle, which draws a circle structure, waits
;for a short time, and clears it. To implement a waiting period, the teachpack draw.ss provides the
;function sleep-for-a-while. It consumes a number and puts the program to sleep for that many
;seconds; its result is true. For example, (sleep-for-a-while 1) waits for one second.

;(define (draw-and-clear-circle aCircle) #f)    ; stub

;(check-expect (draw-and-clear-circle red-circle) #t)


(define (draw-and-clear-circle aCircle)
  (and
   ;(start 300 300) 
   (draw-a-circle aCircle)
   (sleep-for-a-while 3)
   (clear-a-circle aCircle)
   (sleep-for-a-while 3)
   ;(stop)
   ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; move-circle : number circle → circle
;; to draw and clear a circle, translate it by delta pixels
(define (move-circle delta a-circle)
  (cond
    [(draw-and-clear-circle a-circle) (translate-circle a-circle delta)]
    [else a-circle]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 21.4.1 Abstract the functions draw-a-circle and clear-a-circle into a single function
;process-circle.

;;process-circle: X Y -> boolean ; Y is a symbol either 'draw or 'clear

;(define (process-circle aCircle action) #f)       ;stub
(start 300 300)
(check-expect (process-circle red-circle 'draw)  #t)
(sleep-for-a-while 20)


(check-expect (process-circle red-circle 'clear) #t)
(sleep-for-a-while 20)
(stop)

;; template to be used : atomic one of 'draw or 'clear
(define (process-circle aCircle action)
  (cond
    [(symbol=? action  'draw) (draw-a-circle aCircle)]
    [(symbol=? action 'clear) (clear-a-circle aCircle)]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Define translate-circle using process-circle