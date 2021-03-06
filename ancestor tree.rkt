;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |ancestor tree|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; an ancestor tree is one of
;; empty
;; (make-child father mother 'name date 'eycolor)

(define-struct child (father mother name date eyecolor))


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
     
;blue-eyed-ancestor?, the function that determines
;whether anyone in some given family tree has blue eyes:

(check-expect (blue-eyed-ancestor? empty)  #f)
(check-expect (blue-eyed-ancestor? Eva)    #t)
(check-expect (blue-eyed-ancestor? Gustav) #t)
(check-expect (blue-eyed-ancestor? Adam)   #f)
(check-expect (blue-eyed-ancestor? Carl)   #f)

;(define (blue-eyed-ancestor? Ft) #f) ;stub

(define (blue-eyed-ancestor? fTree )
  (cond
    [(empty? fTree) #f]
    [else
     (or
      (symbol=? (child-eyecolor fTree) 'blue)
      (blue-eyed-ancestor?   (child-father fTree))
      (blue-eyed-ancestor?   (child-mother fTree)))
     ]))

;;Exercise 14.1.3 Develop count-persons. The function consumes a family tree node and produces
;;the number of people in the corresponding family tree.

;; count-person -> fTree -> number
(check-expect (count-person empty)   0)
(check-expect (count-person Carl)    1)
(check-expect (count-person Adam)    3)
(check-expect (count-person Gustav)  5)

;(define (count-person fTree) 0) ; stub          
(define (count-person fTree )
  (cond
    [(empty? fTree) 0]
    [else
     (+
      1
      (count-person   (child-father fTree))
      (count-person   (child-mother fTree)))
     ]))

(define (get-age aChild current-year) (- current-year  (child-date aChild)))


;;Exercise 14.1.4 Develop the function average-age. It consumes a family tree node and the
;;current year. It produces the average age of all people in the family tree
(check-expect (sum-of-age empty 2000) 0.0)
(check-expect (sum-of-age Carl 2000) (get-age Carl 2000))
(check-expect (sum-of-age Adam 2000)  (+ (get-age Carl 2000) (get-age Bettina 2000) (get-age Adam 2000)))


;(define (sum-of-age fTree current-year) 0.0) ; stub
(define (sum-of-age fTree current-year )
  (cond
    [(empty? fTree) 0.0]
    [else
     (+
      (get-age fTree current-year)
      (sum-of-age   (child-father fTree) current-year)
      (sum-of-age   (child-mother fTree) current-year))
     ]))


(check-expect (avgerage-age empty 2000) 0.0)
(check-expect (avgerage-age Carl 2000) (get-age Carl 2000))
(check-expect (avgerage-age Adam 2000)  (/ (sum-of-age Adam 2000)  (count-person Adam)))

;(define (avgerage-age fTree current-year) 0.0) ; stub
(define (avgerage-age fTree current-year)
  (cond
    [(empty? fTree) 0.0]
    [else (/ (sum-of-age fTree current-year)  (count-person fTree))]
    ))


;Exercise 14.1.5 Develop the function eye-colors, which consumes a family tree node and
;produces a list of all eye colors in the tree

;(define (eye-color fTree) empty) ; stub
(check-expect (eye-color empty) empty)
(check-expect (eye-color Carl) (cons 'green empty))
(check-expect (eye-color Adam) (cons 'yellow (cons 'green (cons 'green empty))))

(define (eye-color fTree )
  (cond
    [(empty? fTree) empty]
    [else
     (append
      (list (child-eyecolor fTree))
      (eye-color   (child-father fTree))
      (eye-color   (child-mother fTree)))
     
     ]))


(define (proper-blue-eyed-ancestor? a-ftree)
  (cond
    [(empty? a-ftree) false]
    
    [else (or
           (symbol=? (child-eyecolor (child-father a-ftree)) 'blue)
           (symbol=? (child-eyecolor (child-mother a-ftree)) 'blue)
           

           (proper-blue-eyed-ancestor? (child-father a-ftree))
           (proper-blue-eyed-ancestor? (child-mother a-ftree)))]))


;; blue-eyed-ancestors : tree -> listOf symbols
;; given a family tree returns a list of blue-eyes ancestors

;(define (blue-eyed-ancestors ft) '())         ; stub
(check-expect (blue-eyed-ancestors '()) '())  ; basecase
(check-expect (blue-eyed-ancestors Carl) '()) ; no ancestor
(check-expect (blue-eyed-ancestors Gustav) '(Eva))
(check-expect (blue-eyed-ancestors Adam) '())

#;
(define (blue-eyed-ancestors ft)
  (cond
    [(empty? ft) '()]
    [else
     (if (symbol=? (child-eyecolor ft) 'blue)
         (cons (child-name ft) (append (blue-eyed-ancestors (child-father ft)) (blue-eyed-ancestors (child-mother ft))))
         (append (blue-eyed-ancestors (child-father ft)) (blue-eyed-ancestors (child-mother ft)))
         )]))

(define (blue-eyed-ancestors ft)
  (cond
    [(empty? ft) '()]
    [else
     (local [(define blue-eyed-parents
               (append (blue-eyed-ancestors (child-father ft)) (blue-eyed-ancestors (child-mother ft))))]
       (cond
         [(symbol=? (child-eyecolor ft) 'blue) (cons (child-name ft)  blue-eyed-parents)]
         [else blue-eyed-parents]))
     ]))

