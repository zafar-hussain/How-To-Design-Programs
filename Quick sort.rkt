#lang racket
(require test-engine/racket-tests)


;;; In the case of qsort, the intermediate goal is to divide the list of numbers into two lists: one that contains all the items that are strictly smaller than the first item, and another one with all those items that are strictly larger than the first item. Then the two smaller lists are sorted using the same procedure. Once the two lists are sorted, we simply juxtapose the pieces. Owing to its special role, the first item on the list is often called the pivot item.

;; qsort : lox -> lox
;; returns the given listOfX, sorted in ascending  order

;; algorithm 
;; divide the given list in three parts

;; - '(smaller than (first lox))
;; - (first  lox)
;; - '(larger than (first Lox))

;; -- recursively divide and form above three lists
;; -- till a trivial condition (empty) is reached
;; a list of single item is already sorted

(check-expect (qsort empty) empty)          ; base-case
(check-expect (qsort (list 1)) (list 1))    ; single itemed list is already sorted
(check-expect (qsort '(2 4 1)) '(1 2 4))

;(define (qsort lox) '())                   ; stub
(define (qsort lox) 
(
    cond
        [(empty? lox) empty]                ; terminating case
        [(empty? (rest lox)) lox]           ; singular list
        [else
        (
            append
            (smaller-than (first lox) (rest lox))
            (list (first lox))
            (larger-than (first lox) (rest lox))

        )]
))  


;; smaller-than : n lox -> lox
;; given n (threshold) and a list lox,  returns  a list of items smaller than  the given threshold
;; structural recursion is to be used
;; terminates when list is empty 
(check-expect (smaller-than 99 empty) empty)    ; terminating case
(check-expect (smaller-than 5 '(3 9 33 5 2 1)) '(3 2 1))

;(define (smaller-than n lox) empty)         ; stub
(define (smaller-than n lox)

(
    ;;; cond
    ;;;     [(empty? lox) empty]
    ;;;     [else
    ;;;     (
    ;;;         if
    ;;;         (< (first lox) n)
    ;;;         (cons (first lox) (smaller-than n (rest lox)))
    ;;;         (smaller-than n (rest lox)) 

    ;;;     )]
    abstract-filter < n lox
))




;; larger-than : n lox -> lox
;; given n (threshold) and a list lox,  returns  a list of items larger than  the given threshold
;; structural recursion is to be used
;; terminates when list is empty 
(check-expect (larger-than 99 empty) empty)    ; terminating case
(check-expect (larger-than 5 '(3 9 33 5 2 1)) '(9 33))

;(define (larger-than n lox) empty)         ; stub
(define (larger-than n lox)
(
    ;;; cond
    ;;;     [(empty? lox) empty]
    ;;;     [else
    ;;;     (
    ;;;         if
    ;;;         (> (first lox) n)
    ;;;         (cons (first lox) (larger-than n (rest lox)))
    ;;;         (larger-than n (rest lox)) 

    ;;;     )]
    abstract-filter > n lox
))

;; abstract-filter- for-smaller-larger-than : (x -> boolean) lox -> lox 
(check-expect (abstract-filter > 99 empty) empty)    ; terminating case
(check-expect (abstract-filter < 99 empty) empty)    ; terminating case

(check-expect (abstract-filter < 5 '(3 9 33 5 2 1)) '(3 2 1))
(check-expect (abstract-filter > 5 '(3 9 33 5 2 1)) '(9 33))

;(define (abstract-filter identity n lox) empty)         ; stub
(define (abstract-filter fn n lox)
(
    ;;; cond
    ;;;     [(empty? lox) empty]
    ;;;     [else
    ;;;     (
    ;;;         if
    ;;;         (fn (first lox) n)
    ;;;         (cons (first lox) (abstract-filter fn n (rest lox)))
    ;;;         (abstract-filter fn n (rest lox)) 

    ;;;     )]
    filter (lambda (x) (fn x n)) lox
))


(test)

