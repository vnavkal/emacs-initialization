;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(add-hook 'ruby-mode-hook (progn (require 'rinari) (global-rinari-mode)))

;; load variables stored in .env
(defadvice rinari-console (before init-environment activate)
  (source-script "~/upstart_web/.env"))

(defun source-script (script)
   (let ((env (extract-environment script)))
       (mapc 'import-environment-variable (split-string env "\n"))))

(defun extract-environment (script)
   (shell-command-to-string (format "set -a; . %s > /dev/null 2>&1; env" script)))

(defun import-environment-variable (variable-assignment)
   (when (not (or (null variable-assignment) (string= "" variable-assignment)))
      (let* ((key-value-pair (split-string variable-assignment "="))
             (key (car key-value-pair))
             (value (cadr key-value-pair)))
        (setenv key value))))

;; Set column marker at 100 characters
(add-hook 'ruby-mode-hook
	  (lambda () (interactive) (column-marker-1 100)))

;; Comment region in Ruby
(add-hook 'ruby-mode-hook
	  (lambda () (define-key ruby-mode-map "\C-c#" 'comment-or-uncomment-region)))

;; Use tags from upstart_web
(add-hook 'ruby-mode-hook
	  (lambda () (setq tags-file-name "/home/viraj/upstart_web/TAGS")))

;; Define function to update tags
(defun update-rails-ctags ()
  (interactive)
  (let ((default-directory (or (rinari-root) default-directory)))
    (shell-command (concat "ctags -a -e -f " rinari-tags-file-name " --tag-relative -R app lib vendor test"))))

;; Activate ruby-mode when rake files are opened
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(provide 'ruby-settings)
