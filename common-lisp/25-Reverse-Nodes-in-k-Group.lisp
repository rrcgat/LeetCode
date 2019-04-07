(defun reverse-k-group (lst k)
  (let ((res (copy-list lst)))
    (if (= k 1)
        (return-from reverse-k-group res))
    (loop for end from k to (length lst) by k do
         (setf (subseq res (- end k) end)
               (reverse (subseq res (- end k) end))))
    res))