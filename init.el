(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(python-shell-interpreter "~/anaconda/bin/python"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq default-frame-alist '(
                (width . 160)
                (height . 48) ))

(set-face-attribute 'default nil :height 160)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)

;; set emacs to share clipboard with system
(setq x-select-enable-clipboard t)

;; set color theme to solarized-light
(color-theme-solarized-light)

;; remove menu bar and toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; load fill-column-indicator in ruby and python
;;(require 'fill-column-indicator)
;;(setq fci-rule-width 1)
;;(setq fci-rule-color "darkblue")
;;(add-hook 'ruby-mode-hook 'fci-mode)
;;(setq-default fill-column 140)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; Set default editor to emacs
(setenv "EDITOR" "emacs")

;; Column Marker
(require 'column-marker)
(add-hook 'ruby-mode-hook (lambda () (interactive) (column-marker-1 140)))

;; Comment region in Ruby
(add-hook 'ruby-mode-hook (lambda () (define-key ruby-mode-map "\C-c#" 'comment-or-uncomment-region)))

;; Set eshell to non-greedy autocomplete behavior
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))
