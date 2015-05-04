(setq python-shell-interpreter "~/anaconda/bin/python")

(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 100)))

;; set python color theme to solarized-dark
(add-hook 'python-mode-hook (lambda () (color-theme-solarized-dark)))

(provide 'python-settings)
