(ql:quickload "split-sequence")
(defun simplify-path (path)
  (loop for p in (split-sequence:split-sequence #\/ path)
     with res
     do (cond
          ((string= ".." p)
           (pop res))
          ((string= "." p))
          ((string= "" p))
          (t
           (push p res)))
     finally (return (format nil "/~{~a~}" (reverse res)))))