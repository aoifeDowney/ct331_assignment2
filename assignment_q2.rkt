#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)

;Part A
(define (ins_beg el lst)
  (display "Hello, I'm ins_beg!\n")
  (cons el lst))


;Part B
(define (ins_end el lst)
  (append lst(list el)))

;Part C
(define (count_top_level lst)
  (if (null? lst)
      0
      (+ 1 (count_top_level (cdr lst)))))

;Part D
(define (count_instances lst item)
    (cond ((null? lst) 0)
          ((= (car lst) item) (+ 1 (count_instances (cdr lst) item)))
          (else (count_instances (cdr lst) item))))


;displaying the answers to the questions
(display "The ins_beg function:\n")
(ins_beg 'a '(b c d))

(display "The ins_end function:\n")
(ins_end '(a b) '(b c d))

(display "The count_top_level function:\n")
(count_top_level '(1 2 3 (4 5)))

