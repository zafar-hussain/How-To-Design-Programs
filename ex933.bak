#lang racket
(require test-engine/racket-tests)

;;; Exercise 9.3.3 Develop the function contains?, which consumes a symbol and a list of symbols
;;; and determines whether or not the symbol occurs in the list

;; contains? symbol los -> boolean
;; returns true if the given symbol sxists in the list oof symbols
(check-expect (contains? 'aSymbol  empty)                    false) ; basecase
(check-expect (contains? 'aSymbol  (cons 'aSymbol empty ))   true)
(check-expect (contains? 'aSymbol  (list 'a 'aSymbol 'b))    true)
(check-expect (contains? 'aSymbol  (list 'a 'b 'c))          false)

;(define (contains? s los) false) ; stub
(define (contains? s los) 
(cond
[(empty? los) false]
[else
    (if
    (symbol=? (first los) s)
    true
    (contains? s (rest los)))
]

))

(test)

