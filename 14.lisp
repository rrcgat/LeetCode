(defun longest-common-prefix (strs)
  (if (not strs)
      (return-from longest-common-prefix ""))
  (let* ((chars (apply #'map 'list #'list strs))
         (size (length chars)))
    (loop
       for ch in chars
       for i to size do
         (if (not (= (length (remove-duplicates ch)) 1))
             (return-from longest-common-prefix (subseq (first strs) 0 i))))
    (subseq (first strs) 0 size)))
