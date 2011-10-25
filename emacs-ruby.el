(add-to-list 'install 'ruby-block)
(add-to-list 'install 'rinari)
(add-to-list 'install 'rhtml-mode)
(add-to-list 'install 'yaml-mode)
(add-to-list 'install 'rvm)
(add-to-list 'install 'rspec-mode)

(add-to-list
 'custom-install
 '(:name cucumber-mode
         :type git
         :url "https://github.com/michaelklishin/cucumber.el.git"
         :features feature-mode)

 '(:name rvm
         :description "Emacs integration for rvm"
         :type git
         :features rvm
         :url "https://github.com/senny/rvm.el.git"
         :compile "rvm.el"))

(defun is-rails-project ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name "config/environment.rb" (textmate-project-root)))))

(defun is-rvmrc-available ()
  (when (textmate-project-root)
    (file-exists-p (expand-file-name ".rvmrc" (textmate-project-root)))))

(defun run-rails-test-or-ruby-buffer ()
  (interactive)
  (if (is-rails-project)
      (let* ((path (buffer-file-name))
             (filename (file-name-nondirectory path))
             (test-path (expand-file-name "test" (textmate-project-root)))
             (command (list ruby-compilation-executable "-I" test-path path)))
        (pop-to-buffer (ruby-compilation-do filename command)))
    (ruby-compilation-this-buffer)))

(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(eval-after-load "ruby"
  '(progn
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (if (is-rvmrc-available) (rvm-activate-corresponding-ruby))
             (setq ruby-deep-arglist t)
             (setq ruby-deep-indent-paren nil)
             (setq c-tab-always-indent nil)
             (require 'inf-ruby)
             (require 'ruby-compilation)))

(add-hook 'feature-mode-hook
          '(lambda ()
             (if (is-rvmrc-available) (rvm-activate-corresponding-ruby))))

(custom-set-variables
 '(ruby-insert-encoding-magic-comment nil)
 '(rspec-use-rvm nil)
 '(rspec-use-rake-flag nil)
 '(rvm-executable "~/.rvm/bin/rvm"))

(provide 'emacs-ruby)
