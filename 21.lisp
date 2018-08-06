(defun merge-two-lists (l1 l2)
  (sort (append l1 l2) #'<))
