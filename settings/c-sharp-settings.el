(defun my-csharp-mode-setup ()
  (setq c-basic-offset 4)
  (setq tab-width 4))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup)

(provide 'c-sharp-settings)
