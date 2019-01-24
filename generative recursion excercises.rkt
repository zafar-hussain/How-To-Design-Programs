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
;
;Exercise 26.1.2 Develop the function merge-sort, which sorts a list of numbers in ascending
;order, using the following two auxiliary functions:


;1. The first one, make-singles, constructs a list of one-item lists from the given list of numbers.
;For example,
;(equal? (make-singles (list 2 5 9 3))
;(list (list 2) (list 5) (list 9) (list 3)))

;; make-singles : listOf X -> listOf ( listOf X)
;; bifurcates the given list into a list of list of indiviusal list members

;(define (make-singles a-List) '())      ; stub
(check-expect (make-singles '()) '())   ; terminating condition
(check-expect (make-singles (list 2 5 9 3)) (list (list 2) (list 5) (list 9) (list 3)))

(define (make-singles a-List)
  (cond
    [(empty? a-List) '()]
    [else
     (append
      (list (list (first a-List)))
      (make-singles (rest a-List)))])) 



;2. The second one, merge-all-neighbors, merges pairs of neighboring lists. More specifically,
;it consumes a list of lists (of numbers) and merges neighbors. For example,
;(equal? (merge-all-neighbors (list (list 2) (list 5) (list 9) (list 3)))
;(list (list 2 5) (list 3 9)))
;(equal? (merge-all-neighbors (list (list 2 5) (list 3 9)))
;(list (list 2 3 5 9)))

;; merge-all-neighbors: (listOf listOf X) -> listOf X
;; merges the neighbors of the listOf lists, such that the first member of the lists are in ascending order

;(define (merge-all-neighbors LOL) '())        ; stub
(check-expect (merge-all-neighbors '()) '())  ; terminating condition
(check-expect (merge-all-neighbors (list (list 2) (list 5) (list 9) (list 3))) (list (list 2 5) (list 3 9)))
(check-expect (merge-all-neighbors (list (list 2 4) (list 5 9))) (list (list 2 4 5 9)))



(define (merge-all-neighbors LOL)
  (cond
    [(empty? LOL) '()]
    [(empty? (rest LOL)) LOL]
    [else
     (if
      (< (first (first LOL)) (first (first (rest LOL))))
      (cons (first (first LOL)) (cons (first (first (rest LOL))) (merge-all-neighbors (rest LOL))))
      (cons (first (first (rest LOL))) (cons (first (first LOL))  (merge-all-neighbors (rest LOL)))))
     ]))