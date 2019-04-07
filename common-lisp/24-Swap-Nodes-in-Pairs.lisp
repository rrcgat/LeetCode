(defun swap-pairs (head)
  (loop for i below (floor (length head) 2) do
       (rotatef (nth (* i 2) head) (nth (1+ (* i 2)) head)))
  head)