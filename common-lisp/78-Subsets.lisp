(defun subsets (nums)
  (loop for num in nums
     with res = '(nil)
     do (nconc res (loop for set in res
                      collect (append set `(,num))))
     finally (return res)))