;; See https://github.com/joaotavora/eglot/blob/28c1c3a52e1cb7fa7260815eb53700f348d48dd5/eglot.el#L402-L404
(setq eglot-withhold-process-id "1")
(add-hook 'python-mode-hook 'eglot-ensure)

(provide 'eglot-settings)
