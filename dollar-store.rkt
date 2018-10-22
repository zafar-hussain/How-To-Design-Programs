;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname dollar-store) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 9.5.3 Develop the function dollar-store?, which consumes a list of prices (numbers)
;and checks whether all of the prices are below 1. For example, the following expressions should
;evaluate to true:
;(dollar-store? empty)
;(not (dollar-store? (cons .75 (cons 1.95 (cons .25 empty)))))
;(dollar-store? (cons .75 (cons .95 (cons .25 empty))))


;; dollar-store? : lon -> boolean
;; returns true if all the numbers in the list are below 1
(check-expect (dollar-store? empty) #t) ; basecase
(check-expect (dollar-store? (cons .75 (cons 1.95 (cons .25 empty)))) #f)
(check-expect (dollar-store? (cons .75 (cons .95 (cons .25 empty)))) #t)

;(define (dollar-store? lon) #f) ; stub
;; template
#;
(define (fn-for-lon lon)
  (cond
    [(empty? lon) ...] ; basecase
    [else
     (...
      ... (first lon)
      ... (fn-for-lon (rest lon)))]
    ))

(define (dollar-store? lon)
;  (cond
;    [(empty? lon) #t] ; basecase
;    [else
;     (and
;      (< (first lon) 1)
;      (dollar-store? (rest lon)))]
;    )
  (gen-dollar-store? lon 1))

;Generalize the function so that it consumes a list of prices (numbers) and a threshold price
;(number) and checks that all prices in the list are below the threshold.
;; template
#;
(define (fn-for-lon lon n)
  (cond
    [(empty? lon) ...] ; basecase
    [else
     (...
      ... (first lon)
      ... (fn-for-lon (rest lon) n))]
    ))

(define (gen-dollar-store? lon n)
  (cond
    [(empty? lon) #t] ; basecase
    [else
     (and
      (< (first lon) n)
      (gen-dollar-store? (rest lon) n))]
    ))