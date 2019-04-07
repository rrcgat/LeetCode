(defun unique-paths-with-obstacles (obstacle-grid)
  (let* ((m (length (first obstacle-grid)))
         (dp (loop repeat m collect 0)))
    (setf (first dp) 1)
    (loop for row in obstacle-grid
       do (loop for j to (1- m)
             do (cond
                  ((plusp (nth j row)) ; row[j] == 1
                   (setf (nth j dp) 0))
                  ((plusp j)
                   (incf (nth j dp) (nth (1- j) dp)))))
       finally (print dp) (return (nth (1- m) dp)))))