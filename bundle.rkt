;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname bundle) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; bundles a list of 1String(s) into a list of 'n' sized chuncks
;; bundle : [ListOf 1String] n -> [ListOf 'n' sized chuncks]

;(define (bundle los n)                           '())                           ; stub
(check-expect (bundle  '() 2)                     '())                           ; basecase, trivial
(check-expect (bundle  '( "a") 2)                 '("a"))                        ; corresponding case
(check-expect (bundle   (list "a" "b" "c" "d") 2) '("ab" "cd"))
(check-expect (bundle   (list "a" "b" "c") 2)     '("ab" "c"))
(check-expect (bundle  '("a" "b" "c" "d" "e") 3)  '("abc" "de"))


;; template to use : is one of, structural recursion

(define (bundle los n)
  (cond
    [(empty? los) '()]
    [else
     (append                                ;; append lists          
      (list (implode (take los n)))         ;; take chunk here via an aux procedure
      (bundle (drop los n) n))]))           ;; drops n elements

;;Design take. It consumes a list l and a natural number n. It produces the first
;;n items from l or all of l if it is too short.

;(define (take los n) '())                    ; stub
(check-expect (take '("a" "b" "c" "d") 0) '())        ; trivial case
(check-expect (take '("a" "b" "c" "d") 2) '("a" "b"))
(check-expect (take '("a" "b" "c" "d") 3) '("a" "b" "c"))

(define (take los n)
  (cond
    [(zero? n) '()]
    [(<= (length los) n) los]
    [else
     (cons
      (first los)
      (take (rest los) (sub1 n)))]))


;;Design drop. It consumes a list l and a natural number n. Its result is l with the first n items
;;removed or just ’() if l is too short


;; drop : [listOf X] n -> [listOf X]

;(define (drop l n) '())                                           ; stub
(check-expect (drop '("a" "b" "c" "d") 0) '("a" "b" "c" "d"))      ; basecase
(check-expect (drop '("a" "b") 3)         '())                     ; list is too short
(check-expect (drop '("a" "b" "c" "d") 2) '("c" "d"))
(check-expect (drop '("a" "b" "c" "d") 3) '("d"))

(define (drop los n)
  (cond
    [(zero? n) los]
    [(<= (length los) n) '()]
    ;[(empty? los) '()]
    [else
     (drop (rest los) (sub1 n))])) 