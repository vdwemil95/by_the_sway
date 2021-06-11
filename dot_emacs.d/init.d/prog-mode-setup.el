;; (use-package prog-mode
;; 	:config
;; 	(rainbow-delimiters-mode 1)
;; 	(company-mode 1)
;; 	(flycheck-mode 1)
;; 	(linum-mode 1)
;; 	(electric-pair-mode 1)
;; 	)
(defun prog-minor-modes ()
	(rainbow-delimiters-mode)
	(company-mode)
	(flycheck-mode)
	(linum-mode)
	(electric-pair-mode)
	)

(add-hook 'prog-mode-hook 'prog-minor-modes)

(provide 'prog-mode-setup)
