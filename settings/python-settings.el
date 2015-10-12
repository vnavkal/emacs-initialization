(let ((python-binary
      (cond ((file-exists-p "~/anaconda3/bin/ipython") "~/anaconda3/bin/ipython")
	    ((file-exists-p "~/anaconda/bin/ipython") "~/anaconda/bin/ipython"))))
  (setq python-shell-interpreter python-binary))

(add-hook 'python-mode-hook (lambda () (interactive) (column-marker-1 100)))

(provide 'python-settings)
