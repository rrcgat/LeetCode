(defun not-valid-sudoku (box) ; 验证除 "." 外是否有重复
  (let ((digits (remove "." box :test #'string=)))
    (not (= (length digits)
            (length (remove-duplicates digits :test #'string=))))))

(defun is-valid-sudoku (board)
  (loop for i to 8 
     do (cond ((not-valid-sudoku (nth i board)) ; 验证行
               (return nil))
              ;; 验证列
              ((not-valid-sudoku (loop for row in board
                                    collect (nth i row)))
               (return nil))
              ;; 验证 3x3 方格，(x, y) 为 3x3 方格左上角顶点
              ((not-valid-sudoku (let ((x (*(floor i 3) 3))
                                       (y (* (mod i 3) 3)))
                                   (loop for row from x below (+ x 3)
                                      append (subseq (nth row board)
                                                     y
                                                     (+ y 3)))))
               (return nil)))
     finally (return t)))