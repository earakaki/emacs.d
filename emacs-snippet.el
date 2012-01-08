(add-to-list 'custom-install
             '(:name yasnippet
                     :website "https://github.com/capitaomorte/yasnippet.git"
                     :description "YASnippet is a template system for Emacs."
                     :type git
                     :url "https://github.com/capitaomorte/yasnippet.git"
                     :features "yasnippet"
                     :prepare (lambda ()
                                (unless (or (boundp 'yas/snippet-dirs) (get 'yas/snippet-dirs 'customized-value))
                                  (setq yas/snippet-dirs
                                        (list (concat el-get-dir (file-name-as-directory "yasnippet") "snippets")))))

                     :post-init (lambda ()
                                  (put 'yas/snippet-dirs 'standard-value
                                       (list (list 'quote
                                                   (list (concat el-get-dir (file-name-as-directory "yasnippet") "snippets"))))))
                     :compile nil))

(eval-after-load "yasnippet"
  '(progn
     (custom-set-variables
      '(yas/prompt-functions '(yas/ido-prompt yas/dropdown-prompt))
      '(yas/snippet-dirs '("~/.emacs.d/snippets" "~/.emacs.d/el-get/yasnippet/snippets")))
     (yas/initialize)
     (mapc 'yas/load-directory yas/root-directory)))

(provide 'emacs-snippet)
