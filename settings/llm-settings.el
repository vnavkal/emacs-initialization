(use-package chatgpt-shell
  :ensure t
  :custom
  ((chatgpt-shell-openai-key
    (lambda ()
	  ;; Add a line like
	  ;; machine api.openai.com password ****
	  ;; to ~/.authinfo for this to work
      (auth-source-pick-first-password :host "api.openai.com")))))

(provide 'llm-settings)
