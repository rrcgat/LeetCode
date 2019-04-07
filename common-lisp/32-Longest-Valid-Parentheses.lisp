;;; 刚开始想到用动态规划，后来发现直接使用栈就可以了，更简单清晰。
;;; Lisp 中的列表来代替实现栈，更加方便。
(defun longest-valid-parentheses (s)
  (let ((stack)
        (longest 0))
    (loop for c across s 
       for i to (length s) do
         (if (and (equal (car (car stack)) #\()
                  (equal c #\)))
             (progn
               (pop stack)
               (if (null stack)
                   (setf longest (1+ i))
                   (setf longest (- i (cdr (car stack))))))
             (push (cons c i) stack)))
    longest))