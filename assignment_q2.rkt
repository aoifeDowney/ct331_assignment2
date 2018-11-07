#lang racket

(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

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

;Part E
(define (count_instances_tr lst item)
  (calculate_tr item lst 0))
(define (calculate_tr item lst total)
  (cond
    [(empty? lst) total]
    [(equal? item (car lst)) (calculate_tr item (cdr lst) (+ 1 total))]
    [else (calculate_tr item (cdr lst) total)]))

;Part F
(define (count_instances_deep item lst)
  (cond
    [(null? lst) 0]
    [(equal? (car lst) item) (+ 1 (count_instances_deep item (cdr lst)))]
    [(list? (car lst)) (+ (count_instances_deep item (car lst)) (count_instances_deep item (cdr lst)))]
    [else (count_instances_deep item (cdr lst))]))        



;displaying the answers to the questions
;Part A
(display "The ins_beg function:\n")
(ins_beg 'a '(b c d))

;Part B
(display "The ins_end function:\n")
(ins_end '(a b) '(b c d))

;Part C
(display "The count_top_level function:\n")
(count_top_level '(1 2 3 (4 5)))

;Part D
(display "The count_instances function:\n")
(count_instances '(1 3 3 3 4)3)

;Part E
(display "The count_instances_tr function:\n")
(count_instances_tr '(1 3 3 3 4)3)

;Part F
(display "The count_instances_deep function:\n")
(count_instances_deep '3 '((1 2 3) 1 (3 1) 3 (2 1 3)))



