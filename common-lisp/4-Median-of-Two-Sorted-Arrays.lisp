;;; 遍历两个数组并将数据放入新的排序好的数组中，再计算
;;; multiple-value-bind 宏接受多重返回值
(defun find-median-sorted-arrays (nums1 nums2)
  (let ((lst nil)
        (len (+ (length nums1) (length nums2))))
    (loop while (and nums1 nums2) do
         (if (< (car nums1) (car nums2))
             (push (pop nums1) lst)
             (push (pop nums2) lst)))
    (setf lst (reverse lst))
    (nconc lst nums1 nums2)
    (multiple-value-bind (q r) (floor len 2)
      (if (zerop r)
          (/ (+ (nth q lst) (nth (1- q) lst)) 2)
          (nth q lst)))))

;;; 将两个数组合并后排序，再计算
(defun find-median-sorted-arrays-1 (nums1 nums2)
  (let* ((lst (sort (append nil nums1 nums2) #'<))
         (len (length lst)))
    (multiple-value-bind (q r) (floor len 2)
      (if (zerop r)
          (/ (+ (nth q lst) (nth (1- q) lst)) 2)
          (nth q lst)))))
