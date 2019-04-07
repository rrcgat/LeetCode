(defun permuet (nums)
  (cond
    ((not nums)
     nil)
    ((= (length nums) 1)
     `(,nums))
    (t
     (loop for n in nums
        append (loop for p in (permuet (remove n nums))
                  collect (append `(,n) p))))))