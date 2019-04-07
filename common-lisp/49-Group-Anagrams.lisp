(defun group-anagrams (strs)
  (let ((table (make-hash-table)))
    (loop for str in strs
       do (push str (gethash (sort (copy-seq str) #'char-lessp) table)))
    (loop for value being the hash-values of table collect value)))