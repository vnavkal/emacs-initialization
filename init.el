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

(require 'column-marker)

;; Mode-specific settings

(require 'python-settings)

(require 'ruby-settings)

(require 'c-settings)

(require 'magit-settings)

(require 'eshell-settings)

(require 'emacs-lisp-settings)

(require 'dired-settings)

(require 'sql-settings)

(require 'org-settings)

(require 'projectile-settings)
