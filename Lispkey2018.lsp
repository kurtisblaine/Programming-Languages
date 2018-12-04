; Lisp Functions **2018**
;
; TEST CASE LISTS
(setq list1 `(1 2 3 4 5))
(setq list2 `((1 2) 3 (2 6 (1  (((45)))9)) 3 ))
(setq list3 `())
(setq list4 `((Allen 1 24)(Lisa 2 26)(Beth 3 30)))
;
;****** large_atom ***************
; returns the largest value greater than 0
; in L (at any level) bigger than n)
; version does not use higher order lisp functions like max
; UGLY :) 
;*******
(defun large_atom (L)
   (cond
       (( null l) 0)
	   ((atom (car L)) ; is the car an atom
	       (cond ; is it larger the the largest in the cdr?
		     ((> (car L) (large_atom (cdr L))) (car L)) ; if so the return the car
			 (t(large_atom (cdr L))) ; if not then return the largest in the cdr
			)
	    )
       (t  (cond ; the car is not an atom  find the largest of the car and the cdr
	         ((> (large_atom (car L)) (large_atom (cdr L))) (large_atom (car L)))
             (t(large_atom (cdr L)))
            )
        )			
    )  
)
;
;****** Doubleodd ***************
;doubleodd: return a list where all the odd numbers have been doubled.
;; Example: (doubleodd ‘(1 2 3 4 5)) = (2 2 6 4 10)
;; Assume single level list

(defun doubleodd (dlist)
  (cond ((null dlist) nil)
        ((oddp (car dlist)) (cons (* 2 (car dlist)) (doubleodd (cdr dlist))))
        (t (cons (car dlist) (doubleodd (cdr dlist))))
  )
)	
;******** evenprod ***************
;returns the product of even numbers in a 1 level list
;if none are found then it returns 1
;*********************************
(defun evenprod (L)
  (cond
    ((null L) 1)
    ((evenp (car L)) (* (car L) (evenprod (cdr L))))
    ( t (evenprod (cdr L)))
  )
)
;
;==============  other Examples =========================
;****** biggerthan ***************
; returns a list of items in L bigger than n)
;*********************************
(defun biggerthan (n L)
  (cond
    ((null L) nil)
    ((< n (car L)) (cons (car L) (biggerthan n (cdr L))))
    ( t (biggerthan n (cdr L)))
  )
)



;****** find_empl_age ***************
; Find age of employee with given id
; list format (name id age)
;************************************ 
(defun findname (id L)
  (cond
    ((null L) nil)
	((equal id (cadar L)) (caar L)) ;; if id then return the name
	(t (findname id (cdr L)))     ;; if not look at rest of list
  )	
)	

;;================== Alternates =====================
;; https://www.rosettacode.org/wiki/Greatest_element_of_a_list
(defun large_atom2 (L)
    ;(apply #'max (atomify L))
	(reduce #'max (atomify L))
  )
 (defun atomify (L)
    (cond ((null L) nil )
      ((atom (car L)) (cons (car L) (atomify (cdr L))))
      (t(append (atomify (car L)) (atomify (cdr L))))
    )
  )
;;=============================================
(defun large_atom3(L)

	(
	cond
	((null L) 0) 
	
	((and(not(atom(car L)))(>=(large_atom(car L))(large_atom(cdr L)))) (large_atom(car L)))
	((and(not(atom(car L)))(<(large_atom(car L))(large_atom(cdr L))))  (large_atom(cdr L)))
	
	((=(length L)1) (car L))
	
	((>=(car L)(large_atom(cdr L))) (car L))
	((<(car L)(large_atom(cdr L))) (large_atom(cdr L)))
	)

)
;;==============================================
(defun large_atom4 (list)
	(if (null (car list))
		`0
		(if (and (null (cdr list)) (not (listp (car list))) ) ; if there is not second item and the first item is not a list aka if ther is one item (1)
			(car list) ; return first item
			(if (listp (car list)) ; else => if first item is a list
				(let ; fist item is a list
					(
						(x (large_atom (car list))) ; x = largest num in first item
						(y ; y = `() or largest item in cdr / rest of the list
							(if (null (cdr list)) 
								'() 
								(large_atom (cdr list)) 
							)
						)
					) 
					(if (null y) ; if y = nil return x
						x 
						(if (> x y) ; if return x or why which ever is biggest
							x 
							y
						)
					)
				)
				(let ; else first item is not a list
					((z (large_atom (cdr list)))) ; z = largest number that is not the fist item
					(if (> (car list) z) ; return largtes value first item or largest num in the rest of the list
						(car list) 
						z
					) 
				) 
			) 
		) 
	)
)


















 