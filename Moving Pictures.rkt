;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Moving Pictures|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require htdp/draw)
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

;Exercise 10.3.2 Use the template fun-for-losh to develop the function draw-losh. It consumes a
;list-of-shapes, draws each item on the list, and returns true. Remember to use (start n m) to
;create the canvas before the function is used.

;; draw-shape : shape -> boolean
;; given a shape structure, it draws the shape and returns true
(start 300 300)
(check-expect (draw-shape circle5050) (draw-circle     (make-posn 50 50) 40     'red))
(check-expect (draw-shape rect3020)   (draw-solid-rect (make-posn 30 20) 5   5 'blue))
(stop)

;(define (draw-shape s) true) ; stub

;; shape is one of : circle or a rectangle
(define (draw-shape s)
  (cond
    [(symbol=? (shape-type s) 'circle) 
     (draw-circle (shape-position s) (size-height (shape-size s)) (shape-color s))]
    [(symbol=? (shape-type s) 'rectangle)
     (draw-solid-rect (shape-position s)  (size-height (shape-size s)) (size-width (shape-size s)) (shape-color s))]
    ))
  

;; draw-losh : losh -> boolean
;; draws the images in the given listOfShapes and returns true
;; examples
(start 300 100)
(check-expect (draw-losh empty) #t) ; basecase
(check-expect (draw-losh (cons circle5050 empty)) (and (start 300 100)
                                                       (draw-circle (make-posn 50 50) 40 'red)))
(check-expect (draw-losh (cons circle5050 (cons  rect3020  empty))) (and (draw-circle     (make-posn 50 50) 40    'red)
                                                                        (draw-solid-rect (make-posn 30 20) 5  5 'blue)))
(check-expect (draw-losh (list circle5050 rect3020 rect6520 rect4075 rect4535)) (and                                                                      
                                                                                 (draw-circle     (make-posn 50 50) 40    'red)
                                                                                 (draw-solid-rect (make-posn 30 20) 5  5  'blue)
                                                                                 (draw-solid-rect (make-posn 60 20) 5  5  'blue)
                                                                                 (draw-solid-rect (make-posn 40 75) 20 10 'blue)
                                                                                 (draw-solid-rect (make-posn 45 35) 10 30 'blue)))


;(define (draw-losh losh) #t) ; stub

(define (draw-losh losh)
  (cond
    [(empty? losh) #t]
    [else
     (and
      (draw-shape (first losh))
      (draw-losh (rest losh)))
     ]
    ))

  
