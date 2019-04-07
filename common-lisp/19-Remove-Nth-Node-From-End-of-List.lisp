(defun remove-nth-from-end (head n)
  (let ((i (- (length head) n)))
    (append (subseq head 0 i)
            (subseq head (1+ i)))))