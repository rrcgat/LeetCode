;;; 下一个全排列，in-place
(defun next-permutation (nums)
  (let* ((size (length nums))
         ;; 从右端开始找出算法中的 j
         (j (loop for i from (- size 2) downto 0 do
                 (if (< (nth i nums)
                        (nth (1+ i) nums))
                     (return i)))))
    (if j
        ;; 找到 j 之后寻找算法中的 k
        (let* ((k (1+ j)))
          (loop for i from (1+ j) below size do
               (if (and (< (nth j nums)
                           (nth i nums))
                        (< (nth i nums)
                           (nth k nums)))
                   (setf k i)))
          (when (< (nth j nums)
                   (nth k nums))
            (rotatef (nth j nums) (nth k nums))
            (let ((start (1+ j))
                  (end (1- size)))
              (loop while (< start end) do
                   (rotatef (nth start nums) (nth end nums))
                   (incf start)
                   (decf end)))))
        ;; 未找到符合条件的 j，将输入逆序
        (let ((start 0)
              (end (1- size)))
          (loop while (< start end) do
               (rotatef (nth start nums) (nth end nums))
               (incf start)
               (decf end))))))