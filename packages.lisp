(in-package :cl-user)

(defpackage :stream-helpers
  (:use :common-lisp)
  (:export :read-stream :write-stream))

(defpackage :test-server
  (:use :common-lisp :usocket :sb-thread :stream-helpers)
  (:export :start-test-proxy))

(defpackage :run-test
  (:use :common-lisp :stream-helpers :test-server :usocket)
  (:export :run-servers :kill-servers :run-test))
