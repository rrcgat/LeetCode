(defun merge-k-lists (lists)
  (sort (apply #'append lists) #'<))
