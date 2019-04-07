(defun spiral-order (matrix)
  (let ((m (1- (length matrix)))
        (n (1- (length (first matrix))))
        (x 0)
        (y 0))
    (loop while (and (<= x m)
                     (<= y n))
       append (append (loop for i from y to n
                         collect (nth i (nth x matrix)))
                      (loop for i from (1+ x) to m
                         collect (nth n (nth i matrix)))
                      (loop for i from (decf n) downto y
                         when (> m x)
                         collect (nth i (nth m matrix)))
                      (loop for i from (decf m) above x
                         collect (nth y (nth i matrix))))
       do (incf x)
         (incf y))))