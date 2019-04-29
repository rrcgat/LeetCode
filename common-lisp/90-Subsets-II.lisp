(defun subsets-with-dup (nums)
  (let ((nums (sort (copy-seq nums) #'<))
        (res '(())))
    (loop for n in nums
       with prev = '(nil)
       with l
       do (setf l (length prev))
         (loop for r in res
            do (if (or (not (equal n (first prev)))
                       (and r
                            (>= (length r) l)
                            (equal (subseq r 0 l) prev)))
                   (push (append r `(,n)) res)))
         (if (equal n (first prev))
             (push n prev)
             (setf prev `(,n)))
       finally (return res))))