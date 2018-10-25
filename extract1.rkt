;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname extract1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 10.2.5 Define the function extract>1, which consumes an inventory and creates an
;inventory from those records whose prices are above one dollar.

;; item : make-inventory [name  value]  
;;                        symbol number
;; an item within the inventory

(define-struct item [name value])
;; Examples
(define item0 (make-item 'zero      0))
(define item1 (make-item 'apple   0.5))
(define item2 (make-item 'mangoes 3))

;; template
#;
(define (fn-for-item i)
  (...
   ... (item-name  i)
   ... (item-value i)
   ))

;; inventory : listOfItems -> loi
;; Examples
(define i0 empty)
(define i1 (cons item1 empty))
(define i2 (list item1 item2))

;; template
;; - is one of : empty, listOfitems
;; -- each member of the list is an item
;; -- item is a structure (make-item [name value]) - 'symbol number
#;
(define (fn-for-inventory loi)
  (cond
    [(empty? loi) ...]
    [else
     (...
      ... (fn-for-item (first loi))       ; first loi is an item
      ... (fn-for-inventory (rest loi)))  ; rest loi is an inventory
     ])
  )

;; extract>1 : inventory -> inventory
;; returns an inventory whose item's value is less than 1 dollar
;; Examples
;(check-expect (inventory>1 i0) empty)                      ; basecase
;(check-expect (inventory>1 i1) empty)
;(check-expect (inventory>1 i2) (cons item2 empty))
;(check-expect (inventory>1 (list item2)) (list item2))
;(check-expect (inventory>1 (list item0 item2 item2 item1 item2)) (list item2 item2 item2)) 

;(define (inventory>1 inventory) empty) ; stub

(define (inventory>1 loi)
  (cond
    [(empty? loi) empty]
    [else
     (if
      (> (item-value (first loi)) 1)                          ; first loi is an item
      (cons (first loi) (inventory>1 (rest loi)))             ; a list needs to be returned of items of value > 1
      (inventory>1 (rest loi)))
      ])
)

;Exercise 10.2.7 Develop the function raise-prices, which consumes an inventory and produces
;an inventory in which all prices are raised by 5%.

;; raise-prices : inventory -> inventory
;; raises the values of the items of the given inventory by 5% and returns the new inventory
;; Examples
;(check-expect (raise-prices i0) empty)                      ; basecase
;(check-expect (inventory>1 i0) empty)                      ; basecase
(check-expect (inventory>1 i1) (cons (make-item (item-name item1) (+ (item-value item1) (* (item-value item1) 0.05))) empty))

;(define (raise-prices loi) empty) ; stub

(define (raise-prices loi)
  (cond
    [(empty? loi) empty]
    [else
     (cons
      (make-item (item-name (first loi)) (+ (item-value (first loi)) (* (item-value (first loi)) 0.05)))       ; first loi is an item
      (raise-prices (rest loi)))  ; rest loi is an inventory
     ])
  )