(defun my-pow (x n)
  (cond
    ((zerop n) 1)
    (t
     (let* ((half (my-pow x (abs(floor n 2))))
            (res (* half half)))
       (if (plusp (mod n 2))
           (setf res (* half half x)))
       (if (plusp n)
           res
           (/ 1 res))))))