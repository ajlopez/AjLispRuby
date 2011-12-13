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

