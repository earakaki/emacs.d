(require 'uniquify)

(custom-set-variables
 '(custom-file "~/.emacs.d/custom.el")
 '(auto-save-default nil)
 '(backup-inhibited t)
 '(make-backup-file nil)
 '(inhibit-startup-message t)
 '(indent-tabs-mode nil)
 '(tab-width 2)
 '(standard-indent 2)
 '(c-basic-offset 2)
 '(line-number-mode t)
 '(column-number-mode t)
 '(uniquify-buffer-name-style 'forward)
 '(require-final-newline t)
 '(next-line-add-newlines nil)
 '(redisplay-dont-pause t))

(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook (lambda ()
  (delete-trailing-whitespace)))

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(global-set-key (kbd "C-c s") 'hs-show-block)
(global-set-key (kbd "C-c S") 'hs-show-all)
(global-set-key (kbd "C-c h") 'hs-hide-block)
(global-set-key (kbd "C-c H") 'hs-hide-all)

(defun emacs-load-path ()
  (file-name-directory
   (or (buffer-file-name) load-file-name)))

(defun emacs-load-name (name)
  (concat (emacs-load-path) name))

(defun emacs-load-prefixed-name (name)
  (emacs-load-name(concat "emacs-" name ".el")))

(defun emacs-load (name)
  (if (file-exists-p (emacs-load-prefixed-name name))
      (load (emacs-load-prefixed-name name))))

(defun load-emacs-system-conf ()
  (emacs-load (replace-regexp-in-string "/" "-" (symbol-name system-type))))

(defun load-emacs-host-conf ()
  (emacs-load system-name))

(defun load-emacs-user-conf ()
  (emacs-load user-login-name))

(defun manage-packages ()
  (add-to-list 'load-path (concat (emacs-load-path) "/el-get/el-get"))

  (unless (require 'el-get nil t)
    (url-retrieve
     "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
     (lambda (s)
       (end-of-buffer)
       (eval-print-last-sexp))))

  (eval-after-load "el-get"
    '(progn
       (setq el-get-sources custom-install)
       (setq packages (append install (mapcar 'el-get-source-name el-get-sources)))
       (el-get 'sync packages)
       (if (and custom-file (file-exists-p custom-file))
           (load custom-file)))))

(setq install '())
(setq custom-install '())

(provide 'emacs-defaults)
