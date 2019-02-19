;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname replicate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; 
; PROBLEM:
; 
; Design a function that consumes a list of elements and a natural n, and produces a list where each element is replicated n times. 
; 
; (replicate-elm (list "a" "b" "c") 2) should produce (list "a" "a" "b" "b" "c" "c")
; 

;; replicates each element of the list n times
;; replicate : lox n -> lox

;(define (nreplicate lox n) '())       ; stub
(check-expect (nreplicate '() 9) '()) ; basecase
(check-expect (nreplicate (list "a" "b" "c") 2) (list "a" "a" "b" "b" "c" "c"))

;; (nreplicate  (list "a" "b" "c") 2) -> (list a) 
;; (nreplicate  (list "a" "b" "c") 1) -> (list a a)
;; (nreplicate  (list "a" "b" "c") 0) ->  (nreplicate  (list "b" "c") 2)

(define (nreplicate lox n)
  (local [
          (define (nreplicate lox acc)
            (cond
              [(empty? lox) '()]
              [(zero? acc) (nreplicate (rest lox) n)]
              [else
               (cons
                (first lox)
                (nreplicate lox (sub1 acc)))]))
          ]
    (nreplicate lox n)))