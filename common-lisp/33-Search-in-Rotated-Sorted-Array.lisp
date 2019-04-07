;;; 
(defun search-rotated-sorted (nums target)
  (let ((lo 0)
        (hi (length nums)))
    (loop while (< lo hi) do
         (let ((mid (floor (+ lo hi) 2)))
           ;; 实现类似异或的操作，`logxor` 使用数值为参数，不符合要求。
           ;; 可使用 `reduce` 宏自己写一个作用于 `t` 与 `nil` 之上的异或操作
           ;; (reduce #'(lambda (x y) (not (equal x y))) sequence)
           (if (not (equal (not (equal (> (first nums) target)
                                       (> (first nums) (nth mid nums))))
                           (> target (nth mid nums))))
               (setf lo (1+ mid))
               (if (= (nth mid nums) target)
                   (return mid)
                   (setf hi mid))))
       finally (return -1))))