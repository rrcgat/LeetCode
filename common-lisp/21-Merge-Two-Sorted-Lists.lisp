;;; :)
;;; 若是用 car 和 cdr 呢
(defun merge-two-lists (l1 l2)
  (sort (append l1 l2) #'<))