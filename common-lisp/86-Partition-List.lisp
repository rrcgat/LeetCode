(defun partition (head x)
  (loop for n in head
     with small
     with large
     do (if (< n x)
            (push n small)
            (push n large))
     finally (return (append (reverse small)
                             (reverse large)))))