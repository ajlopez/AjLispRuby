(define append (x y) (if (nil? x) y (cons (first x) (append (rest x) y))))
