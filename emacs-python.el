(push "/usr/local/share/python" exec-path) ;; Homebrew pip installed execs
(setenv "PATH" (concat "/usr/local/share/python:" (getenv "PATH")))

(add-to-list 'install 'highlight-indentation)
;; (add-to-list 'install 'python-mode)
(add-to-list 'install 'python-pep8)
(add-to-list 'install 'virtualenv)
;;(add-to-list 'install 'ipython) ;; Not working for some reason

;; (add-to-list 'custom-install
;;              '(:name python-mode
;;                      :type emacsmirror
;;                      :description "Major mode for editing Python programs"
;;                      :features (python-mode doctest-mode)
;;                      :compile nil
;;                      :load "test/doctest-mode.el"
;;                      :post-init (lambda ()
;;                                   (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
;;                                   (add-to-list 'interpreter-mode-alist '("python" . python-mode))
;;                                   (autoload 'python-mode "python-mode" "Python editing mode." t))))

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(custom-set-variables
 '(py-indent-offset 4))

(add-hook 'python-mode-hook 'linum-mode t)

(provide 'emacs-python)
