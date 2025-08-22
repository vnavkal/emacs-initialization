(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :defer t
  :init
  ;; Make sure Emacs knows where node is (adjust if needed).
  (setq copilot-node-executable (executable-find "node"))
  ;; Optional: pick an install dir you control
  ;; (setq copilot-install-dir (expand-file-name "copilot" user-emacs-directory))
  :hook
  ;; Only enable in prog modes *after* server is installed.
  (prog-mode . (lambda ()
                 (when (featurep 'copilot) ; loaded
                   (if (fboundp 'copilot--server-installed-p)
                       (if (copilot--server-installed-p)
                           (copilot-mode 1)
                         (ignore-errors (copilot-install-server)))
                     ;; Fallback: try enabling; if it fails you'll see a message, not a hard error
                     (copilot-mode 1)))))
  :bind (("C-c M-h" . copilot-complete)
         :map copilot-completion-map
         ("C-c C-j" . copilot-clear-overlay)
         ("M-p" . copilot-previous-completion)
         ("M-n" . copilot-next-completion)
         ("C-<tab>" . copilot-accept-completion)
         ("M-f" . copilot-accept-completion-by-word)
         ("M-<return>" . copilot-accept-completion-by-line)))

(provide 'copilot-settings)
