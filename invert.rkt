;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname invert) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; invert: [List-of X] -> [List-of X]
; constructs the reverse of alox
 
;(define (invert lox) '())           ; stub
(check-expect (invert '()) '())     ; basecase
(check-expect (invert '(a b c)) '(c b a))

;; template used : structural recursion

(define (invert lox)
  (cond
    [(empty? lox)'()]
    [else
     (put-to-last                ;; puts the given element to the end of the given list  
      (first lox)                ;; first of the list
      (invert (rest lox)))]))      ;; already inverted rest of the list

;; aus-fn : put-to-last : x [listOf X] -> [listOf X]
;; inserts the given x towards the end of the list

;(define (put-to-last x lox) (list x))       ; stub
(check-expect (put-to-last 'a '()) '(a))    ; basecase
(check-expect (put-to-last 'a '(c b)) '(c b a)) 

;; template used : structural recursion

(define (put-to-last x lox)
  (cond
    [(empty? lox) (list x)]
    [else
     (cons
      (first lox)
      (put-to-last x (rest lox)))]))
