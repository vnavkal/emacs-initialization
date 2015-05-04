;; Set eshell to non-greedy autocomplete behavior
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

(provide 'eshell-settings)
