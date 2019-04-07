(defun is-palindrome (x)
  (string= (write-to-string x)
           (reverse (write-to-string x))))