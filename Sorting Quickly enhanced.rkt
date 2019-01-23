;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Sorting Quickly enhanced|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; quick-sort

;; quick-sort : listOf X -> listOf X
;; returns the given list in a ascending order

;(define (quick-sort LOX) '())      ; stub
(check-expect (quick-sort '()) '()) ; basecase
(check-expect (quick-sort '(3 11 4 1 2 9)) '(1 2 3 4 9 11))

;; takes the first item of the given list as pivot, bifurcates the rest of the list into
;; - items that are smaller than pivot and items that are greater than pivot
;; - applies quick sort of the two lists again (genertative reqursion)
;; appens them

(define (quick-sort LOX)
  (cond
    [(empty? LOX) '()]
    [(empty? (rest LOX)) (list (first LOX))]
    [else
     (append
      (quick-sort (smaller-than (first LOX) (rest LOX)))
      (list (first LOX))
      (quick-sort (larger-than  (first LOX) (rest LOX))))]))

;; smaller-than : X LOX -> LOX
;; returns of all the items that are less than the given X

;(define (smaller-than X LOX) '())       ; stub
(check-expect (smaller-than 3 '()) '()) ; basecase
(check-expect (smaller-than 3 '(11 4 1 2 9)) '(1 2))

(define (smaller-than X LOX)
  ;  (cond
  ;    [(empty? LOX) '()]
  ;    [else
  ;     (if
  ;      (< (first LOX) X)
  ;      (cons (first LOX) (smaller-than X (rest LOX)))
  ;      (smaller-than X (rest LOX)))]))
  (filter (lambda (b) (> X b)) LOX ))

;; larger-than : X LOX -> LOX
;; rerturns a list of items larger than the given X

;(define (larger-than X LOX) '())       ; stub
(check-expect (larger-than 3 '()) '()) ; basecase
(check-expect (larger-than 3 '(11 4 1 2 9)) '(11 4 9))

(define (larger-than X LOX)
  (filter (lambda (b) (< X b)) LOX ))

;;(time  (quick-sort (build-list 10 (lambda (x) (random (* (add1 x) 99))))))

