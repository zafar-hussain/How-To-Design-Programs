;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname palindrome) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require racket/list)

;Exercise 502. Design the function palindrome,
;which accepts a non-empty list and constructs a palindrome by mirroring the list around the last item.
;When given (explode "abc"), it yields (explode "abcba").
;
;Hint Here is a solution designed by function composition:

; [NEList-of 1String] -> [NEList-of 1String]
; creates a palindrome from s0
(check-expect  (mirror (explode "abc")) (explode "abcba"))

(define (mirror s0)
  (append (all-but-last s0)
          (list (last s0))
          (reverse (all-but-last s0))))

;; returns all the items of the given list but the last
;; all-but-last : lox -> lox

;(define (all-but-last lox) '())                   ; stub
;(check-expect (all-but-last '()) '())              ; basecase
(check-expect (all-but-last '(1 2 3 4)) '(1 2 3))

(define (all-but-last lox)
  (local [
          (define (all-but-last lox acc)
            (cond
              [(empty? (rest lox)) acc]
              [else
               (all-but-last (rest lox) (append acc (list (first lox))))]))]
    (all-but-last lox '())))


;This solution traverses s0 four times:
;via all-but-last,
;
;via last,
;
;via all-but-last again, and
;
;via reverse, which is ISL+’s version of invert.
;
;Even with local definition for the result of all-but-last,
;the function needs three traversals.
;While these traversals aren’t “stacked” and therefore don’t have a disastrous impact on the function’s performance,
;an accumulator version can compute the same result with a single traversal. 