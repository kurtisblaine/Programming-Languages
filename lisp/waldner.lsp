;Kurt Waldner- Programming Languages
;Commands To Run:
;	(load "C:/Users/giggi/Desktop/Programming_Languages/lisp/lispFunctionsTest.lsp")

;******************************LISP FUNCTIONS****************************************
(defun large_atom (LIST)
	(cond ((numberp LIST) LIST)
		  (t (large_atom (third LIST)))))
		  
(defun doubleodd(L)
	(cond((null L) nil)
		((oddp(car L))(cons(car L)(doubleodd(cdr L))))
		(t(doubleodd(cdr L)))))
		
(defun multiply(L)
  (if (null L)
      nil
    (cons (multiply (first L)) (multiply (rest L)))))
	
(defun multiply-by-two (number)       
 (* 2 number))
	   
(defun evenprod(L)
	(cond((null L) nil)
		((evenp(car L))(cons(car L)(evenprod(cdr L))))
		(t(evenprod(cdr L)))))
;******************************LISP FUNCTIONS****************************************

;******************************LISP TEST****************************************
;**************************************************************************************
(format t "~C~C****large_atom test fixture****~C~C" #\return #\linefeed #\return #\linefeed)
(format t "((1 2 3) 7 8))~C~C" #\return #\linefeed);original list
(write( large_atom '((1 2 3) 7 8)));function call
(format t "~C~%" #\return);newline
(format t "((1 2 3) 7 8 8 1 2 3 4 5 6 7) )~C~C" #\return #\linefeed);original list
(write( large_atom '((1 2 3) 7 8 8 1 2 3 4 5 6 7) ));function call
(format t "~C~%" #\return);newline
(format t "((1 1) 1 (1 1 1)) )~C~C" #\return #\linefeed);original list
(write( large_atom '((1 1) 1 (1 1 1)) ));function call
(format t "~C~%" #\return);newline
;**************************************************************************************	    
;**************************************************************************************	  
(print "****doubleodd test fixture****")
(format t "~C~%" #\return)
(format t "(1 2 3 4 5)~C~C" #\return #\linefeed);original list
(setq LIST (doubleodd '(1 2 3 4 5)) );function call
(write LIST)
(format t "~C~%" #\return)
(format t "(1 3 5 7 9)~C~C" #\return #\linefeed);original list
(write( doubleodd '(1 3 5 7 9)) );function call
(format t "~C~%" #\return)
(format t "(6 8 10)~C~C" #\return #\linefeed);original list
(write( doubleodd '(6 8 10)) );function call
(format t "~C~%" #\return)
;**************************************************************************************
(print "****evenprod test fixture****")
(format t "~C~%" #\return)
(format t "(1 2 3 4 5)~C~C" #\return #\linefeed);original list
(write(evenprod '(1 2 3 4 5) ));function call
(format t "~C~%" #\return)
(format t "(1 3 5 7 9)~C~C" #\return #\linefeed);original list
(write( evenprod '(1 3 5 7 9) ));function call
(format t "~C~%" #\return)
(format t "(2 4 6)~C~C" #\return #\linefeed);original list
(write( evenprod '( 2 4 6 ) ));function call
(format t "~C~%" #\return)
;**************************************************************************************
;******************************LISP TEST****************************************