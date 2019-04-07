(defun set-zeroes (matrix)
  (loop for rc in (loop for i below (length matrix)
                     append (loop for j below (length (first matrix))
                               if (zerop (nth j (nth i matrix)))
                               collect `(,i ,j)))
     do (loop for j below (length (first matrix))
           do (setf (nth j (nth (first rc) matrix)) 0))
       (loop for i below (length matrix)
          do (setf (nth (second rc) (nth i matrix)) 0))))