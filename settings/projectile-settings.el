(projectile-global-mode)

;; 1. Ensure projectile is installed and enabled
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1))

;; 2. Ensure helm is installed and set up
(use-package helm
  :ensure t
  :config
  (helm-mode 1))

;; 3. Ensure helm-projectile is installed, but only load it AFTER
;;    both helm and projectile are ready.
(use-package helm-projectile
  :ensure t
  :after (:all helm projectile)
  :config
  ;; This enables the integration
  (helm-projectile-on))

;; Use helm-projectile
(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "M-.") 'helm-etags-select)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq projectile-use-git-grep t)

(provide 'projectile-settings)
