;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |abstrction by returning a function|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;Exercise 22.2.1 Define an abstraction of the functions convertCF and names from section 21.1
;using the new recipe for abstraction


;; convertCF : (X -> Y) LoX -> LoY
;; given a conversion function and list of numbers, it returns a listOfNumbers

;(define (convertCF C->F LOX) '())            ; stub
;(check-expect (convertCF identity '()) '())  ; basecase
;(check-expect (convertCF (lambda (x) (+ 2 x)) (list 1 2 3)) (list 3 4 5))

; template used : is one of empty or (cons x lox)
#;
(define (convertCF C->F LOX)
(cond
[(empty? LOX) '()]
[else
(cons
(C->F (first LOX))
(convertCF C->F (rest LOX)))]))

;; abstracting with local defination plus function return
;; convertCF : (X -> Y) -> (f: LoX -> LoY)
;; it returns a function that applies the given function to the given list

(define (convertCF  C->F)
  (local
    ((define (applyCF LOX)
       (cond
         [(empty? LOX) '()]
         [else
          (cons
           (C->F (first LOX))
           (applyCF (rest LOX)))])))

    applyCF))

(define f (convertCF (lambda (x) (+ 2 x))))
;(define (f C->F) '())                        ; stub
(check-expect (f '()) '())                    ; basecase
(check-expect (f (list 1 2 3)) (list 3 4 5))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Exercise 22.2.2.   Define an abstract version of sort
;; sort : list-of-numbers  ->  list-of-numbers
;; to construct a list with all items from alon in ascending order

;; sort: (X -> boolean)  LoX -> LoX
;; given a criteria function and a list, it returns the list sorted

;(define (my-sort f lox) '())          ; stub
(check-expect (my-sort '()) '())    ; basecase
(check-expect (my-sort '(3 5 1 9 6)) '(1 3 5 6 9))

(define my-sort
  (local (
          (define (insert X LoX)
            (cond
              [(empty? LoX)      (list X)]
              [(< X (first LoX)) (cons X LoX)]
              [else
               (cons (first LoX)
                     (insert X (rest LoX)))]
              )) 
          (define (a-sort lox)
   
            (cond
              [(empty? lox) '()]
              [else
               (insert (first lox) (a-sort (rest lox)))]
              )
            ))
    a-sort)
  )

;; insert : (f:X Y -> boolean) X LoX -> LoX
;; given X is insert in the given LoX, based on the order defined by function f
;; loX can be empty => return (list X)
;; X < (first LoX) : (cons x (rest LoX))
;; X > (first LoX) : (insert f X (rest LoX))

;(define (insert f X LoX) '())                       ; stub
;(check-expect (insert  1 '())            (list 1))
;(check-expect (insert  1 (list 2 3)) (list 1 2 3))
;(check-expect (insert  2 (list 1 3)) (list 1 2 3))
;
;
;(define (insert X LoX)
;  (cond
;    [(empty? LoX)      (list X)]
;    [(< X (first LoX)) (cons X LoX)]
;    [else
;     (cons (first LoX)
;           (insert X (rest LoX)))]
;    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 22.2.3 Define fold using the new recipe for abstraction. Recall that fold abstracts the
;following pair of functions:

;; fold : (f: X X -> X) B    LoX  -> X
;;        combine       Base Cons 
;; folds a list using a combine ( + , *) function and a basecase (0, 1)

;(define (fold combine base LOX) base)    ; stub
(check-expect (fold +  0 '())   0)
(check-expect (fold *  1 '())   1)
(check-expect (fold +  0 '(1 2 3))   6)
(check-expect (fold *  1 '(2 3 4))   24)

(define (fold combine base LOX)
  (cond
    [(empty? LOX) base]
    [else
     (combine
      (first LOX)
      (fold combine base (rest LOX)))]))

;; now abstract
;; sum : (listof number) → number
;; to compute the sum of alon

;(define (sum LOX) 0)    ; stub
(check-expect (sum '())      0)
(check-expect (sum '(1 2 3)) 6)

(define (sum LOX)
  (local
    ((define f (fold + 0 LOX)))
    f))


;; product: (listof number) → number
;; to compute the product of alon
(define (product LOX) 1)    ; stub
(check-expect (product '())      1)
(check-expect (product '(1 2 3)) 6)
