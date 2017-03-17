(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-clock-clocktable-default-properties '(:sort (1 . ?a)))
(setq org-startup-truncated nil)

(provide 'org-settings)
