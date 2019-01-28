;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname list-of-lines) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;Exercise 27.2.1 Determine what the list-of-lines representation for empty, (list 'NL), and (list
;                                                                                            'NL 'NL) should be. Why are these examples important test cases?
;
;Hint: Keep in mind that an empty line at the end is ignored.
;Here are the contract, purpose statement, and header:

;;file→ list-of-lines: file → (listof (listof symbols))
;; to convert a file into a list of lines

;(define (file→list-of-lines afile) '())    ; stub
(check-expect (file->list-Of-Lines (list 'how 'are 'you 'NL
                                        'doing '? 'NL
                                        'any 'progress '?))
              (list
               (list 'how 'are 'you)
               (list 'doing '?)
               (list 'any 'progress '?)))

(define (file->list-Of-Lines aFile)
  (cond
    [(empty? aFile) '()]
    [else
     (cons
      (append (list (first aFile)) (file->list-Of-Lines (rest aFile)))
      (file->list-Of-Lines (rest aFile)))]))