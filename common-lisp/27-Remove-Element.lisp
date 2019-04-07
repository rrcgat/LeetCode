;;; 使用 remove 或 delete 都可以做到，但因为不能使用额外的空间，
;;; 那么可以有副作用的 delete，但原数组最终结果是未知的，不可行。
;;;
;;; 使用 car 和 pop，pop 是原地修改，但在函数中却不行。
;;;
;;; setf 或 rotatef 宏可以做到，最终使用双指针。
(defun remove-element (nums val)
  (let ((n (length nums))
        (i 0))
    (loop while (< i n) do
         (if (= (nth i nums) val)
             (rotatef (nth i nums)
                      (nth (decf n) nums))
             (incf i)))
    n))