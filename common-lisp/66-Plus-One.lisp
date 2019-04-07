(defun plus-one (digits)
  (let ((res (copy-list digits))
        (last-idx (1- (length digits))))
    (incf (nth last-idx res))
    (loop for i from last-idx to 0
       do (if (< (nth i res) 10)
              (return res)
              (progn
                (setf (nth i res) 0)
                (if (zerop i)
                    (push 1 res)
                    (incf (nth (1- i) res)))))
       finally (return res))))