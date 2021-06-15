(add-hook 'sh-mode-hook 'flycheck-mode)

(add-hook 'sh-mode-hook (lambda () (setq indent-tabs-mode nil)))

(provide 'shell-settings)
