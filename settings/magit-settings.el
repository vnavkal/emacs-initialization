(global-set-key (kbd "C-x g") 'magit-status)

(use-package magit
  :straight t
  :commands (magit-status magit-blame)
  :bind (("C-x g" . magit-status)))

;; don't confirm before pushing
(setq magit-push-always-verify nil)

(use-package forge
  :after magit)

(provide 'magit-settings)
