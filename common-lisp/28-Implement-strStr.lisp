(defun strstr (haystack needle)
  (let ((needle-size (length needle)))
    (loop for i to (- (length haystack)
                      needle-size) do
         (if (string= (subseq haystack i (+ i needle-size))
                      needle)
             (return-from strstr i)))
    -1))