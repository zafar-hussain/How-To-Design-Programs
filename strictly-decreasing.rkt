;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname strictly-decreasing) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

;; strictly-decreasing-starter.rkt

; 
; PROBLEM:
; 
; Design a function that consumes a list of numbers and produces true if the 
; numbers in lon are strictly decreasing. You may assume that the list has at 
; least two elements.
; 
;; (X Y -> boolean) (listOf numbers -> boolean)

(check-expect (strictly-decreasing? `(5 4 3 2 1)) true)
(check-expect (strictly-decreasing? `(5 6 2 1)) false)
(check-expect (strictly-decreasing? `( 1 2 1)) false)
(check-expect (strictly-decreasing? (list 1 1))   false)
(check-expect (strictly-decreasing? (list 1 2))   false)
(check-expect (strictly-decreasing? (list 2 1))   true)
(check-expect (strictly-decreasing? (list 1 2 3)) false)
(check-expect (strictly-decreasing? (list 3 2 1)) true)