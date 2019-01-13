;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Designing Abstractions from Examples|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; n-adder : N number → number
;; to add N to x using add1

;(define (n-adder N X) 0)         ; stub
(check-expect (n-adder 0 99) 99) ; basecase
(check-expect (n-adder 3 5) (add1 (add1 (add1 5))))

;;template to be used : is one of atomic, self recursive

(define (n-adder N X)
  ;  (cond
  ;    [(zero? N) X]
  ;    [else
  ;     (add1 (n-adder (sub1 N) X))]))
  (local
    ((define f add1))
    (natural-f f N X X))) 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; copy: N X → (listof X) 
;; to create a list that contains X, N times

;(define (copy N X) '())        ; stub
(check-expect (copy 0 'Z) '())  ; basecase
(check-expect (copy 3 'Z) (list 'Z 'Z 'Z))

;;template to be used : is one of atomic, self recursive

(define (copy N X)
  ;    (cond
  ;      [(zero? N) '()]
  ;      [else
  ;       (cons
  ;         X
  ;        (copy (sub1 N) X))]))
  (local
    ((define (f Z) (cons X Z)))
    (natural-f f N X '())
    ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Exercise 21.1.3 Define natural-f, which is the abstraction of the above two functions, by example:

;;  natural-f  : (X  ->  Y)  N X P -> Y ; P is '() for copy and X for n-adder basecase

(define (natural-f f N X P)
  (cond
    [(zero? N) P]
    [else
     (f (natural-f f (sub1 N) X P))]))