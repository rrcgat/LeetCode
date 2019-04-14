(defun my-delete-duplicates (head)
  (loop for e in head
     with prev
     with res
     do (unless (equal prev e)
          (push e res)
          (setf prev e))
     finally (return (reverse res))))