#lang racket
(require test-engine/racket-tests)

(define-struct parent (loc name date eyes))
;; parent is one of:
;; - false
;; - (make-parent listOfChildren string date string)

(define gustav (make-parent empty "Gustav" 1988 "brown"))
(define eva&fred-Children (list gustav))

(define eva (make-parent eva&fred-Children "Eva" 1965 "blue"))
(define fred (make-parent eva&fred-Children "Fred" 1966 "pink"))

(define adam (make-parent empty "Adam" 1950 "yellow"))
(define dave (make-parent empty "Dave" 1955 "black"))
(define carl&bettina-children (list adam dave))

(define carl (make-parent carl&bettina-children "Carl" 1926 "green"))


(test)

