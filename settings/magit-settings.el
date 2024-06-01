(global-set-key (kbd "C-x g") 'magit-status)

;; don't confirm before pushing
(setq magit-push-always-verify nil)

(use-package forge
  :after magit)

(provide 'magit-settings)
