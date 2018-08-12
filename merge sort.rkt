#lang racket
(require test-engine/racket-tests)


;;; Exercise 26.1.2.   Develop the function merge-sort, which sorts a list of numbers in ascending order, using the following two auxiliary functions:

;;; The first one, make-singles, constructs a list of one-item lists from the given list of numbers. For example,

;;; (equal? (make-singles (list 2 5 9 3))
;;;         (list (list 2) (list 5) (list 9) (list 3)))

;;; The second one, merge-all-neighbors, merges pairs of neighboring lists. More specifically, it consumes a list of lists (of numbers) and merges neighbors. For example,

;;; (equal? (merge-all-neighbors (list (list 2) (list 5) (list 9) (list 3)))
;;;         (list (list 2 5) (list 3 9)))

;;; (equal? (merge-all-neighbors (list (list 2 5) (list 3 9)))
;;;         (list (list 2 3 5 9)))
;;; In general, this function yields a list that is approximately half as long as the input. Why is the output not always half as long as the input?

;;; Make sure to develop the functions independently.

;;; The function merge-sort first uses make-singles to create a list of single lists; then it relies on merge-all-neighbors to shorten the list of lists until it contains a single list. The latter is the result.


;; merge-sort : lox -> lox
;; given a list, returns it ascendingly sorted
;; a singular list is already sorted
;; terminates when list is empty

(check-expect (merge-sort empty) empty)                             ; basecase
(check-expect (merge-sort (list 88)) (list 88))                     ; singular list
(check-expect (merge-sort (list 2 4 1 3)) (list 1 2 3 4))

;;(define (merge-sort lox) empty)             ; stub

(define (merge-sort lox)
(
    cond
        [(empty? lox) ...]                                          ; basecase
        [(empty? (rest lox) ...)]                                   ; singular list
        [else (merge-all-neighbors (make-singles lox))]
))

;; make-singles : lox -> lox
;; all the items in the list are broken into singular lists and returned as list of lists, by make-singles
;;
(check-expect (make-singles (list 2 5 9 3)) (list (list 2) (list 5) (list 9) (list 3)))
(define (make-singles lox) empty) ; stub


;; merge-all-neighbors : lox -> lox
;; mergers the neighbouring singular list, 
;; merges pairs of neighboring lists ; 

(test)

