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

;(define (ins_beg el lst)
  ;(display "Hello, I'm ins_beg!\n"))

;Part A
(define (ins_beg el lst)
  (cons el lst))

;Part B
(define (ins_end el lst)
  (append lst(list el)))

;Part C
(define (count_top_level el lst)
  (length (flatten lst)))