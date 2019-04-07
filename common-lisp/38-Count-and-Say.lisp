(let ((say-table (make-hash-table)))
  ;; 使用散列表进行缓存
  (setf (gethash 1 say-table) "1")
  (defun count-and-say (n)
    (cond
      ((gethash n say-table)
       (gethash n say-table))
      (t
       (setf (gethash n say-table)
             (count-nums (count-and-say (1- n))))
       (gethash n say-table)))))


(defun count-nums (nums-string)
  "计算字符串中数字首先的次数，相邻并相同的为一组计算"
  (with-output-to-string (out)
    (let ((pre-num (elt nums-string 0))
          (count 0))
      (loop for num across nums-string
         do (if (string= num pre-num)
                (incf count)
                (progn
                  (format out "~a~a" count pre-num)
                  (setf count 1 pre-num num)))
         finally (format out "~a~a" count pre-num))
      out)))