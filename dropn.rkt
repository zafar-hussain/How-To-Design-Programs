;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname dropn) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;PROBLEM:
;
;Design a function that consumes a list of elements lox and a natural number
;n and produces the list formed by dropping every nth element from lox.
;
;(dropn (list 1 2 3 4 5 6 7) 2) should produce (list 1 2 4 5 7)


;; dropn : lox n -> lox
;; drops the nthe element of the given list
;; we can use an accumulator, which gets increased by one, and on every multiple of n appends the element in the list
;(define (dropn lox n)                                     '())      ; stub
(check-expect (dropn '() 9)                               '())      ; terminating condition
(check-expect (dropn (list 1 2 3 4 5 6 7) 2) (list 1 2 4 5 7))

;; (dropn '(1 2 3 4 5 6 7) 2) = '(1 2 3 4 5 6 7)
;; (dropn '(2 3 4 5 6 7)   1) = '(1)   , decrement n
;; (dropn '(3 4 5 6 7)     0) = '(1 2) , drop and reset n

(define (dropn lox n)
  (local [(define (dropn lox acc)
            (cond
              [(empty? lox) '()]
              [(zero? acc) (dropn (rest lox) n)]
              [else
               (cons
                (first lox)
                (dropn (rest lox) (sub1 acc)))]))]
    (dropn lox n)))

  