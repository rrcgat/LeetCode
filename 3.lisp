(defun length-of-longest-substring (s)
  (let ((alist nil)
        (len 0)
        (l -1))
    (loop
       for c across s
       for i from 0 to (length s) do
         (let ((cell (assoc c alist))
               (size (- i l)))
           (cond
             (cell (setf l (cdr cell)))
             ((> size len) (setf len size))))
         (push (cons c i) alist))
    len))
