;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname sum) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sum : lon -> number
;; sums up the given list of numbers
(check-expect (sum empty) 0) ; basecase
(check-expect (sum (cons 1 (cons 3 empty))) 4)
(check-expect (sum (list 1 2 3)) 6)

;(define (sum lon) 0) ;stub

;; template
#;
(define (fn-for-lon lon)
  (cond
    [(empty? lon) ...]
    [else
     (...
      ... (first lon) ...
      ... (fn-for-lon (rest lon)) ...)
     ]
    ))
 
(define (sum lon)
  (cond
    [(empty? lon) 0]
    [else
     (+
      (first lon)
      (sum (rest lon)))
     ]
    ))