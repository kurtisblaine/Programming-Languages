;******************************LISP FUNCTIONS****************************************
(defun large_atom (LIST)
	(cond ((numberp LIST) LIST)
		  (t (large_atom (third LIST)))))
;******************************LISP FUNCTIONS****************************************