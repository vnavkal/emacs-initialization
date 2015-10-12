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

(require 'general-settings)

;; Set ido to start automatically
(require 'ido)
(ido-mode t)

(require 'column-marker)

;; Mode-specific settings

(require 'python-settings)

(require 'ruby-settings)

(require 'magit-settings)

(require 'eshell-settings)

(require 'emacs-lisp-settings)

(require 'dired-settings)

(require 'org-settings)

(enable-theme 'solarized)
