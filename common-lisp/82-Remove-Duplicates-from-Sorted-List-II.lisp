(defun my-delete-duplicates (head)
  (loop for i below (length head)
     for val in head
     with duplicate
     with res
     do (if (or (equal val duplicate)
                (and (< i (length head))
                     (= val (nth (1+ i) head))))
            (setf duplicate val)
            (push val res))
     finally (return (reverse res))))