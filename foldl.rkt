;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname foldl) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; device foldl using structural and tail recursion

;; (X Y -> Y) Y (listof X) -> Y
;; (foldl f base (list x-1 ... x-n)) = (f x-n ... (f x-1 base))

;(define (my-foldl f base lox) 0)

(check-expect (my-foldl + 0 '(1 2 3 4)) 10)
(check-expect (my-foldl cons '() '(1 2 3 4)) '(1 2 3 4))


;; fn folds from the left
;; the given func takes two parameters and is applied to the resultant and the next value in lox
;; base is the initial value or basecase

;; template used : structural recursion
#;
(define (my-foldl f base lox)
  (cond
    [(empty? lox) base]
    [else
     (f
      (first lox)
      (my-foldl f base (rest lox))) ]))


;; template use : tail recursion with accumulator

(define (my-foldl f base lox)
  (local [
          (define (my-foldl lox acc)
            (cond
              [(empty? lox) acc]
              [else
               (my-foldl (rest lox) (f (first lox) acc))]))]
    (my-foldl (reverse lox) base)))
