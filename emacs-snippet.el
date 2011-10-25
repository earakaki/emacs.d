(add-to-list 'install 'yasnippet)

(eval-after-load "yasnippet"
  '(progn
     (custom-set-variables
      '(yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt))
      '(yas/snippet-dirs '("~/.emacs.d/snippets" "~/.emacs.d/el-get/yasnippet/snippets")))
     (yas/initialize)
     (mapc 'yas/load-directory yas/root-directory)))

(provide 'emacs-snippet)
