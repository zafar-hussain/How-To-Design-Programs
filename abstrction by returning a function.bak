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

