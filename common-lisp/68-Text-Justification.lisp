(defun full-justify (words max-width)
  (loop for word in words
     with res
     with line
     with width = max-width
     do (cond
          ((null line)
           (push word line)
           (decf width (length word)))
          ((>= (- width (length word) 1) 0)
           (push (format nil " ~a" word) line)
           (decf width (1+ (length word))))
          (t
           (push (justify-center (reverse line) width) res)
           (setf width (- max-width (length word)) line `(,word))))
     finally (push (format nil "~{~a~}~V@{~a~:*~}"
                           (reverse line) width " ") res)
       (return (reverse res))))

(defun justify-center (line width)
  "将一行文字 line 居中对齐，可填充剩余空格数为 width"
  (let ((interspace (1- (length line))))
    (if (zerop interspace)
        (format nil "~{~a~}~V@{~a~:*~}" line width " ")
        (progn
          (when (> width interspace)
            (setf line (loop for word in line
                          with n = (floor width interspace)
                          collect (format nil "~a~V@{~a~:*~}" word n " "))
                  width (mod width interspace))
            (setf (nth interspace line)
                  (string-right-trim " " (nth interspace line))))
          (format nil "~{~a~}" 
                  (loop for word in line
                     collect (if (>= (decf width) 0)
                                 (format nil "~a " word)
                                 word)))))))