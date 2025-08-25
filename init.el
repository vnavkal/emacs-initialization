;; path where settings files are kept
(defconst my-settings-dir "~/.emacs.d/settings")
(add-to-list 'load-path my-settings-dir)

;; add all packages in the git directory to load path
(let ((default-directory  "~/.emacs.d/git/"))
  (normal-top-level-add-subdirs-to-load-path))

;; install straight early so it can be used to install
;; other packages
(require 'straight-settings)

(require 'general-settings)

;; Set ido to start automatically
(require 'ido)
(ido-mode t)

;; Mode-specific settings

(require 'python-settings)

(require 'typescript-settings)

(require 'ruby-settings)

(require 'c-settings)

(require 'c-sharp-settings)

(require 'magit-settings)

(require 'eshell-settings)

(require 'shell-settings)

(require 'emacs-lisp-settings)

(require 'dired-settings)

(require 'sql-settings)

(require 'org-settings)

(require 'llm-settings)

(require 'copilot-settings)

(require 'eglot-settings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-gtags-prefix-key "t")
 '(helm-gtags-suggested-key-mapping t)
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
