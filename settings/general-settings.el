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

;; Fonts

(defconst my/default-font "Fira Code-14")

;; Ensure the very first frame uses this
(add-to-list 'default-frame-alist `(font . ,my/default-font))

;; Also apply immediately to the current frame when init.el runs
(set-face-attribute 'default nil :font my/default-font)

;; For daemon/GUI frames created later
(add-hook 'after-make-frame-functions
          (lambda (f)
            (with-selected-frame f
              (set-frame-font my/default-font nil t))))

;; Always start frames at 160x40 characters
(add-to-list 'default-frame-alist '(width . 160))
(add-to-list 'default-frame-alist '(height . 40))


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


;; load the solarized color theme, and use the dark mode for the terminal and
;; the light mode for other frames
(use-package solarized-theme
  :straight t
  :defer nil
  :config
  (load-theme 'solarized-light t)
  (add-hook 'after-make-frame-functions
            (lambda (frame)
	      (let ((mode (if (display-graphic-p frame) 'light 'dark)))
                (set-frame-parameter frame 'background-mode mode)
                (set-terminal-parameter frame 'background-mode mode))
              (enable-theme 'solarized))))

;; enable company-mode for completion
(use-package company
  :straight t
  :defer nil
  :config
  (global-company-mode 1)
  :custom
  (company-idle-delay 0.2)
  (company-minimum-prefix-length 1)
  (company-selection-wrap-around t)
  (company-show-numbers t)
  (company-tooltip-align-annotations t)
  (company-require-match 'never)
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous)
         ("TAB" . company-complete-common-or-cycle)
         ("<tab>" . company-complete-common-or-cycle)
         ("S-TAB" . company-select-previous)
         ("<backtab>" . company-select-previous)))

;; Company backend extensions
(use-package company-quickhelp
  :straight t
  :after company
  :config
  (company-quickhelp-mode))

;; Better company popup with icons
(use-package company-box
  :straight t
  :after company
  :hook (company-mode . company-box-mode))

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



;; Workaround for Wayland clipboard issues - force local clipboard for remote files
(when (string-equal (getenv "XDG_SESSION_TYPE") "wayland")
  (setq interprogram-paste-function
        (lambda ()
          (let ((default-directory "~/"))  ; Force local execution
            (shell-command-to-string "wl-paste --no-newline"))))
  (setq interprogram-cut-function
        (lambda (text)
          (let ((default-directory "~/"))  ; Force local execution
            (with-temp-buffer
              (insert text)
              (call-process-region (point-min) (point-max) "wl-copy"))))))


(provide 'general-settings)
