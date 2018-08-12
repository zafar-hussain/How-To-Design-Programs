#lang racket
(require test-engine/racket-tests)

;; template
#;
(define (generative-recursive-fun problem)
  (cond
    [(trivially-solvable? problem) (determine-solution problem)]
    [else
      (combine-solutions
	        problem
	        (generative-recursive-fun (generate-problem problem))
        )
    ]
))


;;; Exercise 26.2.1.   Define determine-solution and combine-solutions so that the function generative-recursive-fun computes the length of its input. 

;; length : lox -> length of lox
(check-expect (length empty) 0)         ; basecase
(check-expect (length (list 22)) 1)     ; singular list
(check-expect (length (list 1 2 3)) 3)

;(define (length  lox) 0)                ; stub
(define (length problem)
  (cond
    [(empty? problem) 0]                ; determine-solution
    [else
      (     +                           ; combine-solutions
	        1                   
	        (length (rest problem))
      )
    ]
))




(test)

