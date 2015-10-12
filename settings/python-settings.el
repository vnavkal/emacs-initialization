(setq python-shell-interpreter "~/anaconda/bin/python")

(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 100)))

(provide 'python-settings)
