;; See https://github.com/joaotavora/eglot/blob/28c1c3a52e1cb7fa7260815eb53700f348d48dd5/eglot.el#L402-L404
(setq eglot-withhold-process-id "1")

(use-package eglot
  :straight t
  :config
  (add-to-list 'eglot-server-programs '(python-mode . ("npx" "pyright-langserver" "--stdio")))
  :hook
  ((python-mode . eglot-ensure))
  :bind (("M-." . xref-find-definitions)
         ("M-/" . xref-find-definitions-other-window)))

(provide 'eglot-settings)
