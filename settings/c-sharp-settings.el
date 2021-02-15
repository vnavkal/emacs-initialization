(defun my-csharp-mode-setup ()
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)

  (setq c-basic-offset 4)
  (setq tab-width 4)

  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup)

(provide 'c-sharp-settings)
