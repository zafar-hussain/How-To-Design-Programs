;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname bst) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; bst is one of
;; - empty
;; - (make-node number node node)

(define-struct node (number lft rgt)) ; node structure

;template
#;
(define (fn-for-bst aBst)
  (cond
    [(empty? aBSt) ...]
    [else
     (...
      (node-number aBst)
      (fn-for-bst (node-lft aBst))
      (fn-for-bst (node-rgt aBst)))
     ]))

(define ten        (make-node 10 empty empty))
(define twentyFour (make-node 24 empty empty))
(define ninetyNine (make-node 99 empty empty))

(define fifteen      (make-node 15 ten   twentyFour))
(define seventySeven (make-node 77 empty empty))
(define ninetyFive   (make-node 95 empty ninetyNine))

(define twentyNine (make-node 29 fifteen empty))
(define eightyNine (make-node 89 seventySeven ninetyFive))

(define sixtyThree (make-node 63 twentyNine eightyNine))



;;develop contains-bt?.
;; The function consumes a number and a BT and determines whether the number occurs in the tree.
;; contains-bt? : number bst -> boolean
(check-expect (contains-bt? 99 empty)      false)
(check-expect (contains-bt? 99 ninetyFive) true)
(check-expect (contains-bt? 99 fifteen)    false)
(check-expect (contains-bt? 99 empty) false)


(define (contains-bt? N aBst)
  (cond
    [(empty? aBSt) false]
    [else
     (or
      (= (node-number aBst) N)
      (contains-bt? N (node-lft aBst))
      (contains-bt? N (node-rgt aBst)))
     ]))
