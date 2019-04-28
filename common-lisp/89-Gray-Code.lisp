(defun gray-code (n)
  (loop for i below n
     with res = '(0)
     do (loop for element in res
           with base = (ash 1 i) ; (expt 2 i)
           do (push (logior element base) res))
     finally (return (reverse res))))