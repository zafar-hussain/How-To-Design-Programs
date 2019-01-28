;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Backtrack) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define Graph
  '((A (B E))
    (B (E F))
    (C (D))
    (D ())
    (E (C F))
    (F (D G))
    (G ())))

;Exercise 28.1.1 Translate the above definition into proper list form using list and proper
;symbols
#;
(equal? Graph (list
               (list 'A (list 'B 'E))
               (list 'B (list 'E 'F))
               (list 'C (list 'D))
               (list 'D '())
               (list 'E (list 'C 'F))
               (list 'F (list 'D 'G))
               (list 'G '())))

;; find-route: node node graph -> [listOf nodes]
;; returns a list of nodes detailing a path from the given origin node to the destination node

(define (find-route start end g) '())      ; stub
(check-expect (find-route 'A 'B '()) '())  ; terminating condition
(check-expect (find-route 'A 'B Graph) '(B)) 
(check-expect (find-route 'A 'F Graph) '(B F))
(check-expect (find-route 'C 'G Graph) '()) 