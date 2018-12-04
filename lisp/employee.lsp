; test data
(setq EMPL '((1 Bill 30) (2 Marry 27) (3 Pam 35)))

(defun FINDNAME (L N)
	(cond
		((NULL L) nil)
		((= (caar L) N) (cadar L))
		(t (FINDNAME (cdr L) N))
	)
)