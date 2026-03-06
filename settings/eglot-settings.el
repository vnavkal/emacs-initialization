;; See https://github.com/joaotavora/eglot/blob/28c1c3a52e1cb7fa7260815eb53700f348d48dd5/eglot.el#L402-L404
(setq eglot-withhold-process-id "1")

(use-package eglot
  :straight t
  :commands (eglot eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(python-mode . ("uv" "run" "ty" "server")))
  :hook
  ((python-mode . eglot-ensure))
  :bind (("M-." . xref-find-definitions)
         ("M-/" . xref-find-definitions-other-window)))

(connection-local-set-profile-variables
 'remote-uv-profile
 '((tramp-remote-path . (tramp-own-remote-path "/home/viraj/.local/bin"))))

(connection-local-set-profiles
 '(:application tramp :protocol "ssh")
 'remote-uv-profile)

(provide 'eglot-settings)
