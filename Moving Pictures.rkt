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

(define face (list circle5050 rect3020 rect6520 rect4075 rect4535))

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
(start 400 400)
(check-expect (draw-losh empty) #t) ; basecase
(check-expect (draw-losh (cons circle5050 empty)) (draw-circle (make-posn 50 50) 40 'red))
(check-expect (draw-losh (cons circle5050 (cons  rect3020  empty))) (and (draw-circle     (make-posn 50 50) 40    'red)
                                                                         (draw-solid-rect (make-posn 30 20) 5  5 'blue)))
(check-expect (draw-losh (list circle5050 rect3020 rect6520 rect4075 rect4535)) (and                                                                      
                                                                                 (draw-circle     (make-posn 50 50) 40    'red)
                                                                                 (draw-solid-rect (make-posn 30 20) 5  5  'blue)
                                                                                 (draw-solid-rect (make-posn 60 20) 5  5  'blue)
                                                                                 (draw-solid-rect (make-posn 40 75) 20 10 'blue)
                                                                                 (draw-solid-rect (make-posn 45 35) 10 30 'blue)))

(stop)
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

  
;Exercise 10.3.3 Use the template fun-for-losh to develop translate-losh. The function consumes
;a list-of-shapes and a number delta. The result is a list of shapes where each of them has been
;moved by delta pixels in the x direction. The function has no effect on the canvas

;; translate-shape : shape (struct), delta (number) -> shape
;; moves the given shape by delta pixels in the x direction

(check-expect (translate-shape circle5050 10) (make-shape 'circle    (make-posn (+ 50 10) 50) (make-size 40 0) 'red))
(check-expect (translate-shape rect3020   20) (make-shape 'rectangle (make-posn (+ 30 20) 20) (make-size 5  5) 'blue))

;(define (translate-shape s delta) (make-shape 'circle    (make-posn 50 50) (make-size 40 0) 'green)) ; stub

(define (translate-shape s delta)
  (make-shape
   (shape-type s)
   (make-posn (+ (posn-x (shape-position s)) delta)  ; delta added to posn-x
              (posn-y (shape-position s)))
   (shape-size s)
   (shape-color s)))


;; translate-losh : losh, delta (number) -> losh
;; moves (adds) by delta pixels in the x direction
;; does not draw anything on the canvas

(check-expect (translate-losh empty 10) empty) ; basecase
(check-expect (translate-losh (cons circle5050 empty) 60)
              (cons (make-shape 'circle    (make-posn (+ 50 60) 50) (make-size 40 0) 'red) empty))
                                                       
(check-expect (translate-losh (cons circle5050 (cons  rect3020  empty)) 70)
              (list
               (make-shape 'circle    (make-posn (+ 50 70) 50) (make-size 40 0) 'red)
               (make-shape 'rectangle (make-posn (+ 30 70) 20) (make-size 5  5) 'blue)))

;(define (translate-losh losh delta) empty) ;stub

(define (translate-losh losh delta)
  (cond
    [(empty? losh) empty]
    [else
     (cons
      (translate-shape (first losh) delta)
      (translate-losh (rest losh) delta))
     ]
    ))

;Exercise 10.3.4 Use the template fun-for-losh to develop clear-losh. The function consumes a
;list-of-shapes, erases each item on the list from the canvas, and returns true

;; clear-shape : shape -> boolean
;; clears the given shape
;; size : make-struct [height      width]
;; shape : make-struct [type		position 	size  	color]

(check-expect (clear-shape circle5050) (clear-circle (shape-position circle5050)
                                                     (size-height (shape-size circle5050))
                                                     (shape-color circle5050)))

(check-expect (clear-shape rect3020) (clear-solid-rect (shape-position rect3020)
                                                       (size-height (shape-size rect3020))
                                                       (size-width  (shape-size rect3020))
                                                       (shape-color rect3020)))

;(define (clear-shape s) #t) ;stub
;; shape is one of [circle rectangle]

(define (clear-shape s)
  (cond
    [(symbol=? (shape-type s) 'circle)
     (clear-circle
      (shape-position s)
      (size-height (shape-size s))
      (shape-color s))]

    [(symbol=? (shape-type s) 'rectangle)
     (clear-solid-rect
      (shape-position s)
      (size-height (shape-size s))
      (size-width (shape-size s))
      (shape-color s))]
    ))




;; clear-losh : losh -> boolean
;; consumes a listOfShapes and erases each item from canvas, returns true

(check-expect (clear-losh empty) #t) ; basecase
(check-expect (clear-losh (cons circle5050 empty)) (clear-shape circle5050))
(check-expect (clear-losh (list circle5050 rect3020)) (and
                                                       (clear-shape circle5050)
                                                       (clear-shape rect3020)))


;(define (clear-losh losh) #t) ; stub

(define (clear-losh losh)
  (cond
    [(empty? losh) #t ]
    [else
     (and
      (clear-shape (first losh))
      (clear-losh (rest losh)))]
    ))

;Exercise 10.3.5 Develop the function draw-and-clear-picture. It consumes a picture. Its effect is
;to draw the picture, sleep for a while, and to clear the picture.

;; draw-and-clear-picture : losh -> sleep -> clear-losh
(start 300 300)
(check-expect (draw-and-clear-picture empty) #t)
(check-expect (draw-and-clear-picture (cons circle5050 empty)) (and
                                                                (draw-losh (cons circle5050 empty))
                                                                (sleep-for-a-while 1)
                                                                (clear-losh (cons circle5050 empty))))
(check-expect (draw-and-clear-picture (list circle5050 rect3020)) (and
                                                                   (draw-losh (list circle5050 rect3020))
                                                                   (sleep-for-a-while 1)
                                                                   (clear-losh (list circle5050 rect3020))))

(check-expect (draw-and-clear-picture face) (and
                                             (draw-losh face)
                                             (sleep-for-a-while 1)
                                             (clear-losh face)))
(stop)


;(define (draw-and-clear-picture losh) #t) ; stub

(define (draw-and-clear-picture losh)
  (and
   (draw-losh losh)
   (sleep-for-a-while 1)
   (clear-losh losh)))


;Exercise 10.3.6 Develop the function move-picture. It consumes a number (delta) and a picture.
;It draws the picture, sleeps for a while, clears the picture and then produces a translated version.
;The result should be moved by delta pixels.

;; move-picture : picture : draw -> wait -> clear -> translate -> draw
(start 400 400)
(define delta 100)
;(check-expect (move-picture empty delta) #t)
;(check-expect (move-picture (cons circle5050 empty) delta) (and
;                                                            (draw-losh (cons circle5050 empty))
;                                                            (sleep-for-a-while 1)
;                                                            (clear-losh (cons circle5050 empty))
;                                                            (draw-losh (translate-losh (cons circle5050 empty) delta))))
;
;(check-expect (move-picture (list circle5050 rect3020) delta) (and
;                                                               (draw-losh (list circle5050 rect3020))
;                                                               (sleep-for-a-while 1)
;                                                               (clear-losh (list circle5050 rect3020))
;                                                               (draw-losh (translate-losh (list circle5050 rect3020) delta))))

(check-expect (move-picture face delta) (and
                                         (draw-losh face)
                                         (sleep-for-a-while 1)
                                         (clear-losh face)
                                         (draw-losh (translate-losh face delta))))
;(stop)

;(define (move-picture losh delta) #t) ; stub

(define (move-picture losh delta) (and
                                         (draw-losh losh)
                                         (sleep-for-a-while 1)
                                         (clear-losh losh)
                                         (draw-losh (translate-losh losh delta))))