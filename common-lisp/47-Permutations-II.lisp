(defun permuet-unique (nums)
  (cond
    ((not nums)
     nil)
    ((= (length nums) 1)
     `(,nums))
    (t
     (loop for n in (remove-duplicates nums)
        append (loop for p in (permuet-unique (remove n nums :count 1))
                  collect (append `(,n) p))))))