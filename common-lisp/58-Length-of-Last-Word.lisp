;; 使用正则
(ql:quickload "cl-ppcre")
(defun length-of-lastword (s)
  (length (car (last (ppcre:split " " s)))))

;; 使用循环
(defun length-of-lastword (s)
  (loop for c across (reverse (string-trim " " s))
     with res = 0
     do (if (string= " " c)
            (return res)
            (incf res))
     finally (return res)))