(defun generate-matrix (n)
  (let ((x 0)
        (y 0)
        (index 0)
        (matrix (loop repeat n
                   collect (loop repeat n collect 0)))
        (n (1- n)))
    (loop while (and (<= x n)
                     (<= y n))
       do
         (loop for i from y to n
            do (setf (nth i (nth x matrix)) (incf index)))
         (loop for i from (1+ x) to n
            do (setf (nth n (nth i matrix)) (incf index)))
         (loop for i from (1- n) downto y
            when (> n x)
            do (setf (nth i (nth n matrix)) (incf index)))
         (loop for i from (decf n) above x
            do (setf (nth y (nth i matrix)) (incf index)))
         (incf x)
         (incf y)
       finally (return matrix))))