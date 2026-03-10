(global-set-key (kbd "C-x g") 'magit-status)

(use-package magit
  :straight t
  :commands (magit-status magit-blame)
  :bind (("C-x g" . magit-status)))

;; don't confirm before pushing
(setq magit-push-always-verify nil)

;; fewer commits in status log = fewer tag-lookup SSH round-trips over TRAMP
(setq magit-log-section-commit-count 5)

(use-package forge
  :after magit)

(provide 'magit-settings)
