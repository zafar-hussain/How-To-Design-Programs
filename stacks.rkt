;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname stacks) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;A stack is a data structure of ordered entries such that
;entries can be inserted and removed at only one end

;A stack is a Last-In/First-Out data structure. Entries are taken
;out of the stack in the reverse order of their insertion.

; Stack only allows push, pop, top, and peek opertrions
; size, and isEmpty return the status of stack

;// TYPEDEFS
;; (make-stack x next-stack)
;//
;// CONSTRUCTOR
(define-struct stack [Item next])
;; examples
(define s0 (make-stack ['1 empty])) ; singleton stack, points to empty
(define s1 (make-stack ['2    s0])) ; stack points to s0
;// VOID FUNCTIONS TO INSERT AND REMOVE ITEMS:
;// pop( ): Pop is a void function that pops (removes) the top item of the stack
;// push(const Item& entry): Pushes the item onto the top of the stack
;//
;// FUNCTIONS TO EXAMINE THE STACK AND ITS ITEMS:
;// empty( ) const: Returns true if the stack is empty (otherwise returns false)
;// size( ) const: Returns the number of items in the stack
;// top( ): Returns a reference to the top item on the stack (without removing it)
;//
;// VALUE SEMANTICS:
;// Assignments and the copy constructor may be used with stack<Item> objects.