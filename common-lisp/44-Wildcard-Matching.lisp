(defun is-match (s p)
  "s is an input string and p is a pattern"
  (cond
    ((string= s p)
     t)
    ((string= "" p)
     nil)
    ((string= "" s)
     (if (string= "*" (elt p 0))
         (is-match s (subseq p 1))
         nil))
    ((string= (elt p 0) "*")
     (or (is-match s (subseq p 1))
         (is-match (subseq s 1) p)))
    ((find (elt p 0) `(,(elt s 0) "?") :test #'string=)
     (is-match (subseq s 1) (subseq p 1)))
    (t
     nil)))