;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname tabulate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; Exercise 21.1.1 Define tabulate, which is the abstraction of the following two functions:
;; tabulate-sin : number → lon 
;; to tabulate sin between n  and 0 (inclusive) in a list ;;

;(define (tabulate-Sin N) '())      ; stub
(check-expect (tabulate-Sin 0) '())
(check-within (tabulate-Sin 5) (list (sin 5) (sin 4) (sin 3) (sin 2) (sin 1)) 0.1)

;; template used : atomic + self recursive
(define (tabulate-Sin N)
  ;  (cond
  ;    [(zero? N) '()]
  ;    [else
  ;     (cons
  ;      (sin N)
  ;      (tabulate-Sin (sub1 N)))]))
  (local
    ((define f sin))
    (tabulate f N)))

;; tabulate-sort: number → Ion
;; to tabulate sqrt between n  and 0 (inclusive) in a list

;(define (tabulate-sqrt N) '())      ; stub
(check-expect (tabulate-sqrt 0) '())
(check-within (tabulate-sqrt 5) (list (sqrt 5) (sqrt 4) (sqrt 3) (sqrt 2) (sqrt 1)) 0.1)

;; template used : atomic + self recursive
(define (tabulate-sqrt N)
  ;  (cond
  ;    [(zero? N) '()]
  ;    [else
  ;     (cons
  ;      (sqrt N)
  ;      (tabulate-sqrt (sub1 N)))]))
  (local
    ((define f sqrt))
    (tabulate f N)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abstract function for tabulate-Sin and tabluate-sqrt
;; tabulate: (f: X -> Y) N -> list of Y

(define (tabulate f N)
  (cond
    [(zero? N) '()]
    [else
     (cons
      (f N)
      (tabulate f (sub1 N)))]))
