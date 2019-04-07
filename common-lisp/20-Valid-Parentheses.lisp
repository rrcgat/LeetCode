(defun is-valid (s)
  (let ((res nil)
        (pair (pairlis '(#\) #\] #\}) '(#\( #\[ #\{))))
    (loop for c across s do
         (if (and res
                  (eql (first res) (cdr (assoc c pair))))
             (pop res)
             (push c res)))
    (not res)))