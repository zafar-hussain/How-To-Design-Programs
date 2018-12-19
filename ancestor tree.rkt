;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |ancestor tree|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; an ancestor tree is one of
;; empty
;; (make-child father mother 'name date 'eycolor)

(define-struct child (father mother name date eyes))


(define Carl    (make-child empty empty   'Carl    1926 'green))
(define Bettina (make-child empty empty   'Bettina 1926 'green))
(define Adam    (make-child Carl  Bettina 'Adam    1950 'yellow))
(define Dave    (make-child Carl  Bettina 'Dave    1955 'black))
(define Eva     (make-child Carl  Bettina 'Eva     1965 'blue))
(define Fred    (make-child empty empty   'Fred    1966 'pink))
(define Gustav  (make-child Eva   Fred    'Gustav  1988 'brown))

;; fn-for-fTree
;; an ancestor tree is one of
;; empty
;; (make-child father mother 'name date 'eycolor)

#;
(define (fn-for-fTree fTree )
  (cond
    [(empty? fTree) ...]
    [else
     ...
     (fn-for-fTree   (child-father fTree))
     (fn-for-fTree   (child-mother fTree))
     (child-name     fTree)
     (child-date     fTeee)
     (child-eyecolor fTree)]))
     

