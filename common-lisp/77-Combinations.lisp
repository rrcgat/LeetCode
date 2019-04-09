(defun combine (n k)
  (loop repeat k
     with res = '(nil)
     do (setf res (loop for set in res
                     append (loop for i from (if (last set)
                                                 (1+ (car (last set)))
                                                 1) to n
                                 collect (append set `(,i)))))
     finally (return res)))