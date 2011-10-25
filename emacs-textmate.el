(require 'ido)
(ido-mode t)

(add-to-list 'custom-install
  '(:name textmate
      :type git
      :url "https://github.com/defunkt/textmate.el.git"
      :features textmate
      :after (lambda () (textmate-mode))))

(eval-after-load "textmate"
  '(progn
     (define-key *textmate-mode-map* (kbd "M-t") 'textmate-goto-file)
     (define-key *textmate-mode-map* (kbd "M-T") 'textmate-goto-symbol)
     (textmate-mode)))

(provide 'emacs-textmate)
