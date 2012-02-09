(define definem (mlambda x (list 'define (first x) (cons 'mlambda (rest x)))))

(define append (x y) (if (nil? x) y (cons (first x) (append (rest x) y))))

(definem cond lst (if (nil? lst) false (list 'if (first (first lst)) (cons 'do (rest (first lst))) (cons 'cond (rest lst)))))

(definem and lst (if (nil? lst) true (list 'cond (list (first lst) (cons 'and (rest lst))) '(true false))))

(define mapcond (fn lst)
	(if (nil? lst)
		nil
		(if (fn (first lst))
			(cons 
				(first lst) 
				(mapcond fn (rest lst))
			)
			(mapcond fn (rest lst))
		)
	)
)

(define mapfirst (fn lst)
  (if (nil? lst)
    nil
    (cons
      (fn (first lst))
      (mapfirst fn (rest lst))
    )
  )
)

(definem backquote (lst) (cond
                ((nil? lst) nil)
                ((atom? lst) (list 'quote lst))
                ((= (first lst) 'unquote) (first (rest lst)))
                ((and (list? (first lst)) (= (first (first lst)) 'unquote-slice)) (list 'append (first (rest (first lst))) (list 'backquote (rest lst))))
                (true (list 'cons (list 'backquote (first lst)) (list 'backquote (rest lst))))
                ))

                