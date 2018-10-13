#lang racket
(require test-engine/racket-tests)

;;;   Exercise 6.3.3 Provide a structure definition that represents an airforce’s jet fighters. Assume that a fighter has four essential properties: designation (′f22, ′tornado, or ′mig22), acceleration, top-speed, and range.

;; jet : (make-jet symbol number number number)
;; jet ->   desingnation acceleration top-speed range
(define-struct jet [desingnation acceleration top-speed range])

;; template
#;
(define (fn-for-jet aJet dist)
(
    ... (jet-desingnation aJet) ... 
    ... (jet-acceleration aJet) ...
    ... (jet-top-speed aJet) ... 
    ... (jet-range aJet) ...
))

;; Examples
(define f22 (make-jet 'f22 1 2 3))
(define tornado (make-jet 'tornado 4 5 6))
(define mig22 (make-jet 'mig22 7 8 9))

;;; Then develop the function within-range. The function consumes a fighter  record and the  distance of a target from the (fighter’s) base. It determines whether the fighter can
;;; reach the intended target. 

;; within-range?: jet target-from-base -> fighter-can-reach-target?
;; within-range?: 'symbol number -> boolean
;; returns true if the target-from-base is less than jet-range, else false
;; Examples
(check-expect (within-range? f22 4) false)
(check-expect (within-range? tornado 4) true)

;; (define (within-range? aJet target-from-base) false) ; stub

(define (within-range? aJet dist)
(
    cond
    [(>= (jet-range aJet) dist) true]
    [else false]    
))








;;; Also develop the function reduce-range. The function consumes a fighter record and produces one in which the range field is reduced to 80% of the original value.


(test)

