(defun combination-sum-2 (candidates target)
  (cond
    ((= target 0)
     (values nil t))
    ((< target 0)
     (values nil nil))
    (t
     (let ((res))
       (loop for c in candidates
          for start from 1 to (length candidates)
          do (multiple-value-bind (solutions has-solution)
                 (combination-sum (subseq candidates start) (- target c))
               ;; 有解
               (when has-solution
                 (if solutions
                     (loop for s in solutions do
                          (push (push c s) res))
                     ;; c 恰好为解
                     (push `(,c) res)))))
       (if res
           (values (remove-duplicates
                    res
                    :test #'(lambda (x y) (not (set-difference x y))))
                   t)
           (values nil nil))))))