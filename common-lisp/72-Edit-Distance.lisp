(defun min-distance (word1 word2)
  (let* ((m (length word1))
         (n (length word2))
         (table (loop repeat (1+ n)
                   collect (loop repeat (1+ m) collect 0))))
    (loop for i to m
       do (setf (nth i (first table)) i))
    (loop for i to n
       do (setf (first (nth i table)) i))
    (loop for i from 1 to n
       do (loop for j from 1 to m
             do (setf (nth j (nth i table))
                      (if (string= (elt word1 (1- j))
                                   (elt word2 (1- i)))
                          (nth (1- j) (nth (1- i) table))
                          (1+ (min (nth (1- j) (nth (1- i) table))
                                   (nth (1- j) (nth i table))
                                   (nth j (nth (1- i) table)))))))
       finally (return (nth m (nth n table))))))