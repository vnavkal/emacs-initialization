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

(defun resize-startup-frame-sensibly ()
  "Resize the initial frame to a sensible size that fits the screen."
  ;; Calculate the desired size in characters
  (let* ((width-in-pixels (display-pixel-width))
         (height-in-pixels (display-pixel-height))
         (char-width (frame-char-width))
         (char-height (frame-char-height))
         (sensible-width (- (floor (/ width-in-pixels char-width)) 2))
         (sensible-height (- (floor (/ height-in-pixels char-height)) 4)))

    ;; This function now directly resizes the frame that triggered the hook.
    ;; It no longer sets 'initial-frame-alist'.
    (set-frame-size (selected-frame) sensible-width sensible-height t)))

;; Add our function to the 'window-setup-hook'.
;; This hook runs exactly once, after the first frame is created.
(add-hook 'window-setup-hook 'resize-startup-frame-sensibly)

;; default font
(defun custom-set-font()
  (let* ((hostname (system-name))
	     (custom-font (cond ((string= hostname "viraj-XPS-13-9350") "Fira Code 16")
                            ((string= hostname "DESKTOP-VNAVKAL") "Fira Code 14")
                            ((string= hostname "legg-MS-7C84") "Fira Code 22")
			                (t "Fira Code 14"))))
    (set-frame-font custom-font nil t)))
(custom-set-font)
(add-hook 'before-make-frame-hook 'custom-set-font)

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

;; display line number even on large files
(setq line-number-display-limit-width 2000000)

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
(load-theme 'solarized-light t)
(add-hook 'after-make-frame-functions
          (lambda (frame)
	    (let ((mode (if (display-graphic-p frame) 'light 'dark)))
              (set-frame-parameter frame 'background-mode mode)
              (set-terminal-parameter frame 'background-mode mode))
            (enable-theme 'solarized)))

;; enable auto-complete
(ac-config-default)

;; set keys for cycling through buffers
(global-set-key (kbd "C-,") 'previous-buffer)
;; This one sometimes conflicts with an OS emoji hotkey.  See
;; https://askubuntu.com/a/1372952 to unset that.
(global-set-key (kbd "C-.") 'next-buffer)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; turn off warning sound effect
(setq ring-bell-function 'ignore)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; use putty as ssh client on windows
(if (eq system-type 'windows-nt)
	(setq tramp-default-method "plink"))

;; Set auth-sources file as recommended in
;; https://magit.vc/manual/ghub/Storing-a-Token.html
(setq auth-sources '("~/.authinfo"))

;; Ensure auto-complete is installed and set up
(use-package auto-complete
  :ensure t
  :init
  ;; This line activates auto-complete mode globally
  (ac-config-default)
  (global-auto-complete-mode t))


;; Workaround for Wayland clipboard issues
(when (string-equal (getenv "XDG_SESSION_TYPE") "wayland")
  (setq interprogram-paste-function
        (lambda ()
          (shell-command-to-string "wl-paste --no-newline")))
  (setq interprogram-cut-function
        (lambda (text)
          (with-temp-buffer
            (insert text)
            (call-process-region (point-min) (point-max) "wl-copy")))))


(provide 'general-settings)
