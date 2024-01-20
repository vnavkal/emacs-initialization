(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; path where settings files are kept
(defconst my-settings-dir "~/.emacs.d/settings")
(add-to-list 'load-path my-settings-dir)

;; add all packages in the git directory to load path
(let ((default-directory  "~/.emacs.d/git/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'general-settings)

;; Set ido to start automatically
(require 'ido)
(ido-mode t)

;; Mode-specific settings

(require 'straight-settings)

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

(require 'projectile-settings)

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
 '(package-selected-packages
   '(yaml-mode use-package solarized-theme magit lsp-docker julia-mode helm-projectile dockerfile-mode chatgpt-shell auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
