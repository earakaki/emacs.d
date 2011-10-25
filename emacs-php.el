(add-to-list 'install 'php-mode-improved)

(add-to-list 'custom-install
  '(:name mmm-mode
       :type git
       :url "https://github.com/purcell/mmm-mode.git"
       :features mmm-mode))

(eval-after-load "php-mode-improved" '(progn
   (add-to-list 'auto-mode-alist '("\\.php$" . html-mode))
   (add-to-list 'auto-mode-alist '("\\.inc$" . html-mode))
   (add-to-list 'auto-mode-alist '("\\.ctp$" . html-mode))
   (add-hook 'php-mode-hook #'linum-mode 1)))

(eval-after-load "mmm-mode" '(progn
  (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-js))
  (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-css))
  (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-css-inline))
  (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-php))

  (custom-set-variables
   '(mmm-global-mode 'maybe)
   '(mmm-submode-decoration-level 0))

  (mmm-add-classes
   '((html-php
      :submode php-mode
      :front "<[?]php"
      :back "[?]>")
     (html-js
      :submode js2-mode
      :front "<script[[:blank:]]\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[[:blank:]]*>"
      :back "</script>")
     (html-css
      :submode css-mode
      :front "<style "
      :back "</style>")
     (html-css-inline
      :submode css-mode
      :front "style=\""
      :back "\"")))))

(provide 'emacs-php)
