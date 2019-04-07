(defun rotate (matrix)
  (let ((n (length matrix)))
    (multiple-value-bind (q r) (floor n 2)
      (if (zerop r)
          (decf q))
      (loop for i to q
         do (loop for j to (- q r)
               do (let ((a i)
                        (b j))
                    (loop repeat 3
                       do (rotatef (nth b (nth a matrix))
                                   (nth a (nth (- n b 1) matrix)))
                         (rotatef a b)
                         (setf a (- n a 1)))))))))