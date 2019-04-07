(defun find-substring (s words)
  (let ((word-length (length (car words)))
        (words-size (length words))
        (hash-table (make-hash-table :test 'equal))
        (res))
    ;; 使用 hash-table 计算 words 中每个字符串出现的次数
    (loop for word in words do
         (incf (gethash word hash-table 0)))
    (loop for i to (- (length s) (* word-length words-size)) do
         (let ((plist)) ; 使用属性表存储子串出现次数
           (loop for j below words-size do
                (let* ((start (+ i (* j word-length)))
                       (end (+ start word-length))
                       (substr (subseq s start end))
                       (key (intern substr "KEYWORD")))
                  (if (< (getf plist key 0)
                         (gethash substr hash-table -1))
                      (incf (getf plist key 0))
                      (return)))
              finally (push i res))))
    res))