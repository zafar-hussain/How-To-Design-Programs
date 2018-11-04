;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Recursive Auxiliary Functions|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;#lang racket
;(require test-engine/racket-tests)
;

;; insertion-sort : listofNumbers -> listofNumbers
;; sorts the given list by insertion sort in descending
(check-expect (insertion-sort empty) empty) ; basecase
(check-expect (insertion-sort (cons 9 (cons 10 (cons 1  empty)))) (cons 10 (cons 9 (cons 1 empty))))
(check-expect (insertion-sort (list  1 2 3 4 5)) (list 5 4 3 2 1))

;(define (insertion-sort lon) empty) ; stub

(define (insertion-sort lon)
  (cond
    [(empty? lon) empty]
    [else
     (insert
      (first lon)
      (insertion-sort (rest lon))
      )]
    ))

;; insert : atomic, listOfNumbers -> listOfNumbers
;; inserts the atomic in the listOfNumbers in descending order

(check-expect (insert 3 empty) (cons 3 empty)) ; basecase
(check-expect (insert 3 (list 2)) (cons 3 (cons 2 empty)))
(check-expect (insert 3 (list 4 1)) (cons 4 (cons 3 (cons 1 empty))))

(check-expect (insert 8 (cons 10 (cons 9 (cons 1 empty)))) (cons 10 (cons 9 (cons 8 (cons 1 empty)))))

;(define (insert atomic lon) (cons atomic empty)) ; stub

(define (insert atomic lon)
  (cond
    [(empty? lon)            (cons atomic       empty)]
    [(>= atomic (first lon)) (cons atomic       lon)]
    [(<  atomic (first lon)) (cons (first lon) (insert atomic (rest lon)))]
    ))



(define-struct mail (from date message))
;A mail-message is a structure:
;(make-mail name n s)
(define m0 (make-mail "zafar" 0 "hussain"))
(define m1 (make-mail "aun"   1 "ali"))
(define m2 (make-mail "taha"  2 "ali"))

#;
(define (fn-for-mail m)
  (...
   ... (mail-name    m)
   ... (mail-date    m)
   ... (mail-message m)
   ))

;; listOfMail
#;
(define (fn-for-listOfMail lom)
  (cond
    [(empty? lom) ...]
    [else
     (...
      ... (first lom)
      ... (fn-for-listOfMail (rest lom)))
     ]))

;Exercise 12.2.1 Develop a program that sorts lists of mail messages by date. Mail structures are
;defined as follows:
;(define-struct mail (from date message))
;A mail-message is a structure:
;(make-mail name n s)
;where name is a string, n is a number, and s is a string.
(check-expect (sort-mail-by-date empty) empty) ; basecase
(check-expect (sort-mail-by-date (cons m0 (cons m1 empty))) (cons m0 (cons m1 empty)))
(check-expect (sort-mail-by-date (cons m1 (cons m0 empty))) (cons m0 (cons m1 empty)))
(check-expect (sort-mail-by-date (cons m2 (cons m0 (cons m1 empty)))) (cons m0 (cons m1 (cons m2 empty))))

;(define (sort-mail-by-date lom) empty) ; stub
(define (sort-mail-by-date lom)
  (cond
    [(empty? lom) empty]
    [else
     (mail-insert
      (first lom)
      (sort-mail-by-date (rest lom)))
     ]))

;; mail-insert : X loX -> loX
;; inserts the given mail within the listOfMail in ascending order by date
(check-expect (mail-insert m0 empty) (cons m0 empty)) ; basecase
(check-expect (mail-insert m0 (cons m1 empty)) (cons m0 (cons m1 empty)))
(check-expect (mail-insert m1 (cons m0 empty)) (cons m0 (cons m1 empty)))
(check-expect (mail-insert m2 (cons m0 (cons m1 empty))) (cons m0 (cons m1 (cons m2 empty))))

;(define (mail-insert m lom) (cons m empty)) ; stub
(define (mail-insert m lom)
  (cond
    [(empty? lom) (cons m empty)]
    [(<= (mail-date m) (mail-date (first lom))) (cons m lom)]
    [(>  (mail-date m) (mail-date (first lom))) (cons (first lom) (mail-insert m (rest lom)))]
    ))

;Also develop a program that sorts lists of mail messages by name. To compare two strings
;alphabetically, use the string < ? primitive
(check-expect (sort-mail-by-name empty) empty) ; basecase
(check-expect (sort-mail-by-name (cons m0 (cons m1 empty))) (cons m0 (cons m1 empty)))
(check-expect (sort-mail-by-name (cons m1 (cons m0 empty))) (cons m0 (cons m1 empty)))
(check-expect (sort-mail-by-name (cons m2 (cons m0 (cons m1 empty)))) (cons m0 (cons m1 (cons m2 empty))))


;(define (sort-mail-by-date lom) empty) ; stub
(define (sort-mail-by-name lom)
  (cond
    [(empty? lom) empty]
    [else
     (mail-insert
      (first lom)
      (sort-mail-by-name (rest lom)))
     ]))

;; mail-insert : X loX -> loX
;; inserts the given mail within the listOfMail in ascending order by date
(check-expect (mail-insert-by-name m0 empty) (cons m0 empty)) ; basecase
(check-expect (mail-insert-by-name m0 (cons m1 empty)) (cons m0 (cons m1 empty)))
(check-expect (mail-insert-by-name m1 (cons m0 empty)) (cons m0 (cons m1 empty)))
(check-expect (mail-insert-by-name m2 (cons m0 (cons m1 empty))) (cons m0 (cons m1 (cons m2 empty))))

;(define (mail-insert-by-name m lom) (cons m empty)) ; stub
(define (mail-insert-by-name m lom)
  (cond
    [(empty? lom) (cons m empty)]
    [(string>=? (mail-from m) (mail-from (first lom))) (cons m lom)]
    [(string<?  (mail-from m) (mail-from (first lom))) (cons (first lom) (mail-insert m (rest lom)))]
    ))

;; develop linear-search
(check-expect (linear-search 1 empty) false) ; basecase
(check-expect (linear-search 1 (list 1 2)) true)
(check-expect (linear-search 1 (list 2 3 1)) true)

;(define (linear-search x lox) false) ; stub
(define (linear-search x lox)
  (cond
    [(empty? lox) false]
    [(= x (first lox)) true]
    [else (linear-search x (rest lox))]
   ))


;Develop the function search-sorted, which determines whether a number occurs in a sorted list
;of numbers. The function must take advantage of the fact that the list is sorted
(check-expect (search-sorted 1 empty) false) ; basecase
(check-expect (search-sorted 1 (list 1 2)) true)
(check-expect (search-sorted 2 (list  3 4)) false)
(check-expect (search-sorted 1 (list 2 3)) false)

;(define (search-sorted x lox) false) ; stub


;(test)
;
