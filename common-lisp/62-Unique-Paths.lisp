(defun unique-paths (m n)
  (let ((dp (loop repeat n
               collect (loop repeat m collect 1)))
        (m (1- m))
        (n (1- n)))
    (loop for i from 1 to n
       do (loop for j from 1 to m
             do (let ((a (if (>= (1- i) 0)
                             (nth j (nth (1- i) dp))
                             0))
                      (b (if (>= (1- j) 0)
                             (nth (1- j) (nth i dp))
                             0)))
                  (setf (nth j (nth i dp)) ; dp[i][j]
                        (+ a b))))
       finally (return (nth m (nth n dp))))))