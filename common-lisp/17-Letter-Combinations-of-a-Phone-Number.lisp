(defun letter-combinations (digits)
  (let* ((letters (pairlis
                   '(#\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9)
                   '("abc" "def" "ghi" "jkl" "mno" "pqrs" "tuv" "wxyz")))
         (res (loop for c across
                   (cdr (assoc (elt digits 0) letters)) collect (string c))))
    (loop for d across (subseq digits 1) do
         (let ((strs nil))
           (loop for a across (cdr (assoc d letters)) do
                (loop for r in res do
                     (push (concatenate 'string r `(,a)) strs)))
           (setf res strs)))
    res))