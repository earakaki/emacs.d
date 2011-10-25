(add-to-list 'load-path (file-name-directory (or (buffer-file-name) load-file-name)))

(load "emacs-defaults")
(load "emacs-visuals")
(load "emacs-textmate")
(load "emacs-file-finding")
(load "emacs-autocomplete")
(load "emacs-snippet")
(load "emacs-org")
(load "emacs-webdev")
(load "emacs-php")
(load "emacs-ruby")
(load "emacs-python")
(load "emacs-lua")
(load "emacs-markdown")
(load-emacs-system-conf)
(load-emacs-host-conf)
(load-emacs-user-conf)

(manage-packages)

;; http://avdi.org/devblog/2011/06/17/make-emacs-server-write-a-pid-file/
(setq pidfile "/tmp/emacs-server.pid")

(add-hook
 'emacs-startup-hook
 (lambda ()
   (unless (file-exists-p pidfile)
     (server-start))
   (with-temp-file pidfile
     (insert (number-to-string (emacs-pid))))))

(add-hook
 'kill-emacs-hook
 (lambda ()
   (when (file-exists-p pidfile)
     (delete-file pidfile))))
