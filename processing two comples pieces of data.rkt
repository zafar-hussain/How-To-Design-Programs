;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |processing two comples pieces of data|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; function name : replace-eol-with : list1 list2 -> list
;; apppends list2 to list1 by replacing list1's empty

;(define (replace-eol-with list1 list2) list2)     ; stub
(check-expect (replace-eol-with '() '(a b c)) '(a b c)) ; basecase
(check-expect (replace-eol-with '(a b c) '(d e f)) '(a b c d e f))

;; list1 is one of
;; - empty
;; - (cons (rest list1) empty)

;; template to be used : self recursive
(define (replace-eol-with list1 list2)
  (cond
    [(empty? list1) list2]
    [else
     (cons
      (first list1)
      (replace-eol-with (rest list1) list2))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 17.1.1 In several exercises, we have used the Scheme operation append, which
;consumes three lists and juxtaposes their items:
;(append (list 'a) (list 'b 'c) (list 'd 'e 'f));; expected value: (list 'a 'b 'c 'd 'e 'f)
;Use replace-eol-with to define our-append, which acts just like Scheme's append.
;
; function name : our-append : list1 list2 ... -> list
; appends the given lists and returns a list
;
;(define (our-append list1 list2 list3) empty) ; stub
(check-expect (our-append (list 'a) (list 'b 'c) (list 'd 'e 'f)) (list 'a 'b 'c 'd 'e 'f))

(define (our-append list1 list2 list3) (replace-eol-with list1 (replace-eol-with list2 list3)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auxilary function : (process-list2 x list2) -> list

;(define (process-list2 x list2) '())   ; stub
(check-expect (process-list2 'a '()) '())
(check-expect (process-list2 'a '(1 2)) (list (list 'a 1) (list 'a 2)))

;; given x is paired with each member of the given list2
;; template to be used : self recursive due to list2

(define (process-list2 x list2)
  (cond
    [(empty? list2) '()]
    [else
     (cons
      (list x (first list2))
      (process-list2 x (rest list2)))]))


;Exercise 17.1.2 Develop cross. The function consumes a list of symbols and a list of numbers
;and produces all possible pairs of symbols and numbers. Example:
;(cross '(a b c) '(1 2))
;;; expected value:
;(list (list 'a 1) (list 'a 2) (list 'b 1) (list 'b 2) (list 'c 1) (list 'c 2))

;; function name : cross : list1 list2 -> list
;; returs a cross product of list1 and list2
;; each member of list1 is paired with a member of list2

; (define (cross list1 list2) '())     ; stub
(check-expect (cross '() '(1 2)) '()) ; basecase
(check-expect (cross '(a b c) '(1 2)) (list (list 'a 1) (list 'a 2) (list 'b 1) (list 'b 2) (list 'c 1) (list 'c 2)))

(define (cross list1 list2)
  (cond
    [(empty? list1) '()]
    [else
     (append
      (process-list2 (first list1) list2)
      (cross (rest list1)  list2)) 
     ]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 17.6.1 Develop the function merge. It consumes two lists of numbers, sorted in
;ascending order. It produces a single sorted1ist of numbers that contains all the numbers on both
;inputs lists (and nothing else). A number occurs in the output as many times as it occurs on the
;two input lists together.
;Examples:
;(merge(list 1 3 5 7 9) (list 0 2 4 6 8))
;;; expected value:
;(list 0 1 2 3 4 5 6 7 8 9)
;(merge (list 1 8 8 11 12) (list 2 3 4 8 13 14))
;;; expected value:
;(list 1 2 3 4 8 8 8 11 12 13 14);

;; function name : merge : list list -> list
;; returns a merged list of two given lists

;(define (merge list1 list2) '())    ; stub
(check-expect (merge '() (list 0 2 4))  (list 0 2 4))     ; basecase - list1 is empty
(check-expect (merge (list 1 3 5) '() ) (list 1 3 5))     ; basecase - list2 is empty
(check-expect (merge (list 1 3) (list 2 4))  (list 1 2 3 4))
(check-expect (merge (list 1 3 5 7 9)    (list 0 2 4 6 8))      (list 0 1 2 3 4 5 6 7 8 9))
(check-expect (merge (list 1 8 8 11 12) (list 2 3 4 8 13 14))  (list 1 2 3 4 8 8 8 11 12 13 14)) ;- list1 longer
(check-expect (merge (list 1 8 8 11 12 13) (list 2 3 4 8 14))  (list 1 2 3 4 8 8 8 11 12 13 14)) ;- list2 longer

;; template to use : self recursion, both lists simultenously parsed

(define (merge list1 list2)
  (cond
    [(empty? list1) list2]
    [(empty? list2) list1]
    [(< (first list1) (first list2)) (append (list (first list1)) (merge (rest list1) list2))]
    [else
     (append (list (first list2)) (merge list1 (rest list2)))]
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
