(defun maximal-rectangle (matrix)
  (let* ((size (length (first matrix)))
         (heights (loop repeat (1+ size) collect 0)))
    (loop for row in matrix
       with res = 0
       do (loop for i to size
             do (if (string= "1" (nth i row))
                    (incf (nth i heights))
                    (setf (nth i heights) 0)))
         (loop for i to size
            with stack = `(,size)
            with h
            with w
            do (loop while (< (nth i heights)
                              (nth (first stack) heights))
                  do (setf h (nth (pop stack) heights))
                    (setf w (- i 1 (if (= (first stack) size)
                                       -1
                                       (first stack))))
                    (setf res (max res (* h w))))
              (push i stack))
       finally (return res))))