;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname bst) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; bst is one of
;; - empty
;; - (make-node number node node)

(define-struct node (number pn lft rgt)) ; node structure

;template
#;
(define (fn-for-bst aBst)
  (cond
    [(empty? aBst) ...]
    [else
     (...
      (node-number aBst)
      (node-pn aBst)
      (fn-for-bst (node-lft aBst))
      (fn-for-bst (node-rgt aBst)))
     ]))

(define ten        (make-node 10 'A empty empty))
(define twentyFour (make-node 24 'B empty empty))
(define ninetyNine (make-node 99 'C empty empty))

(define fifteen      (make-node 15 'D ten   twentyFour))
(define seventySeven (make-node 77 'E empty empty))
(define ninetyFive   (make-node 95 'F empty ninetyNine))

(define twentyNine (make-node 29 'G fifteen empty))
(define eightyNine (make-node 89 'H seventySeven ninetyFive))

(define sixtyThree (make-node 63 'I twentyNine eightyNine))



;;develop contains-bt?.
;; The function consumes a number and a BT and determines whether the number occurs in the tree.
;; contains-bt? : number bst -> boolean
(check-expect (contains-bt? 99 empty)      false)
(check-expect (contains-bt? 99 ninetyFive) true)
(check-expect (contains-bt? 99 fifteen)    false)
(check-expect (contains-bt? 99 sixtyThree) true)


(define (contains-bt? N aBst)
  (cond
    [(empty? aBst) false]
    [else
     (or
      (= (node-number aBst) N)
      (contains-bt? N (node-lft aBst))
      (contains-bt? N (node-rgt aBst)))
     ]))

;; ######################################################
;;Develop search-bt. The function consumes a number n and a BT. If the tree
;contains a node structure whose soc field is ft, the function produces the value of the pn field in
;that node. Otherwise, the function produces false.

(check-expect (search-bt 99 empty)      false)
(check-expect (search-bt 99 ninetyFive) 'C)
(check-expect (search-bt 99 fifteen)    false)
(check-expect (search-bt 99 sixtyThree) 'C)

;; (define (search-bt N aBst) false) ;stub
(define (search-bt N aBst)
  (cond
    [(empty? aBst) false]
    [(= (node-number aBst) N) (node-pn aBst)]
    [(boolean? (search-bt N (node-lft  aBst))) (search-bt N (node-rgt  aBst))]
    [else (search-bt N (node-lft  aBst))]))