;;; 双指针
(defmacro shorten (short i step)
  `(progn
     (incf ,i ,step)
     (setf area (* ,short (- l r)))
     (loop while (and (< r l) (< (nth ,i height) ,short)) do
          (incf ,i ,step))))

(defun max-area (height)
  (let ((r 0)
        (l (1- (length height)))
        (area 0)
        (max-area 0))
    (loop while (< r l) do
         (if (< (nth r height) (nth l height))
             (shorten (nth r height) r 1)
             (shorten (nth l height) l -1))
         (if (> area max-area)
             (setf max-area area)))
    max-area))