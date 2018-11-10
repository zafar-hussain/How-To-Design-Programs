;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname tree) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; aribinary tree is built of nodes
;;         root
;;        /    \
;;Left-child  right-child
;; node is a structure
;; make-node [data left-child right-child]
(define-struct node [data left-child right-child])

;; binary tree is finite
;; it is either empty or with nodes
;; each node, except of the root has a parent
;; root has no parent
;; each node has either 0, 1 or 2 child nodes
;; child nodes are called left-child or right-child
;; node without any chid is called a leaf.
;; examples
(define node0 (make-node '0 empty empty)) ;; no children
