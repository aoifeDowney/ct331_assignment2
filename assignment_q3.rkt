#lang racket

;A Binary Search Tree
(define bst '(((() 1 ()) 8 (() 12 ())) 19 ((() 25 ()) 30 (() 20 ()))))

;List of items that need to be sorted
(define items_to_sort '(13 49 19 12 5 20 21))

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
(define (sort tree)
  (if (null? tree) '()
      (append (sort (left tree))
              (list (value tree))
              (sort (right tree)))))

;Part B
(define (search item tree)
  (cond
    ((null? tree) #f)
    ((= item (cadr tree)) #t)
    ((< item (cadr tree)) (search item (left tree)))
    (else (search item (right tree)))))


;Part C
(define (insert item tree)
  (cond ((null? tree) (list '() item '()))
        ((equal? item (cadr tree)) tree)
        ((< item (cadr tree))
        (list ( insert item (left tree)) (cadr tree) (right tree)))
        (else (list (left tree) (cadr tree) (insert item (right tree))))))



;D 
(define (insert_list items tree)
  (if (null? items) tree
      (insert_list (cdr items) (insert (car items) tree))))

(define (higher_order_insert items tree left_side)
  (if (null? items) tree
      (higher_order_insert (cdr items) (higher_order (car items) tree left_side) left_side)))



;E
(define (tree_sort_algorithm items)
  (sort (insert_list items '())))

;F
(define (higher_order_sort items function)
 (sort (higher_order_insert items '() function)))

(define (higher_order item tree left_side)
  (cond ((null? tree) (list '() item '()))
        ((equal? item (cadr tree)) tree)
        ((left_side item (cadr tree))
         (list (higher_order item (left tree) left_side) (cadr tree) (right tree)))
        (else (list (left tree) (cadr tree) (higher_order item (right tree) left_side)))))

;Ascending order based on the last digit
;didn't figure out how to do this part

;Test
;Part A
(display "The tree in sorted order:\n")
(sort bst)

;Part B
(display "Searching the tree\n")
(search 22 bst) ;should throw #f
(search 8 bst) ;should throw #t

;Part C
(display "Inputing an item into the tree\n")
(insert 16 bst)

;Part D
(display "Inputing a list of items into the tree\n")
(insert_list '( 16 4 9 10)bst)

;Part E
(display "Implenting a tree-sort algorithm\n")
(tree_sort_algorithm items_to_sort)


;Part F
(display "Higher order: Ascending\n")
(higher_order_sort items_to_sort <)

(display "Higher order: Descending\n")
(higher_order_sort items_to_sort >)



