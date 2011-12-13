(define mapfirst (fn lst)
  (if (nil? lst)
    nil
    (cons
      (fn (first lst))
      (mapfirst fn (rest lst))
    )
  )
)

