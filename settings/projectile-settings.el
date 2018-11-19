(projectile-global-mode)

;; Use helm-projectile
(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "M-.") 'helm-etags-select)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'projectile-settings)
