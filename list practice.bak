;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |list practice|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; func: add-list-numbers : listofNumbers -> number
;; returs the total of all the numbers in the list

;(define (add-list-numbers  LON) 0) ; stub
(check-expect (add-list-numbers empty) 0)
(check-expect (add-list-numbers (cons 1 empty)) 1)
(check-expect (add-list-numbers (cons 1 (cons 2 empty))) 3)

;; template
#;
(define (add-list-numbers aList)
  (cond
    [(empty? aList) ...]
    [else
     (...
      (first aList)
      (fn-for-list (rest alist)))]))

(define (add-list-numbers aList)
  (cond
    [(empty? aList) 0]
    [else
     (+
      (first aList)
      (add-list-numbers (rest aList)))]
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Design a function to calculate the total number of individual characters in a list of strings.

;; function : length : listOfChars -> number
;; returns total numbers of chars in a list of chars

;(define (str-length aList) 0)       ; stub
(check-expect (str-length empty) 0) ; basecase
(check-expect (str-length (cons 'a (cons 'b empty))) 2)

(define (str-length aList)
  (cond
    [(empty? aList) 0]
    [else
     (add1
      (str-length (rest aList)))]
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Design a function to double every number in a list.

;; func: double-it : listOfNumbers -> listOfNumbers
;; return the same listofNumbers with each number doubled

;(define (double-it LON)  '())        ; stub
(check-expect (double-it '()) '())   ; basecase
(check-expect (double-it '(1 2)) '(2 4)) 

(define (double-it LON)
  (cond
    [(empty? LON) '()]
    [else
     (cons
      (* 2 (first LON))
      (double-it (rest LON)))]))