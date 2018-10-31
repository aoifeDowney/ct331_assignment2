#lang racket
;A cons pair of two numbers
(cons 1 2)

;A list of 3 numbers, using only the cons function
(cons 1 (list 2 3))

;A list containing a string, a number and a nested list of three numbers
;using only the cons function
(cons "cons"(cons 1 (cons 2(cons 3 4))))

;A list containing a string, a number and a nested list of three numbers
;using only the list function
(list "list" 1 (list 2 3 4))

;A list containing a string, a number and a nested list of three numbers
;using only the append function
(append ' ("append") ' (1) ' ((2 3 4)))