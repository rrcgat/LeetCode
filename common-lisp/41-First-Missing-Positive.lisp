(defun first-missing-positive (nums)
  (let ((nums-size (length nums)))
    (loop for i below nums-size
       ;; 0 < nums[i] <= nums - size 且当前位置值 nums[i] != i + 1 时
       do (loop while (and (> (nth i nums) 0)
                           (<= (nth i nums) nums-size)
                           (not (= (nth i nums)
                                   (1+ i))))
             ;; 交换当前位置 i 的元素与 nums[i] - 1 处位置
             do (rotatef (nth i nums)
                         (nth (1- (nth i nums)) nums))))
    (loop for i below nums-size
       do (unless (= (1+ i)
                     (nth i nums))
            (return (1+ i)))
       finally (return (1+ nums-size)))))