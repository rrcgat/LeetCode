;;; 不能用乘、除、求模运算符。
;;; 只用加减的话，时间复杂度与商的大小成正比。
;;; 但位移可以实现类似乘除的操作。
(defun divide (dividend divisor)
  (let ((positive (and (> dividend 0)
                       (> divisor 0)))
        (dividend (abs dividend))
        (divisor (abs divisor))
        (res 0))
    (loop while (> dividend divisor) do
         (let ((temp divisor)
               (m 1))
           (loop while (> dividend temp) do
                (decf dividend temp)
                (incf res m)
                (setf temp (ash temp 1))
                (setf m (ash m 1)))))
    (if (not positive)
        (setf res (- res)))
    (min (max res (- (expt 2 31))) (1- (expt 2 31)))))