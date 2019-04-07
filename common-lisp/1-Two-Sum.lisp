;;; 使用散列表
(defun two-sum (nums target)
  (let ((hash-table (make-hash-table)))
    (loop for i below (length nums) do
         (let* ((key (- target (nth i nums)))
                (value (gethash key hash-table)))
           (if value
               (return (list value i))
               (setf (gethash (nth i nums) hash-table) i))))))