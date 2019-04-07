(defun search-range (nums target)
  (let ((start 0)
        (end (length nums)))
    (loop while (< start end) do
         (let ((mid (floor (+ start end) 2)))
           (cond
             ((< (nth mid nums) target)
              (setf start (1+ mid)))
             ((> (nth mid nums) target)
              (setf end mid))
             (t
              ;; nums[mid] == target
              (let ((first-position mid)
                    (last-position mid))
                (loop while (and (> 0 first-position)
                                 (= target (nth (1- first-position) nums))) do
                     (decf first-position))
                (loop while (and (< last-position (length nums))
                                 (= target (nth (1+ last-position) nums))) do
                     (incf last-position))
                (return (list first-position last-position))))))
       finally (return '(-1 -1)))))