;; Apparently the typescript-mode doesn't completely support tsx,
;; but this seems to work fine for me
(add-to-list 'auto-mode-alist '("\.tsx?$" . typescript-mode))

(provide 'typescript-settings)
