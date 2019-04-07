(defun add-binary (a b)
  (let* ((size (max (length a)
                    (length b)))
         (fmt (format nil "~~~d,1,0,'0@a" size))
         (out))
    (loop for c1 across (reverse (format nil fmt a))
       for c2 across (reverse (format nil fmt b))
       with remain = 0
       do (setf remain (eval (read-from-string
                              (format nil "(+ ~a ~a ~a)" c1 c2 remain))))
         (if (> remain 1)
             (progn 
               (push (- remain 2) out)
               (setf remain 1))
             (progn
               (push  remain out)
               (setf remain 0)))
       finally (if (zerop remain)
                   (return out)
                   (progn
                     (push remain out)
                     (return (format nil "~{~a~}" out)))))))

;;; 或者更简单点
(defun add-binary (a b)
  (format nil "~b" (eval (read-from-string
                          (format nil "(+ #b~a #b~a)" a b)))))