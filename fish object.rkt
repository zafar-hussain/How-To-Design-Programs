#lang racket

(define aFish% (class object%
  (init size)                ; initialization argument
 
  (define current-size size) ; field
 
  (super-new)                ; superclass initialization
 
  (define/public (get-size)
    current-size)
 
  (define/public (grow amt)
    (set! current-size (+ amt current-size)))
 
  (define/public (eat other-fish)
    (grow (send other-fish get-size))))
)

(define molly (new aFish% [size 10]))
