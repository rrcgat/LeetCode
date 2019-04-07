(ql:quickload "cl-ppcre")
(defun is-number (s)
  (ppcre:scan-to-strings "^\\s*[+-]?\\d*((\\d+\\.)|(\\.\\d+))\\d*(e?[-+]?\d+)\\s*$" s))