;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname bundle) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; bundle a list of 1strings into list of chuncks of given size

;; bundle: [listOf 1Strings] n -> [listOf n sized strings]

(define (bundle s n) '())               ; stub
(check-expect (bundle '() 7) '())       ; terminating condition - empty list
(check-expect (bundle '(a) 2) '(a))     ; corresponding solution
(check-expect (bundle '(a b) 2) '(ab))  ; smaller problem
(check-expect (bundle '(a b c d e f) 2)   '(ab cd ef))
(check-expect (bundle '(a b c d e f) 3)   '(abc def))

(define (bundle s n)
  (cond
    [(empty? s) '()]
    [(empty? (rest s)) s]
    [else
     (cons
      (first-n-members s n)
      (bundle (rest-members s n)))]))


;;(first-n-members s n): returns the first 