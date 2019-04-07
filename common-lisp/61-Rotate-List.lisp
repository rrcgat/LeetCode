(defun rotate-right (head k)
  (let* ((size (length head))
         (k (mod k size))
         (size (1- size)))
    (loop repeat k
       do (setf head (append (last head) (subseq head 0 size)))
       finally (return head))))