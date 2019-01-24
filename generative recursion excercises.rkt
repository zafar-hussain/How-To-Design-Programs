;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |generative recursion excercises|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;exercise 26.1.1 Define the function tabulate-div, which accepts a number n and tabulates the list
;of all of its divisors, starting with 1 and ending in n. A number d is a divisior of a number n if the
;remainder of dividing n by d is 0, that is, (= (remainder n d) 0) is true. The smallest divisior of
;any number is 1; the largest one is the number itself.

;; tabulate-div: X -> listOf X
;; given a number X, it returns the divisors for which (zero? (remainder X a-divisor))

;; this can be solved via iteration from X till 1

;(define (tabulate-div X) '(1))        ; stub
(check-expect (tabulate-div 1) '(1))  ; terminating condition
(check-expect (tabulate-div 10) '(10 5 2 1))

;; generative  recursion

(define (tabulate-div X)
  (local
    ((define (aux X C)
       (cond
         [(= C 1) '(1)]
         [else
          (if
           (zero? (remainder X C))
           (cons C (aux X (sub1 C)))
           (aux X (sub1 C)))]
         )))
    (aux X X)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

