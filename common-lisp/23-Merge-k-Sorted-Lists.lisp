;;; 常规思路应该是先从合并两个有序列表开始
(defun merge-k-lists (lists)
  (sort (apply #'append lists) #'<))