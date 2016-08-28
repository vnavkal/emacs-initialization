(let ((python-binary
       (cond ((file-exists-p "~/anaconda3/bin/ipython") "~/anaconda3/bin/ipython")
	     ((file-exists-p "~/miniconda3/bin/ipython") "~/miniconda3/bin/ipython")
	     ((file-exists-p "~/anaconda/bin/ipython") "~/anaconda/bin/ipython"))))
  (setq python-shell-interpreter python-binary))

(setq python-shell-interpreter-args "--simple-prompt -i")

(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 100)))

(provide 'python-settings)
