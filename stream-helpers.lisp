(in-package :stream-helpers)

(defun read-stream (stream)
  (let ((ret (make-string-output-stream)))
    (write-line (read-line stream) ret)
    (loop while (listen stream)
          do (write-line (read-line stream) ret))
    (get-output-stream-string ret)))

(defun write-stream (stream messageFormat &rest formatArgs)
  (apply #'format stream messageFormat formatArgs)
  (force-output stream))
