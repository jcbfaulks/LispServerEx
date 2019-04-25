(in-package test-server)

(defun start-test-proxy (&key (port 8080))
  (socket-server "localhost" port #'test-handler))

(defun test-handler (client-stream)
  (declare (type stream client-stream))
  (let ((message (read-stream client-stream)))
    (write-stream client-stream "~A~&" (hit-backend message))))

(defun hit-backend (msg)
  (let* ((socket (socket-connect "localhost" 5000))
         (stream (socket-stream socket)))
    (write-stream stream "~A~&" msg)
    (read-stream stream)))
