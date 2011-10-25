(add-to-list 'install 'zencoding-mode)
(add-to-list 'install 'js2-mode)

(add-to-list 'custom-install
   '(:name scss-mode
       :description "Major mode for editing SCSS files(http://sass-lang.com)"
       :type git
       :url "https://github.com/antonj/scss-mode.git"
       :features scss-mode))

(defun imenu-css-mode()
  (set (make-local-variable 'imenu-generic-expression)
       '((nil "^[ \t\n]*\\([\][[:word:]:=#,*~>.\(\) \t\r\n_-]+\\)[ \t\n]*{" 1))))

(add-to-list  'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'css-mode-hook 'imenu-css-mode)
(add-hook 'js2-mode-hook 'imenu-add-menubar-index)
(add-hook 'js2-mode-hook 'hs-minor-mode t)

(custom-set-variables
 '(css-indent-offset 2)
 '(js-indent-level 2))
(provide 'emacs-webdev)
