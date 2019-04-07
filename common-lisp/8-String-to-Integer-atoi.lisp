;;; 使用数组而不是列表是因为 vector-push 能把元素添加到尾部
(defun my-atoi (str)
  (let ((str (string-trim " " str))
        (digit (make-array 12
                           :fill-pointer 0
                           :element-type 'character)))
    (if (zerop (length str))
        (return-from my-atoi 0)
        (vector-push (elt str 0) digit))
    (loop for s across (subseq str 1) do
         (if (digit-char-p s)
             (vector-push s digit)
             (return)))
    (handler-case (let ((res (parse-integer digit))
                        (limit (expt 2 31)))
                    (cond ((> res (1- limit))
                           (1- limit))
                          ((< res (- limit))
                           (- limit))
                          (t res)))
      (error () 0))))