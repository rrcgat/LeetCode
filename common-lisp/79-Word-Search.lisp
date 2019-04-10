(defun exist (board word)
  (loop for i below (length board)
     do (loop for j below (length (first board))
           do (if (dfs i j board word)
                  (return-from exist t)))
     finally (return nil)))


(defun dfs (i j board word)
  (cond
    ((string= word "")
     t)
    ((or (minusp i)
         (minusp j)
         (= i (length board))
         (= j (length (first board)))
         (not (string= (nth j (nth i board)) (elt word 0))))
     nil)
    (t
     (let ((tmp (nth j (nth i board)))
           (word (subseq word 1))
           (exist))
       (setf (nth j (nth i board)) ""
             exist (or (dfs (1+ i) j board word)
                       (dfs (1- i) j board word)
                       (dfs i (1+ j) board word)
                       (dfs i (1- j) board word))
             (nth j (nth i board)) tmp)
       exist))))