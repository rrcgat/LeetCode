(let ((alist (pairlis '(0 1) (list nil '("()")))))
  (defun generate-parenthesis (n)
    (labels ((gen (n)
               (cond
                 ((assoc n alist)
                  (cdr (assoc n alist)))
                 (t
                  (let ((res nil))
                    (loop for i from 1 below (1- n) do
                         (loop for a in (gen i) do
                              (loop for b in (gen (- n 1 i)) do
                                   (push (concatenate 'string "(" a ")" b)
                                         res))))
                    (loop for x in (gen (1- n)) do
                         (push (concatenate 'string "(" x ")") res)
                         (push (concatenate 'string "()" x) res))
                    (push (cons n (remove-duplicates res :test #'string=))
                          alist)
                    (cdr (assoc n alist)))))))
      (gen n))))
