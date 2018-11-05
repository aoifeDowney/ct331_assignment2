#lang racket

;A Binary Search Tree
(define bst '(2 (1 ()()) (3) () ()))

;Retruns value of node
(define (value node)
  (if (null? node) '()
      (car node)))

;Returns the left subtree of node
(define (left node)
  (if (null? node) '()
      (cadr node)))

;Returns the right subtree of node
(define (right node)
  (if (null? node) '()
      (caddr node)))

;Part A
(define (sortTree tree)
  (if (empty? tree)
      empty
      (append (sortTree (right tree))
              (cons (value tree)
                    (sortTree (left tree))))))

;Test
(display "The tree:\n")
(left bst)
(sortTree bst)

