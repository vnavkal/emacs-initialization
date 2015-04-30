;--------------------------------;
;;; General or Global Settings ;;;
;--------------------------------;

;; language
(setq current-language-environment "English")

;; Set default editor to emacs
(setenv "EDITOR" "emacs")

;; don't show the startup screen
(setq inhibit-startup-screen 1)
;; don't show the menu bar
(menu-bar-mode -1)
;; don't show the tool bar
(require 'tool-bar)
(tool-bar-mode -1)

;; set emacs to share clipboard with system
(setq x-select-enable-clipboard t)

;; default window width and height
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 48))
  (add-to-list 'default-frame-alist '(width . 160))
  (add-to-list 'default-frame-alist '(font . "Monospace-20" )))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

;; require final newlines in files when they are saved
(setq require-final-newline 1)

;; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode 1)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)

(provide 'general-settings)
