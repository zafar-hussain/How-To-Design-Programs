#lang racket
(require test-engine/racket-tests)


; Assume the ball rolls at a constant speed until it drops off the table. We can model the table with a canvas of some fixed width and height. The ball is a disk that moves across the canvas, which we express with drawing the disk, waiting, and clearing it, until it is out of bounds.


  (define-struct ball (x y delta-x delta-y))
;; A ball is a structure: 
;;   (make-ball number number number number)

;; draw-and-clear : a-ball  ->  true
;; draw, sleep, clear a disk from the canvas 
;; structural design, Scheme knowledge

;; move-ball : ball  ->  ball
;; to create a new ball, modeling a move by a-ball
;; structural design, physics knowledge

;; out-of-bounds? : a-ball  ->  boolean
;; to determine whether a-ball is outside of the bounds
;; domain knowledge, geometry

(test)

