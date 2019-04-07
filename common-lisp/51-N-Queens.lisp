(defun solve-n-queens (n)
  (let ((solutions))
    (loop for col below n
       do (loop for item in (find-solution 0 n `(,col))
             do  (let ((solution (loop repeat n
                                    collect (loop repeat n
                                               collect "."))))
                   (loop for col in item
                      for row below (1- n)
                      do (setf (nth col (nth row solution)) "Q")
                      finally (push solution solutions))))
       finally (return solutions))))

(defun next-positions (n &optional placed)
  "对已顺序放置 placed 的 n 皇后问题，返回下一行可能的放置位置"
  (set-difference (loop for i below n collect i)
                  (loop for col in placed
                     for i from (length placed) downto 1
                     append `(,(- col i) ,col ,(+ col i)))))

(defun find-solution (row n &optional placed)
  "placed 是已放置的皇后，第 i 个元素表示 i 行 placed[i] 列放置了皇后，
   row 是当前行，placed[row] == placed[-1]。
   对于前面行已放置元素为 placed（长度为 row+1）的 n 皇后问题，找出所有解"
  (cond
    ((= row (- n 1))
     `(,placed))
    (t
     (loop for p in (next-positions n placed)
        append (find-solution
                (1+ row) n (append placed `(,p)))))))