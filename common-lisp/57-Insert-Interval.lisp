(defun insert-i (intervals new-interval)
  (let ((res `(nil)))
    (if (null intervals)
        (return-from insert-i `(,new-interval)))
    (loop for interval in intervals
       do (cond
            (new-interval
             (if (>= (second interval)
                     (first new-interval))
                 (progn
                   (push `(,(min (first interval) (first new-interval))
                            ,(max (second interval) (second new-interval)))
                         (cdr (last res)))
                   (setf new-interval nil))
                 (push interval (cdr (last res)))))
            (t
             (if (>= (second (car (last res)))
                     (first interval))
                 (setf (second (car (last res))) 
                       (max (second (first intervals))
                            (second (car (last res)))))
                 (push interval (cdr (last res))))))
       finally (return (cdr res)))))