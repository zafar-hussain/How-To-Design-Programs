;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |functional Abstraction|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; write two function the return min and max of a list and then abstract them

;; function my_min : listOfNumbers -> number
;; returns the my_min of a list of numbers

;(define (my_min lon) 0)    ; stub
;(check-expect (my_min '()) 99999)
(check-expect (my_min (list 3 1 2)) 1)

;; template used : atomic + self recursive

(define (my_min lon)
  ;  (cond
  ;    [(empty? (rest lon)) (first lon)]
  ;    [else
  ;     (if (< (first lon) (my_min (rest lon)))
  ;         (first lon)
  ;         (my_min (rest lon)))]))
  (filter? < lon))

;; function my_max : listOfNumbers -> number
;; returns the my_max of a list of numbers

;(define (my_max lon) 0)    ; stub
;(check-expect (my_max '()) 0)
(check-expect (my_max (list 3 1 2)) 3)

;; template used : atomic + self recursive

(define (my_max lon)
  ;  (cond
  ;    [(empty? (rest lon)) (first lon)]
  ;    [else
  ;     (if (> (first lon) (my_max (rest lon)))
  ;         (first lon)
  ;         (my_max (rest lon)))]))
  (filter? > lon))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;the abstract

(define (filter? func lon)
  
  (cond
    [(empty? (rest lon)) (first lon)]
    [else
     (local 
       ((define first_lon (first lon))
        (define rest_lon  (filter? func (rest lon))))
       (if (func first_lon rest_lon)
           first_lon
           rest_lon))]))


