(defun solve-sudoku (board)
  (let ((empty 0))
    (loop for row to 8
       do (loop for col to 8
             do (when (string= "."
                               (nth col (nth row board)))
                  (incf empty) ; 空白位置 +1
                  ;; 设置空白位置为所有可能取值组成的列表
                  (setf (nth col (nth row board))
                        (sudoku-probability board row col)))))
    (loop while (> empty 0)
       do (loop for row to 8
             do (loop for col to 8
                   do (when (equal (type-of (nth col (nth row board)))
                                   'cons)
                        ;; 该位置类型是列表时，更新其所有可能的取值
                        (setf (nth col (nth row board))
                              (sudoku-probability board row col))
                        ;; 列表长度为 1，该位置确定
                        (if (= (length (nth col (nth row board))) 1)
                            (progn
                              (setf (nth col (nth row board))
                                    (first (nth col (nth row board))))
                              (decf empty))
                            ;; 某一补集长度恰好为 1 时，该位置值确定
                            (let ((complement (single-sudoku-complement
                                               board
                                               row
                                               col)))
                              (when complement
                                (setf (nth col (nth row board))
                                      (first complement))
                                (decf empty))))))))))


(defun sudoku-boxes (board row col)
  "获取根据所在行列位置获取所在行、列、3x3 方格"
  (list
   ;; 行
   (nth row board)
   ;; 列
   (loop for board-row in board
      collect (nth col board-row))
   ;; 3x3 方格，(x, y) 为 3x3 方格左上角顶点
   (let ((x (* (floor row 3) 3))
         (y (* (floor col 3) 3)))
     (loop for row from x below (+ x 3)
        append (subseq (nth row board)
                       y
                       (+ y 3))))))


;;; 获取根据行和列获取该位置的所有可能取值，数独中可能有 "."、列表、数字字符串。
(defun sudoku-probability (board row col)
  "获取根据行和列获取该位置的所有可能取值"
  (set-difference
   '("1" "2" "3" "4" "5" "6" "7" "8" "9")
   (loop for cell in (apply #'append 
                            (sudoku-boxes board row col))
      unless (or (equal "." cell)
                 (equal (type-of cell)
                        'cons))
      collect cell)
   :test #'string=))


(defun single-sudoku-complement (board row col)
  "获取补集长度为 1 的列表中的元素，没有则返回 nil"
  (let ((current (nth col (nth row board))))
    (loop for box in (sudoku-boxes board row col)
       do (if (= (length (set-difference current box)) 1)
              (return (first (set-difference current box)))))))