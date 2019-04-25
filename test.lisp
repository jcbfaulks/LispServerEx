(in-package :run-test)

(defparameter *s1* nil)
(defparameter *s2* nil)

(defun start-server (&key (port 8080))
  (usocket:socket-server "localhost" port #'read-write-tcp-handler))

(defun read-write-tcp-handler (stream)
  (declare (type stream stream))
  (let ((message (read-stream stream)))
    (write-stream stream "~A~&~A~&~A~&" message "Pong" "Ball")))


(defun run-servers ()
  (setf *s1* (sb-thread:make-thread (lambda () (start-server :port 5000))))
  (setf *s2* (sb-thread:make-thread (lambda () (start-test-proxy  :port 8081)))))

(defun kill-servers ()
  (sb-thread:terminate-thread *s1*)
  (sb-thread:terminate-thread *s2*))


(defun run-test (&key (port 8081))
  (let* ((socket (socket-connect "localhost" port)))
    (write-stream (socket-stream socket) "Ping~&")
    (let ((message (read-stream (socket-stream socket))))
      (format t "~A~&" message))))
