;;; 找到规律后按规律写出代码
(defun convert (s num-rows)
  (if (or (= 1 num-rows)
          (> num-rows (length s)))
      s
      (let* ((length-s (length s))
             (res (make-array length-s
                              :fill-pointer 0
                              :element-type 'character))
             (step (* 2 (- num-rows 1))))
        (loop for n below num-rows do
             (do* ((idx n (+ idx step))
                   (ex-idx (+ idx (- step (* 2 n))) (+ idx (- step (* 2 n)))))
                  ((>= idx length-s))
               (vector-push (elt s idx) res)
               (if (and (< ex-idx length-s)
                        (not (zerop n))
                        (not (= idx ex-idx)))
                   (vector-push (elt s ex-idx) res))))
        res)))