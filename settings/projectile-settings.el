(projectile-global-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; Use helm-projectile
(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "M-.") 'helm-etags-select)

(provide 'projectile-settings)
