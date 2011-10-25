(add-to-list 'install 'auto-complete)
(add-to-list 'install 'auto-complete-yasnippet)
(add-to-list 'install 'auto-complete-extension)

(custom-set-variables
 '(ac-auto-start 2)
 '(ac-ignore-case nil)
 '(ac-sources '(ac-source-yasnippet)))

(eval-after-load "auto-complete"
  '(progn
     ;; As we're using js2-mode adapt it
     (make-symbolic-link
      (expand-file-name "~/.emacs.d/el-get/auto-complete/dict/javascript-mode")
      (expand-file-name "~/.emacs.d/el-get/auto-complete/dict/js2-mode") t)

     (require 'auto-complete-config)
     (add-to-list 'ac-dictionary-directories (expand-file-name "~/.emacs.d/el-get/auto-complete/dict"))))

(provide 'emacs-autocomplete)
