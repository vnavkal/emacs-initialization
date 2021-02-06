;; fix bug causing TabError, see
;; https://github.com/jorgenschaefer/elpy/issues/907#issuecomment-224351424
(setq-default indent-tabs-mode nil)

;; fix for "native-completion" error, see
;; https://github.com/jorgenschaefer/elpy/issues/887
;; this can be removed in emacs 25.2
(defun python-shell-completion-native-try ()
  "Return non-nil if can trigger native completion."
  (let ((python-shell-completion-native-enable t)
	   (python-shell-completion-native-output-timeout
	    python-shell-completion-native-try-output-timeout))
       (python-shell-completion-native-get-completions
	(get-buffer-process (current-buffer))
	nil "_")))

(provide 'python-settings)
