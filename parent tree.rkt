;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |parent tree|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;; definition for a children tree
;; in ancestor tree, each node has a left and right parent
;; but in a child-tree each node has a list of parent nodes
;; parent : (make-parent listOfChildren name date eye-color)

;; listofChildren is either
;; - empty
;; - (cons parent-structure listofChildren)

;; these are parent and listOfChildren are mutually recursive

;; parent structure
(define-struct parent (loc name year eye-color))

(define gustav (make-parent '() 'Gustav 1988 'brown))

(define eva-fred-children (list gustav))
(define eva  (make-parent eva-fred-children 'Eva  1965 'blue))
(define fred (make-parent eva-fred-children 'Fred 1966 'pink))

(define adam (make-parent '() 'Adam 1950 'yellow))
(define dave (make-parent '() 'Dave 1955 'black))
(define carl-bettina-children (list adam dave eva))

(define carl    (make-parent carl-bettina-children 'Carl    1926 'green))
(define bettina (make-parent carl-bettina-children 'Bettina 1926 'green))

;; a parent is a structure
;;(define-struct parent (loc name year eye-color))

;; template for a parent
#;
(define (fn-for-parent p)
  (...
   (parent-loc p)
   (parent-name p)
   (parent-year p)
   (parent-eye-color p)))

;; whereas (parent-loc p) is a list of parents
;; which is one of
;; - empty
;; - list of parents
;; first loc is a parent-struct, hence fn-for-parent is to be used

;; template
#;
(define (fn-for-loc p)
  (cond
    [(empty? loc) ...]
    [else
     (...
      (fn-for-parent (first loc)) ; mutual recursion
      (fn-for-loc (rest loc)))]   ; self recursion
    ))

;; Develop blue-eyed-descendant? for the children tree

;; given a parent, returns true if any descendent is blur eyed
;; blue-eyed-descendant? : parent  -> boolean

;(define (blue-eyed-descendant? p) #f)              ; stub
(check-expect (blue-eyed-descendant? gustav)  #f)   ; basecase, list of children is empty
(check-expect (blue-eyed-descendant? bettina) #t)
(check-expect (blue-eyed-descendant? carl)    #t)
(check-expect (blue-eyed-descendant? adam)    #f)

(define (blue-eyed-descendant? p)
  (or
   (symbol=? (parent-eye-color p) 'blue)
   (process-loc (parent-loc p))  
   ))

;; helper function
;; process-loc : list of parents -> boolean

;(define (process-loc loc) #f)       ; stub
(check-expect (process-loc '()) #f)  ; basecase
(check-expect (process-loc (list gustav)) #f)
(check-expect (process-loc (list adam dave eva)) #t)

(define (process-loc loc)
  (cond
    [(empty? loc) #f]
    [else
     (or
      (blue-eyed-descendant? (first loc)) ; mutual recursion
      (process-loc (rest loc)))]          ; self recursion
    ))

;Exercise 15.1.2 Develop the function how-far-removed. It determines how far a blue-eyed
;descendant, if one exists, is removed from the given parent. If the given parent has blue eyes, the
;distance is 0; if eyes is not blue but some of the structure′s children′s eyes are, the distance is 1;
;and so on. If no descendant of the given parent has blue eyes, the function returns false when it
;is applied to the corresponding family tree

;; function how-far-removed : parent-struct -> number/boolean
;; returns the number of steps a blue eyed descendent is removed from the given parent
;; If the given parent has blue eyes, the sistance is 0
;; returns false if no blue eyed descendent exists

;(define (how-far-removed p) 0)      ; stub
(check-expect (how-far-removed eva)     0)
(check-expect (how-far-removed gustav) #f)
(check-expect (how-far-removed bettina) 1)


(define (how-far-removed p)
  (cond
    [(symbol=? (parent-eye-color p) 'blue) 0]
    [else  (check-loc (parent-loc p))]
    ))

(define (check-loc loc)
  (cond
    [(empty? loc) #f]
    [(boolean? (how-far-removed (first loc))) (check-loc (rest loc))] ; self recursion
    [else
     (add1
      (how-far-removed (first loc)))] ; mutual recursion
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 15.1.3 Develop the function count-descendants, which consumes a parent and produces
;the number of descendants

;; function count-descendents: parent -> number
;; returns the total number of descendents for the given parent 

;(define (count-descendents p) 0)       ; stub
(check-expect (count-descendents gustav) 0)
(check-expect (count-descendents eva)    1)
(check-expect (count-descendents carl)   4)

(define (count-descendents p)
  (cond
    [(empty? (parent-loc p)) 0]
    [else
     (count-children (parent-loc p))]))

;; func count-children : listOfChildren -> number
;; loc is one of
;; - empty
;; - (cons parent-struct (rest loc))

;(define (count-children loc) 0)         ; stub
(check-expect (count-children empty) 0)  ; basecase
(check-expect (count-children (list gustav)) 1)
(check-expect (count-children (list adam dave eva)) 4)
(check-expect (count-children (list bettina)) 5)

;; template used self recursive
(define (count-children loc)
  (cond
    [(empty? loc) 0]
    [else
     (+
      1
      (count-descendents (first loc))     ; mutual recursion
      (count-children (rest loc)))]       ; self recursion
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exercise 15.1.4 Develop the function eye-colors, which consumes a parent and produces a list of
;all eye colors in the tree. An eye color may occur more than once in the list.


;; auxilary func get-children-eyecolor : listOfChildren -> listOfEyeColors
;; returns a list of eye colors for the descendents of the given parent

;(define (get-children-eyecolor loc)  '())       ; stub
(check-expect (get-children-eyecolor '())                  '())
(check-expect (get-children-eyecolor (list gustav))        '(brown))
(check-expect (get-children-eyecolor (list adam dave eva)) (list 'yellow 'black 'blue 'brown))
(check-expect (get-children-eyecolor (list bettina))       (list 'green 'yellow 'black 'blue 'brown))

;; template to be used  : self-recursion + mutual-recursion
;; as loc is one of
;; - empty
;; - (cons parent-struct (list of children)

(define (get-children-eyecolor loc)
  (cond
    [(empty? loc) '()]
    [else
     (append
      (eye-colors (first loc))
      (get-children-eyecolor (rest loc))
      )]
    ))



;; function : eye-colors : parent-Struct -> listOfEyeColors
;; parent-structure : make-parent listOfChildren name year eye-color)

;(define (eye-colors p) (list 'blue)) ; stub
(check-expect (eye-colors gustav)  (list 'brown))
(check-expect (eye-colors bettina) (list 'green 'yellow 'black 'blue 'brown))

;; template used : structure

(define (eye-colors p) 
  (append
   (list (parent-eye-color p))
   (get-children-eyecolor (parent-loc p))
   ))