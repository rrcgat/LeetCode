(defun two-sum (nums target)
  (let ((h (make-hash-table)))
    (loop for i below (length nums) do
         (let ((a (gethash (- target (nth i nums)) h)))
           (if a
               (return (list a i))
               (setf (gethash (nth i nums) h) i))))))


(defun two-sum-1 (nums target)
  (let ((start 0)
        (tmp))
    (loop while (cdr nums) do
         (setf tmp (cdr nums))
         (loop for i from 1 below (length nums) do
              (if (= (+ (car nums) (car tmp)) target)
                  (return-from two-sum-1 (list start (+ start i)))
                  (setf tmp (cdr tmp))))
         (setf nums (cdr nums))
         (incf start))))
