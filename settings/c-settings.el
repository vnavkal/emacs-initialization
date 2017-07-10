(custom-set-variables
 '(helm-gtags-prefix-key "\C-ct")
 '(helm-gtags-suggested-key-mapping t))

(add-hook 'c-mode-common-hook 'helm-gtags-mode)

(provide 'c-settings)
