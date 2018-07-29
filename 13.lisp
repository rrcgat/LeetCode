(defvar *roman* "IVXLCDM")
(defvar *nums* '(1 5 10 50 100 500 1000))

(defun roman-to-integer (s)
  (let ((roman-nums (loop for c across s
                       collect (nth (position c *roman*) *nums*))))
    (loop for (a b) on roman-nums
       sum (if (and b (< a b)) (- a) a))))
