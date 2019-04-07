(defun n-sum (nums target n &optional (result nil) (results nil))
  (if (= n 2)
      (let ((start 0)
            (end (1- (length nums))))
        (loop while (< start end) do
             (let* ((a (nth start nums))
                    (b (nth end nums))
                    (s (+ a b)))
               (cond
                 ((= s target)
                  (push (append result (list a b)) results)
                  (incf start)
                  (decf end)
                  (loop while (and (< start end)
                                   (= (nth start nums)
                                      (nth (1- start) nums)))
                     do (incf start))
                  (loop while (and (< start end)
                                   (= (nth end nums)
                                      (nth (1+ end) nums)))
                     do (decf end)))
                 ((< s target)
                  (incf start))
                 (t
                  (decf end))))))
      ;; n > 2
      (loop for i to (- (length nums) n) do
           (if (and (not (zerop i))
                    (= (nth i nums) (nth (1- i) nums)))
               nil
               (setf results (n-sum (subseq nums (1+ i))
                                      (- target (nth i nums))
                                      (1- n)
                                      (append result (list (nth i nums)))
                                      results)))))
  results)

(defun four-sum (nums target)
  (n-sum (sort nums #'<) target 4))