#lang racket
(require test-engine/racket-tests)

(require 2htdp/image)

;; fs-starter.rkt (type comments and examples)

;; Data definitions:

(define-struct elt (name data subs))
;; Element is (make-elt String Integer ListOfElement)
;; interp. An element in the file system, with name, and EITHER data or subs.
;;         If data is 0, then subs is considered to be list of sub elements.
;;         If data is not 0, then subs is ignored.
#;
(define (fn-for-elt e)
(
    ... (elt-name e)    ; string 
    ... (elt-data e)    ; integer 
    ... (fn-for-listOfElement (elt-subs e))    ; listOfElements
))


;; ListOfElement is one of:
;;  - empty
;;  - (cons Element ListOfElement)
;; interp. A list of file system Elements
#;
(define (fn-for-listOfElement loe)
(
    cond [(empty? loe) (...)]
         [else
         (
             ... (fn-for-elt (first loe))
             ... (fn-for-listOfElement (rest loe))
         )]
))

(define F1 (make-elt "F1" 1 empty))
(define F2 (make-elt "F2" 2 empty))
(define F3 (make-elt "F3" 3 empty))
(define D4 (make-elt "D4" 0 (list F1 F2)))
(define D5 (make-elt "D5" 0 (list F3)))
(define D6 (make-elt "D6" 0 (list D4 D5)))

;Functions:
;           D6:0
;         /    \
;       D5:0    D4:0
;      /       /   \
;    F3:3    F1:1     F2:2

; PROBLEM
; 
; Design a function that consumes Element and produces the sum of all the file data in  the tree.
; 

(check-expect (sum-file-data F3) 3)
(check-expect (sum-file-data D5) (+ 0 3))
(check-expect (sum-file-data D4) (+ 0 1 2))
(check-expect (sum-file-data D6) (+ 3 (+ 1 2)))

;(define(sum-file-data anElement) 0) ; stub

(define(sum-file-data anElement)
(
    + 
    (elt-data anElement)                        ; integer 
    (sum-listOfElement (elt-subs anElement))    ; listOfElements
))

#; ; linear recursion
(define (sum-listOfElement loe)
(
    cond [(empty? loe) 0]
         [else
         (
             +
             (sum-file-data (first loe))        ; element
             (sum-listOfElement (rest loe))     ; listOfElements
         )]
))
; tail recursion
(define (sum-listOfElement loe0)
(local [
(define (sum-listOfElement loe acc)
(
    cond [(empty? loe) acc]
         [else             
             (sum-listOfElement (rest loe)
                 (+ (sum-file-data (first loe)) acc))    
         ]
))]
(sum-listOfElement loe0 0)))



; 
; PROBLEM
; 
; Design a function that consumes Element and produces a list of the names of all the elements in the tree. 
; 

; 
; PROBLEM
; 
; Design a function that consumes String and Element and looks for a data element with the given 
; name. If it finds that element it produces the data, otherwise it produces false.
; 
;; Function name : find-name
;; String Element -> Integer (elt-data) or false
;; Element -> (make-elt  name data subs)
;; Mutual reference and self referencial funx. required

;; Self-ref. func name :find-ListOfElements
;; String loe -> loe / String ???






; 
; PROBLEM
; 
; Design a function that consumes Element and produces a rendering of the tree. For example: 
; 
; (render-tree D6) should produce something like the following.
; 
; .
; 
; HINTS:
;   - This function is not very different than the first two functions above.
;   - Keep it simple! Start with a not very fancy rendering like the one above.
;     Once that works you can make it more elaborate if you want to.
;   - And... be sure to USE the recipe. Not just follow it, but let it help you.
;     For example, work out a number of examples BEFORE you try to code the function. 
;     
(test)



