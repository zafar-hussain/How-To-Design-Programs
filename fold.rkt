;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname fold) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;Exercise 21.1.2 Define fold, which is the abstraction of the following two functions:
;; sum : (listof number) → number 
;; to compute the sum of the numbers on alon

;(define (sum lon) 0)         ; stub
(check-expect (sum '()) 0)   ; basecase
(check-expect (sum (list 1 2 3)) 6)

(define (sum lon)
  ;  (cond
  ;    [(empty? lon) 0]
  ;    [else
  ;     (+
  ;      (first lon)
  ;      (sum (rest lon)))]))
  (local
    ((define f +))
    (fold f 0 lon)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; product: (listof number) → number
;; to compute the product of the numbers on alon
;(define (sum lon) 0)         ; stub
(check-expect (product '()) 1)   ; basecase
(check-expect (product (list 1 2 3)) 6)

(define (product lon)
  ;  (cond
  ;    [(empty? lon) 1]
  ;    [else
  ;     (*
  ;      (first lon)
  ;      (product (rest lon)))]))
  (local
    ((define f *))
    (fold f 1 lon)))
  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fold :abstract function for sum, and peoduct
;; fold: (f: X -> Y) BC LOX -> Y

(define (fold f BC lon)
  (cond
    [(empty? lon) BC]
    [else
     (f
      (first lon)
      (fold f BC (rest lon)))]))
