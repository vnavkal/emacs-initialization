(setq sql-postgres-login-params
      '((user :default "vwaj")
        (database :default "development")
        (server :default "localhost")
        (port :default 5432)))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

(provide 'sql-settings)
