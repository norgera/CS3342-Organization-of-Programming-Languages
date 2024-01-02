#lang racket

(define (count-inversions perm) ; takes in a list of premutations that we want to count inversions for.

  ; nested letrec expressions to define two mutually recursive functions:
  ; passes the input perm to split-and-count-inversions, which in turn calls merge-and-count-inversions.
  (letrec ((merge-and-count-inversions
            (lambda (left right)

              ; takes in two sorted lists left and right and returns a list where the elements are sorted
              ; in ascending order and the second element is the number of inversions in the two lists.
              (cond ((null? left) (cons right 0))
                    ((null? right) (cons left 0))
                    ((< (car left) (car right))
                     (let ((result (merge-and-count-inversions (cdr left) right)))
                       (cons (cons (car left) (car result)) (cdr result))))
                    (else
                     (let ((result (merge-and-count-inversions left (cdr right))))
                       (cons (cons (car right) (car result)) (+ (cdr result) (length left)))))))))

    ; takes a list and recursively splits it into two halves until each half has only one or zero elements.
    ; It then calls merge-and-count-inversions on the two halves and adds the number of inversions between
    ; the two halves to the sum of the number of inversions in each half.
    (letrec ((split-and-count-inversions
              (lambda (lst)

                
                (cond ((or (null? lst) (null? (cdr lst))) (cons lst 0))
                      (else
                       (let* ((mid (quotient (length lst) 2))
                              (left (take lst mid))
                              (right (drop lst mid))
                              (left-and-count (split-and-count-inversions left))
                              (right-and-count (split-and-count-inversions right))
                              (merged-and-counted (merge-and-count-inversions (car left-and-count) (car right-and-count))))
                         (cons (car merged-and-counted) (+ (cdr left-and-count) (cdr right-and-count) (cdr merged-and-counted)))))))))
      (cdr (split-and-count-inversions perm)))))
