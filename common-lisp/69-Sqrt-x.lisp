(defun my-sqrt (x)
  (let* ((lo 1)
         (hi (floor x))
         (mid (floor (+ lo hi) 2)))
    (loop
       do (cond
            ((= (* mid mid) x)
             (return mid))
            ((> (* mid mid) x)
             (setf hi mid))
            (t
             (setf lo mid)))
         (if (= mid (floor (+ lo hi) 2))
             (return mid)
             (setf mid (floor (+ lo hi) 2))))))