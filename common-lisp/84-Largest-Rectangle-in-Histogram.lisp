(defun largest-rectangle-area (heights)
  (let* ((heights (append heights '(0)))
         (length (length heights))
         (stack `(,(1- length)))
         (largest 0))
    (loop for i below length
       with h
       with start
       do (loop while (< (nth i heights)
                         (nth (first stack) heights))
             do (setf h (nth (pop stack) heights))
               (if (= (first stack) (1- length))
                   (setf start -1)
                   (setf start (first stack)))
               (setf largest (max largest
                                  (* h (- i start 1)))))
         (push i stack)
       finally (return largest))))