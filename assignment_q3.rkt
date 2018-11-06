#lang racket

;A Binary Search Tree
(define bst '(2 (1 ()()) (3) () ()))
;(define tree '(((() 3 ()) 8 (() 11 ())) 19 ((() 25 ()) 29 (() 52 ()))))

;Retruns value of node
(define (value node)
  (if (null? node) '()
      (cadr node)))

;Returns the left subtree of node
(define (left node)
  (if (null? node) '()
      (car node)))

;Returns the right subtree of node
(define (right node)
  (if (null? node) '()
      (caddr node)))

;Part A
;(define (sort tree)
 ; (if (null? tree) '()
  ;    (append (sort (left tree))
   ;           (list (value tree))
    ;          (sort (right tree)))))


;(define (tree-sort tree)
 ; (if (null? tree)
  ;    '()
   ;   (append (tree-sort (left tree))
    ;          (list (value tree))
     ;         (tree-sort (right tree)))))

(define (sort bst);sort left then sort right
 (begin(cond [(not (empty?(left bst))) (sort (left bst))])
   (printf "~a " (value bst));
   (cond [(not (empty?(right bst))) (sort (right bst))])))


;Test
(display "The tree:\n")
(left bst)
(sort bst)

