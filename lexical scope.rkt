;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |lexical scope|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;(define (mult10 alod)
;  (cond[(empty? alod)0]
;       [else
;        (cons
;         (* (expt 10 (length (rest alod))) (first alod))
;         (mult10 (rest alod)))]
;       ))
;
;(define (mult10 alon)
;  (cond
;    [(empty? alon) empty]
;    [else (local ((define a-digit (first alon))
;                  (define p (length (rest alon))))
;            ;;
;            (cons (* (expt 10 p) a-digit) (mult10 (rest alon))))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 18.1.15 Consider the following function definition:

;;; extract1 : inventory → inventory
;;; to create an inventory from an-inv for all
;;; those items that cost less than $1

;(define (extract1 an-inv)
;  (cond
;    [(empty? an-inv) empty]
;    [else (cond
;            [(<=  (first an-inv) 1.00)
;             (cons (first an-inv) (extract1 (rest an-inv)))]
;            [else (extract1 (rest an-inv))])]))



;Both clauses in the nested cond-expression extract the first item from an-inv and both compute
;(extract1 (rest an-inv)).
;Introduce a local-expression for these expressions.

(define (extract1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (local 
            ((define first-element  (first an-inv))
            (define rest-recursion (extract1 (rest an-inv))))

            (cond
              [(<=  first-element 1.00) (cons first-element rest-recursion)]
              [else rest-recursion])
            )
          ]))

(extract1 (list 1 3 5 -1 2 44 -6 ))