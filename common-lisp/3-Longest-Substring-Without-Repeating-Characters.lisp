;;; 使用关联表 alist 存储出现字符与对应的索引
;;; 函数 ASSOC 接受一个键和一个 alist 并返回第一个 CAR 匹配该键的点对单元
;;; 双指针进行查找
(defun length-of-longest-substring (s)
  (let ((alist nil)
        (longest-length 0)
        (p -1))
    (loop
       for c across s
       for index from 0 to (length s) do
         (let ((cell (assoc c alist))
               (size (- index p)))
           (cond
             (cell (setf p (cdr cell)))
             ((> size longest-length) (setf longest-length size))))
         (push (cons c index) alist))
    longest-length))