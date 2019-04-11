(defun my-remove-duplicates (nums)
  (loop for n in nums
     with i = 0
     do (if (or (< i 2)
                (not (= n (nth (- i 2) nums))))
            (setf (nth i nums) n i (1+ i)))
     finally (return i)))