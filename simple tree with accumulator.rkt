;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |simple tree with accumulator|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct node [left right])
; A Tree is one of: 
; – '()
; – (make-node Tree Tree)
(define example
  (make-node (make-node '() (make-node '() '())) '()))


;; height : tree -> n
;; returns the height of the given tree

;(define (height aTree) 0)                        ; stub
(check-expect (height '()) 0)                    ; basecase
(check-expect (height (make-node '() '())) 1)
(check-expect (height (make-node '() (make-node '() '()))) 2)
(check-expect (height (make-node (make-node '() '()) '())) 2)

;; template used : structural recursion
#;
(define (height aTree)
  (cond
    [(empty? aTree) 0]
    [else
     (add1
      (max
       (height (node-left aTree))
       (height (node-right aTree))))]))

;; template used : tail recursion with accumulator

(define (height aTree)
  (local [
          (define (height aTree acc)
            (cond
              [(empty? aTree) acc]
              [else
               (max
                (height (node-left aTree)  (add1 acc))
                (height (node-right aTree) (add1 acc))
                )]))]
    (height aTree 0)))