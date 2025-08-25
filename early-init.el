;; early-init.el - Emacs 27+ early initialization for faster startup

;; Increase gc-cons-threshold during startup to reduce garbage collection
(setq gc-cons-threshold most-positive-fixnum)

;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)

;; Disable file-name-handler-alist during startup for faster loading
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; UI optimizations - disable early to prevent visual flash
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Disable startup screen and messages
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message user-login-name)
(setq initial-scratch-message nil)

;; Reduce rendering work by setting these early
(setq frame-inhibit-implied-resize t)
(setq ring-bell-function 'ignore)

;; Restore normal values after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216) ; 16mb
            (setq file-name-handler-alist file-name-handler-alist-original)
            (makunbound 'file-name-handler-alist-original)))

;; Add startup time measurement
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))