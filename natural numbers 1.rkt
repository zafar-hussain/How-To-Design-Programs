#lang racket
(require test-engine/racket-tests)

;;;   Exercise 11.2.1 Generalize hellos to repeat, which consumes a natural number n and a symbol
;;; and produces a list with n occurrences of the symbol.



;; ++++++++++++++++++++++++++++++++++++++++++++++++
;;; Exercise 11.2.2 Develop the function tabulate-f, which tabulates the values of
;;; ;; f : number → number
;;; (define (f x)
;;; (+ (* 3 (* x x))
;;; (+ (* -6 x)
;;; -1)))
;;; for some natural numbers. Specifically, it consumes a natural number n and produces a list of nposns. The first one combines n with (f n), the second one n-1 with (f n-1), etc.


;; +++++++++++++++++++++++++++++++++++++++++++++++
;;; Exercise 11.2.3 Develop apply-n. The function consumes a natural number, n. It applies the
;;; function move from exercise 10.3.6 n times to FACE, the list of shapes from exercise 10.3.1.
;;; Each application should translate the shape by one pixel. The purpose of the function is to
;;; simulate a continuously moving shape on a canvas, the last missing piece of the extended
;;; exercise 10.3.

;; +++++++++++++++++++++++++++++++++++++++++++++++
;;; Exercise 11.2.4 Lists may contain lists that contain lists and so on. Here is a data definition that
;;; takes this idea to an extreme:
;;; A deep-list is either
;;; 1. s where s is some symbol or
;;; 2. (cons dl empty), where dl is a deep list.
;;; Develop the function depth, which consumes a deep list and determines how many times cons
;;; was used to construct it.
;;; Develop the function make-deep, which consumes a symbol s and a natural number and
;;; produces a deep list containing s and constructed with n conses.









(test)

