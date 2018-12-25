;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname bst) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; bst is one of
;; - empty
;; - (make-node number symbol node node)

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

;;##########################################################
;Develop the function create-bst. It consumes a BST B, a number N, and a
;symbol S. It produces a BST that is just like B and that in place of one false subtree contains the
;node structure

;(define (create-bst B N S) false) ; stub


(check-expect (create-bst false 66 'a) (make-node 66 'a false false))
(check-expect (create-bst (make-node 99 'z false false) 66 'a) (make-node 99 'z (make-node 66 'a false false) false))
(check-expect (create-bst (make-node 66 'a false false) 53 'b) (make-node 66 'a (make-node 53 'b false false) false))
(check-expect (create-bst (make-node 66 'a false false) 99 'z) (make-node 66 'a false (make-node 99 'z false false)))
(check-expect (create-bst (create-bst false 66 'a) 53 'b)      (make-node 66 'a (make-node 53 'b false false) false))

(define (create-bst aBst N S)
  (cond
    [(false? aBst) (make-node N S false false)]
    [(< N (node-number aBst)) (make-node (node-number aBst) (node-pn aBst) (make-node N S false false) false)]
    [(> N (node-number aBst)) (make-node (node-number aBst) (node-pn aBst) false (make-node N S false false))] 
    ))

;;##########################################################
;;Develop the function create-bst-from-list. It consumes a list of numbers and
;; names. it produces a BST by repeatedly applying create-bst.

;; function : create-bst-from-list : list -> bst

;(define (create-bst-from-list aList) false) ; stub
(check-expect (create-bst-from-list empty) false)
(check-expect (create-bst-from-list '((1 one)))                  (create-bst false 1  'one))
(check-expect (create-bst-from-list (list (list 1 'one)))        (create-bst false 1  'one))
(check-expect (create-bst-from-list '((63 sixtyThree)))          (create-bst false 63 'sixtyThree))

(check-expect (create-bst-from-list '((1 one) (63 sixtyThree)))
              ;(make-node 63 'sixtyThree (make-node 1 'one false false) false))
              (create-bst (create-bst false 63 'sixtyThree) 1 'one))

(check-expect (create-bst-from-list '((99 ninetyNine) (63 sixtyThree)))
              (make-node 63 'sixtyThree  false (make-node 99 'ninetyNine false false)))
(check-expect (create-bst-from-list '((99 ninetyNine) (1 one) (63 sixtyThree)))
              (make-node 63 'sixtyThree  (make-node 1 'one false false) (make-node 99 'ninetyNine false false)))
(check-expect (create-bst-from-list '((1 one) (99 ninetyNine)  (63 sixtyThree)))
              (make-node 63 'sixtyThree  (make-node 1 'one false false) (make-node 99 'ninetyNine false false)))

(define (create-bst-from-list aList)
  (cond
    [(empty? aList) false]
    [(empty? (rest aList)) (create-bst false (first (first aList)) (first (rest (first aList))))]
    [else
     (create-bst (create-bst-from-list (first (rest (aList)))) (first (first aList)))
     ]
    ))