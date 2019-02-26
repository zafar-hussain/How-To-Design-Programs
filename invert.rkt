;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname invert) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; invert: [List-of X] -> [List-of X]
; constructs the reverse of alox
 
;(define (invert lox) '())           ; stub
(check-expect (invert '()) '())     ; basecase
(check-expect (invert '(a b c)) '(c b a))

;; template used : structural recursion
#;
(define (invert lox)
  (cond
    [(empty? lox)'()]
    [else
     (put-to-last                ;; puts the given element to the end of the given list  
      (first lox)                ;; first of the list
      (invert (rest lox)))]))      ;; already inverted rest of the list

#;
;; cpu time: 2699 real time: 2698 gc time: 1670
(define (invert lox)
  (cond
    [(empty? lox)'()]
    [else
     (append
      (invert (rest lox))  
      (list (first lox)))]))       


;;cpu time: 31 real time: 19 gc time: 0
(define (invert lox)
  (local [
          (define (invert lox acc)
            (cond
              [(empty? lox) acc]
              [else                     
               (invert (rest lox) (cons (first lox) acc)) ]))]
    (invert lox '())))

;; (invert '(a b c)) => (put-to-last 'a (invert '(b c))
;; (invert '(a b c)) => (put-to-last 'a (put-to-last 'b (invert '(c))
;; (invert '(a b c)) => (put-to-last 'a (put-to-last 'b (put-to-last 'c (invert '())
;; (invert '(a b c)) => (put-to-last 'a (put-to-last 'b (put-to-last 'c '())
;; (invert '(a b c)) => (put-to-last 'a (put-to-last 'b (put-to-last '(c))
;; (invert '(a b c)) => (put-to-last 'a (put-to-last 'b '(c))
;; (invert '(a b c)) => (put-to-last 'a '(c b))
;; (invert '(a b c)) =>  '(c b a))

;; aus-fn : put-to-last : x [listOf X] -> [listOf X]
;; inserts the given x towards the end of the list

;(define (put-to-last x lox) (list x))       ; stub
(check-expect (put-to-last 'a '()) '(a))    ; basecase
(check-expect (put-to-last 'a '(c b)) '(c b a)) 

;; template used : structural recursion

(define (put-to-last x lox)
  (cond
    [(empty? lox) (list x)]
    [else
     (cons
      (first lox)
      (put-to-last x (rest lox)))]))

(time (invert (build-list 10000 add1)))