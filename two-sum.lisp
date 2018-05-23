(defun two-sum (nums target)
  (let ((h (make-hash-table)))
    (loop for i below (length nums) do
         (let ((a (gethash (- target (nth i nums)) h)))
           (if a
               (return (list a i))
               (setf (gethash (nth i nums) h) i))))))
