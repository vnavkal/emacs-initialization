;; Set column marker at 100 characters
(add-hook 'ruby-mode-hook
	  (lambda () (interactive) (column-marker-1 100)))

;; Comment region in Ruby
(add-hook 'ruby-mode-hook
	  (lambda () (define-key ruby-mode-map "\C-c#" 'comment-or-uncomment-region)))

;; Use tags from upstart_web
(add-hook 'ruby-mode-hook
	  (lambda () (setq tags-file-name "~/upstart_web/TAGS")))

;; Define function to update tags
(defun update-rails-ctags ()
  (interactive)
  (shell-command (concat "ripper-tags --emacs -R -f ~/upstart_web/TAGS")))

;; Activate ruby-mode when rake files are opened
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

;; Don't add comment at top of file when non-ascii characters are present
(setq ruby-insert-encoding-magic-comment nil)

(add-hook 'ruby-mode-hook (lambda () (rvm-use-default))) ;; use rvm's default ruby for the current Emacs session

(provide 'ruby-settings)
