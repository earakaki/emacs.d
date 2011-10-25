(setq mac-allow-anti-aliasing t)
(setq mac-pass-control-to-system t)
(setq mac-command-modifier 'meta)
(setq mac-function-modifier 'super)
(setq mac-shift-modifier 'shift)
(setq mac-option-modifier 'none)

(push "/usr/local/bin" exec-path)
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH"))) ;; Homebrew path

(set-frame-font "Latin_Modern_Mono-12")

(custom-set-variables
 '(mf-display-padding-height 110))

(provide 'emacs-darwin)
