(defsystem "server-ex"
  :description "siple server/proxy example"
  :version "0.0.1"
  :author "JF"
  :depends-on ("usocket" "usocket-server")
  :components ((:file "packages")
               (:file "stream-helpers")
               (:file "server")
               (:file "test")))

