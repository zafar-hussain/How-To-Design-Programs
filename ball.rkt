;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ball) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require htdp/draw)

;Modeling a Ball on a Table..
;
;1. A ball is a structure with four fields: the current position and the velocity in each direction.
;That is, the first two numbers in a ball structure are the current position on the canvas,
;andthe next two numbers describe how far the ball moves in the two directions per step.

;; ball -> define-struct (x      y      delta-x delta-y)
;;                        number number number  number

(define-struct ball (x y delta-x delta-y))



;2. The function move-ball models the physical movement of the ball. It consumes a ball and
;creates a new one, modeling one step.

;; move-ball : ball -> ball

(define (move-ball aBall)
  (make-ball (+ (ball-x aBall) (ball-delta-x aBall))
             (+ (ball-y aBall) (ball-delta-y aBall))
             (ball-delta-x aBall)
             (ball-delta-y aBall)))
             
;3. The function draw-and-clear draws the ball at its current position, then waits for a short
;time, and clears it again.

;; draw-and-clear -> boolean

(define (draw-and-clear aBall)
  (local ((define ball-posn (make-posn (ball-x aBall) (ball-y aBall))))
    (and
     (draw-solid-disk ball-posn 10 'red)
     (sleep-for-a-while 0.5)
     (clear-solid-disk ball-posn 10 'red)
     )))

;4. out-of-bounds?, a function that determines whether a given ball is
;still visible on the canvas:

(define WIDTH  300)
(define HEIGHT 300)

  
;;out-of-bounds? : a-ball → boolean
;; to determine whether a-ball is outside of the bounds
;; domain knowledge, geometry
(define (out-of-bounds? aBall)
  (not
   (and
    (<= 0 (ball-x aBall) WIDTH)
    (<= 0 (ball-y aBall) HEIGHT))))

;; move-until-out: a-ball → true
;; to model the movement of a ball until it goes out of bounds
(define (move-until-out aBall)
  (cond
    [(out-of-bounds? aBall) true]
    [else
     (and
      (draw-and-clear aBall)
      (move-until-out (move-ball aBall)))]))

;Exercise 25.1.2 Develop move-balls. The function consumes a list of balls and moves each one
;until all of them have moved out of bounds.
;Hint: It is best to write this function using filter, andmap, and similar abstract functions from

;(define (move-balls LOB) #t)        ; stub
(check-expect (move-balls '()) #t)  ; basecase


(define (move-balls LOB)
  (cond
    [(empty? LOB) #t]
    [else
     (and
      (move-until-out (first LOB))
      (move-balls (rest LOB)))]))

(start WIDTH HEIGHT)
(move-balls (list (make-ball 270 270 2 0) (make-ball 270 200 2 0)))
(stop)

