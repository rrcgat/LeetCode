(defun three-sum (nums)
  (let ((table (make-hash-table))
        (neg-nums nil)
        (pos-nums nil)
        (res nil))
    (loop for n in nums do
         (let ((value (gethash n table)))
           (if value
               (setf (gethash n table) (1+ value))
               (setf (gethash n table) 1))))
    (loop for k being the hash-keys in table do
         (if (< k 0)
             (push k neg-nums)
             (push k pos-nums)))
    (setf neg-nums (sort neg-nums '<))
    (setf pos-nums (sort pos-nums '<))
    (loop for n in neg-nums do
         (loop for p in pos-nums do
              (let* ((balance (- 0 n p))
                     (value (gethash balance table)))
                (if (and value
                         (or (and (or (= balance n) (= balance p))
                                  (> value 1))
                             (and (< n balance)
                                  (< balance p))))
                    (push (list n balance p) res)))))
    res))