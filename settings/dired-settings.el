;; Kill all dired buffers
(defun kill-all-dired-buffers ()
  (interactive)
  (save-excursion
    (let ((count 0))
      (dolist (buffer (buffer-list))
	(set-buffer buffer)
	(when (equal major-mode 'dired-mode)
	  (setq count (1+ count))
	  (kill-buffer buffer)))
      (message "Killed %i dired buffer(s)." count))))
(global-set-key (kbd "C-x D") 'kill-all-dired-buffers)

(provide 'dired-settings)
