;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Moving Pictures|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 10.3.1 Provide a data definition that describes the class of lists of shapes. The class of
;shapes was defined in exercise 7.4.1.

;Create a sample list that represents the face of figure 10.3.6 and name it FACE. Its basic
;dimensions are gathered in the following table:

;shape		position 	size(s) 	color

;circle 	(50,50) 	40 		    red
;rectangle 	(30,20) 	5X5		    blue
;rectangle	(65,20) 	5X5		    blue
;rectangle	(40,75)		20X10		red
;rectangle	(45,35) 	10X30		blue

;The table assumes a canvas of size 300 by 100.

;; size : make-struct [height      width]
;;                     number      number 
(define-struct size [height width])

;; shape : make-struct [type		position 	size  	color]
;;	               'symbol		posn		struct  'symbol

(define-struct shape [type position size color])
;; examples
(define circle5050 (make-shape 'circle    (make-posn 50 50) (make-size 40 0) 'red))
(define rect3020   (make-shape 'rectangle (make-posn 30 20) (make-size 5  5) 'blue))
(define rect6520   (make-shape 'rectangle (make-posn 65 20) (make-size 5  5) 'blue))
(define rect4075   (make-shape 'rectangle (make-posn 40 75) (make-size 20 10) 'red))
(define rect4535   (make-shape 'rectangle (make-posn 45 35) (make-size 10 30) 'blue))

;; template
#;
(define (fn-for-shape s)
  (...
   ... (shape-type s)
   ... (posn-x (shape-position s))
   ... (posn-y (shape-position s))
   ... (cond
         [(symbol=? (shape-type s) 'circle)    (... (size-height (shape-size s)))]
         [(symbol=? (shape-type s) 'rectangle) (... (size-height (shape-size s))) (... (size-width (shape-size s)))])
   ... (shape-color s)))

;Develop the template fun-for-losh, which outlines functions that consume a list-of-shapes.

;; template
#;
(define (fn-for-losh losh)
  (cond
    [(empty? losh) ... ]
    [else
     (...
      ... (first losh)
      ... (fn-for-losh (rest losh)))

      ]
    ))