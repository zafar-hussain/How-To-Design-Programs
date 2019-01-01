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

(check-expect (create-bst false 6 'b)  (make-node 6 'b false false))
(check-expect (create-bst (make-node 4 'a false false) 5 'a)
              (make-node 4 'a false (make-node 5 'a false false)))
(check-expect (create-bst (make-node 4 'a false false) 3 'g)
              (make-node 4 'a (make-node 3 'g false false) false))

(check-expect (create-bst (make-node 4 'a (make-node 2 'a false false) false) 3 'g)
              (make-node 4 'a (make-node 2 'a false (make-node 3 'g false false)) false))


(check-expect (create-bst (make-node 4 'a (make-node 2 'a false false) false) 5 'g)
              (make-node 4 'a (make-node 2 'a false false) (make-node 5 'g false false)))

(check-expect (create-bst (make-node 4 'a false (make-node 6 'a false false) ) 2 'g)
              (make-node 4 'a (make-node 2 'g false false) (make-node 6 'a false false)))

(define (create-bst aBst N S)
  (cond
    [(false? aBst) (make-node N S false false)]
    [(< N (node-number aBst)) (make-node (node-number aBst) (node-pn aBst) (create-bst (node-lft aBst) N S) (node-rgt aBst))]
    [(> N (node-number aBst)) (make-node (node-number aBst) (node-pn aBst) (node-lft aBst) (create-bst (node-rgt aBst) N S))] 
    ))



;;##########################################################
;;Develop the function create-bst-from-list. It consumes a list of numbers and
;; names. it produces a BST by repeatedly applying create-bst.

;; function : create-bst-from-list : list -> bst

;(define (create-bst-from-list aList) false) ; stub
(check-expect (create-bst-from-list empty) false)
(check-expect (create-bst-from-list '((1 a) (2 g)))
              (make-node 2 'g
                         (make-node 1 'a false false)
                         false)
              )
(check-expect (create-bst-from-list '((18 b) (2 g)))
              (make-node 2 'g
                         false
                         (make-node 18 'b false false))
              )
(check-expect (create-bst-from-list '((1 a) (18 b) (2 g)))
              (make-node 2 'g
                         (make-node 1 'a false false)
                         (make-node 18 'b false false))
              )

(define (create-bst-from-list lons)
  (cond
    [(empty? lons) false]
    [else
     (create-bst 
      (create-bst-from-list (rest lons))
      (first (first lons))
      (second (first lons)))]))

;10.4-2 - cormen
;Write an O.n/-time recursive procedure that, given an n-node binary tree, prints
;out the key of each node in the tree

;; get-keys : BT -> X (keys)
;; given a Binary tree, this function prints the keys - returns a list of keys

;(define (get-keys aBst) empty)        ; stub
(check-expect (get-keys empty) empty) ; basecase

(check-expect (get-keys (create-bst-from-list '((99 a) (66 b)))) '((99 a) (66 b)))
(check-expect (get-keys (create-bst-from-list '((66 a) (53 b)))) '((66 a) (53 b)))

(define (get-keys aBst)
  (cond
    [(false? aBst) empty]
    [else
     (cons '((node-number aBst) (node-pn aBst))
           ( and
             (get-keys (node-lft aBst))
             (get-keys (node-rgt aBst))))
     ]))
