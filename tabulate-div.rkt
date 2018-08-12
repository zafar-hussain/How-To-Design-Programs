#lang racket
(require test-engine/racket-tests)


;;; Exercise 26.1.1.   Define the function tabulate-div, which accepts a number n and tabulates the list of all of its divisors, starting with 1 and ending in n. A number d is a divisior of a number n if the remainder of dividing n by d is 0, that is, (= (remainder n d) 0) is true. The smallest divisior of any number is 1; the largest one is the number itself. 

;; tabulate-div : n -> [listOf N]
;; returns a list of divisors of n, that are between 1 to n
;; we need to use a content perserving accumulator i initialy equal to 1, but increased by at each step and used as terminatoin case
;; modulo or remainder of n and (i + 1) is zero, that (i + 1) is a divisor
;; local procedure need to be used
;; terminates when i is greater then n, return empty
;; zero has no devisors, return empty if n = 0

(check-expect (tabulate-div 0) empty)   ; basecase
(check-expect (tabulate-div 3) (list 1 3))
(check-expect (tabulate-div 9) (list 1 3 9))
(check-expect (tabulate-div 16) (list 1 2 4 8 16))

;(define (tabulate-div n) empty)         ; stub

(define (tabulate-div n0)
(local [
(define (tabulate-div n i)
(
    cond
        [(= n 0) empty]
        [(> i n) empty]
        [else
        (
            if
            (= (modulo n i) 0)
            (cons i (tabulate-div n (add1 i)))
            (tabulate-div n (add1 i))
            
        )]
))]

(tabulate-div n0 1)))



(test)

