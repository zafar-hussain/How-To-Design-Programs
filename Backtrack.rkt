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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 28.1.2 Develop the function neighbors. It consumes a node n and a graph g (see
;exercise 28.1.1) and produces the list of neighbors of n in g.

;; neighbors: node graph -> [listOf nodes]
;; returns a list Of neighbors of node n in graph g

;(define (neighbors n g) '())           ; stub
(check-expect (neighbors 'D Graph) '())   ; basecase
(check-expect (neighbors 'A Graph) (list 'B 'E))
(check-expect (neighbors 'E Graph) (list 'C 'F))

;; template to use : atomic + self recursive 
(define (neighbors n g)
  (cond
    [(empty? g) (second (first g))]
    [else
     (if (symbol=? (first (first g)) n)
         (second (first g))
         (neighbors n (rest g)))]))

;; find-route: node node graph -> [listOf nodes] or #f
;; returns a list of nodes detailing a path from the given origin node to the destination node
;; - or false if no path is found

(define (find-route start end g) #f)      ; stub
(check-expect (find-route 'A 'B '()) #f)  ; terminating condition
(check-expect (find-route 'A 'B Graph) '(A B)) 
(check-expect (find-route 'A 'F Graph) '(A B F))
(check-expect (find-route 'C 'G Graph) #f) 