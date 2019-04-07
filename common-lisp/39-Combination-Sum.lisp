(defun combination-sum (candidates target)
  (cond
    ((= target 0)
     (values nil t))
    ((< target 0)
     (values nil nil))
    (t
     (let ((res))
       (loop for c in candidates
          for start to (length candidates)
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
           (values res t)
           (values nil nil))))))