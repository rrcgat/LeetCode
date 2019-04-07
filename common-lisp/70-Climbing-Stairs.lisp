(let ((table (make-hash-table)))
  (setf (gethash 1 table) 1)
  (setf (gethash 2 table) 2)
  (defun climb-stairs (n)
    (loop for i from 3 to n
       do (setf (gethash i table)
                (+ (gethash (1- i) table)
                   (gethash (- i 2) table)))
       finally (return (gethash n table)))))