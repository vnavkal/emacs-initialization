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
(setq require-final-newline 't)

;; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode 1)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)

;; enable downcase-region and upcase-region
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; disable prompt that appears when file was modified by another program
;; this is not ideal, I have to do it because Insync touches files
(defun ask-user-about-supersession-threat (fn)
  "blatantly ignore files that changed on disk"
  )
(defun ask-user-about-lock (file opponent)
  "always grab lock"
   t)

;; load the solarized color theme, and use the dark mode for the terminal and
;; the light mode for other frames
(load-theme 'solarized t)
(add-hook 'after-make-frame-functions
          (lambda (frame)
	    (let ((mode (if (display-graphic-p frame) 'light 'dark)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'solarized)))

(provide 'general-settings)
