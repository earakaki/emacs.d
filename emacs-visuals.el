(add-to-list 'install 'switch-window)
(add-to-list 'install 'maxframe)

(add-to-list
 'custom-install
 '(:name zenburn-emacs
         :type git
         :url "https://github.com/bbatsov/zenburn-emacs.git"
         :features color-theme-zenburn))


(display-time)

(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(cond
 ((string-match "Emacs 23" (emacs-version))
  (eval-after-load "color-theme-zenburn" '(color-theme-zenburn)))
 ((string-match "Emacs 24" (emacs-version))
  (eval-after-load "color-theme-zenburn"
    '(progn
       (with-temp-buffer
         (insert-file-contents (expand-file-name "~/.emacs.d/el-get/zenburn-emacs/zenburn-theme.el"))
         (push (sha1 (current-buffer)) custom-safe-themes)) ;; I know it's not the most secure thing to do
       (add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/zenburn-emacs")
       (load-theme 'zenburn nil)))))

(modify-frame-parameters (selected-frame) '((alpha . 95)))

(add-hook 'window-setup-hook 'maximize-frame t)

(provide 'emacs-visuals)
