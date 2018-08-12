#lang racket
(require test-engine/racket-tests)


; Assume the ball rolls at a constant speed until it drops off the table. We can model the table with a canvas of some fixed width and height. The ball is a disk that moves across the canvas, which we express with drawing the disk, waiting, and clearing it, until it is out of bounds.
(require 2htdp/image)
(require 2htdp/universe)

;; My world program  (make this more specific)

;; =================
;; Constants:
(define WIDTH )


;; =================
;; Data definitions:

;; WS is ... (give WS a better name)



;; =================
;; Functions:

;; WS -> WS
;; start the world with ...
;; 
(define (main ws)
  (big-bang ws                   ; WS
            (on-tick   tock)     ; WS -> WS
            (to-draw   render)   ; WS -> Image
            (stop-when ...)      ; WS -> Boolean
            (on-mouse  ...)      ; WS Integer Integer MouseEvent -> WS
            (on-key    ...)))    ; WS KeyEvent -> WS

;; WS -> WS
;; produce the next ...
;; !!!
(define (tock ws) ...)


;; WS -> Image
;; render ... 
;; !!!
(define (render ws) ...)

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

