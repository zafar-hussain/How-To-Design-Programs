;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname check-range1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 9.5.4 Develop the function check-range1, which consumes a list of temperature
;measurements and checks whether all measurements are between 5°C and 95°C.

;; check-range1 : lon -> boolean
;; returns true if all the numbers in the list are between 5°C and 95°C
(check-expect (check-range1 empty) true) ; basecase
(check-expect (check-range1 (cons 1 (cons 6 empty))) false)
(check-expect (check-range1 (cons 11 (cons 6 (cons 78 (cons 88 empty))))) true)

;(define (check-range1 lon) false) ; stub
;;template
#; 
(define (fn-for-lon lon)
  (cond
    [(empty? lon) ...]
    [else
     (...
      ... (first lon)
      ... (fn-for-lon (rest lon)))]
    ))
  
(define (check-range1 lon)
  (cond
    [(empty? lon) #t]
    [else
;     (and
;      (> (first lon) 5)
;      (< (first lon) 95)
;      (check-range1 (rest lon)))
      (gen-check-range1 lon 5 95)]
    ))

;Generalize the function to check-range, which consumes a list of temperature measurements
;and a legal interval and checks whether all measurements are within the legal interval

;;template
#; 
(define (fn-for-lon lon lower upper)
  (cond
    [(empty? lon) ...]
    [else
     (...
      ... (first lon)
      ... (fn-for-lon (rest lon) lower upper))]
    ))

(define (gen-check-range1 lon lower upper)
  (cond
    [(empty? lon) true]
    [else
     (and
      (> (first lon) lower)
      (< (first lon) upper)
      (gen-check-range1 (rest lon) lower upper))]
    ))