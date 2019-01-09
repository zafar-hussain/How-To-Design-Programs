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

(define (process-list2 x list2) '())   ; stub
(check-expect (process-list2 'a '(1 2)) (list (list 'a 1) (list 'a 2)))



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
     (cons
      (process-list2 (first list1) list2)
      (cross (rest list1)  list2)) 
      ]))