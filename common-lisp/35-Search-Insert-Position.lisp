(defun search-insert (nums target)
  (let ((lo 0)
        (hi (length nums)))
    (loop while (< lo hi) do
         (let ((mid (floor (+ lo hi) 2)))
           (cond 
             ((> (nth mid nums) target)
              (setf hi mid))
             ((< (nth mid nums) target)
              (setf lo (1+ mid)))
             (t
              (return mid))))
       finally (if (> (nth lo nums) target)
                   (return lo)
                   (return (1- lo))))))