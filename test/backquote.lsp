(definem backquote (lst) (cond
                ((nil? lst) nil)
                ((atom? lst) (list 'quote lst))
                ((= (first lst) 'unquote) (first (rest lst)))
                ((and (list? (first lst)) (= (first (first lst)) 'unquote-slice)) (list 'append (first (rest (first lst))) (list 'backquote (rest lst))))
                (true (list 'cons (list 'backquote (first lst)) (list 'backquote (rest lst))))
                ))