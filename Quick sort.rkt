#lang racket
(require test-engine/racket-tests)


;;; In the case of qsort, the intermediate goal is to divide the list of numbers into two lists: one that contains all the items that are strictly smaller than the first item, and another one with all those items that are strictly larger than the first item. Then the two smaller lists are sorted using the same procedure. Once the two lists are sorted, we simply juxtapose the pieces. Owing to its special role, the first item on the list is often called the pivot item.



(test)

