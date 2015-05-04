;; path where settings files are kept
(add-to-list 'load-path "~/.emacs.d/settings")

(require 'general-settings)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)

;; Set ido to start automatically
(require 'ido)
(ido-mode t)

;; set color theme to solarized-light
(color-theme-solarized-light)

;; Column Marker
(require 'column-marker)

(require 'python-settings)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

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


(add-hook 'ruby-mode-hook (lambda () (interactive) (column-marker-1 100)))

;; Comment region in Ruby
(add-hook 'ruby-mode-hook (lambda () (define-key ruby-mode-map "\C-c#" 'comment-or-uncomment-region)))

;; Activate ruby-mode when rake files are opened
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))

;; Set eshell to non-greedy autocomplete behavior
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Kill all dired buffers
(defun kill-all-dired-buffers ()
  (interactive)
  (save-excursion
    (let ((count 0))
      (dolist (buffer (buffer-list))
	(set-buffer buffer)
	(when (equal major-mode 'dired-mode)
	  (setq count (1+ count))
	  (kill-buffer buffer)))
      (message "Killed %i dired buffer(s)." count))))
(global-set-key (kbd "C-x D") 'kill-all-dired-buffers)

(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

;; Set tags file location
(setq tags-file-name "/home/viraj/upstart_web/TAGS")
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
