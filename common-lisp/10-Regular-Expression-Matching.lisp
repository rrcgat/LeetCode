;;; 动态规划-备忘录进行匹配
(defun is-match (s p)
  (let ((memo (make-hash-table :test 'equal)))
    (defun dp (str pattern)
      (let ((key (list str pattern)))
        (multiple-value-bind (value present) (gethash key memo)
          (if present
              value
              (progn
                (cond ((string= pattern "")
                       (setf (gethash key memo) (string= str "")))
                      ((string= str "")
                       (setf (gethash key memo)
                             (and (eql (position #\* pattern) 1)
                                  (dp str (subseq pattern 2)))))
                      ((eql (position #\* pattern) 1)
                       (setf (gethash key memo)
                             (or (dp str (subseq pattern 2))
                                 (dp (subseq str 1) pattern))))
                      ((or (string= (elt pattern 0) #\.)
                           (string= (elt pattern 0) (elt str 0)))
                       (setf (gethash key memo)
                             (dp (subseq str 1) (subseq pattern 1))))
                      (t
                       (setf (gethash key memo) nil)))
                (gethash key memo))))))
    (dp s p)))