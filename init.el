;; path where settings files are kept
(defconst my-settings-dir "~/.emacs.d/settings")
(add-to-list 'load-path my-settings-dir)

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

(require 'column-marker)

;; Mode-specific settings

(require 'python-settings)

(require 'ruby-settings)

(require 'magit-settings)

(require 'eshell-settings)

(require 'emacs-lisp-settings)

(require 'dired-settings)
