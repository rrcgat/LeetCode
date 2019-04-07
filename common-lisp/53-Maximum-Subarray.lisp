(defun max-sub-array (nums)
  (let* ((lo 0)
         (hi (1- (length nums)))
         (sum (apply #'+ nums))
         (max sum))
    (if (> (apply #'max nums) max)
        (setf max (apply #'max nums)))
    (loop while (< lo hi)
       do (let* ((n-lo (next nums lo 1))
                 (sum1 (apply #'+ (subseq nums lo (1+ n-lo))))
                 (n-hi (next nums hi -1))
                 (sum2 (apply #'+ (subseq nums n-hi (1+ hi)))))
            (if (< sum1 sum2)
                (setf lo (1+ n-lo) sum (- sum sum1))
                (setf hi (1- n-hi) sum (- sum sum2)))
            (if (> sum max)
                (setf max sum)))
       finally (return max))))

(defun next (nums start step)
  "获取从 start 位置开始，第一个负数开始的连续负数序列中的最后一个的位置"
  (loop while (< -1 start (length nums))
     do (if (>= (nth start nums) 0)
            (incf start step)
            (return (loop while (and (< 0 (+ start step) (length nums))
                                     (< (nth (incf start step) nums) 0))
                       finally (return (- start step)))))
     finally (return (- start step))))

;;; Another amazing way
;;; https://leetcode.com/problems/maximum-subarray/discuss/20396/Easy-Python-Way
(defun max-sub-array (nums)
  (loop for i from 1 below (length nums)
     do (if (plusp (nth (1- i) nums))
            (incf (nth i nums) (nth (1- i) nums)))
     finally (return (apply #'max nums))))