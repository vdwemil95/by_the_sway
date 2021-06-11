    (setq ibuffer-saved-filter-groups
          (quote (("default"
                   ("dired" (mode . dired-mode))
									 ("python" (mode . python-mode))
                   ("perl" (mode . perl-mode))
                   ("planner" (or
                               (name . "^\\*Calendar\\*$")
                               (name . "^diary$")
                               (mode . muse-mode)
															 (mode . org-agenda-mode)
															 ))
                   ("emacs" (or
                             (name . "^\\*scratch\\*$")
                             (name . "^\\*Messages\\*$")))
                   ("gnus" (or
                            (mode . message-mode)
                            (mode . bbdb-mode)
                            (mode . mail-mode)
                            (mode . gnus-group-mode)
                            (mode . gnus-summary-mode)
                            (mode . gnus-article-mode)
                            (name . "^\\.bbdb$")
                            (name . "^\\.newsrc-dribble")))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")
						(define-key ibuffer-mode-map "G" 'ibuffer-vc-set-filter-groups-by-vc-root)
						(define-key ibuffer-mode-map "C" 'ibuffer-tramp-set-filter-groups-by-tramp-connection)
						))

(defun mount-flash ()
  (interactive)
  (shell-command "udisksctl mount -b /dev/sda1"))

(defun umount-flash ()
  (interactive)
  (shell-command "udisksctl unmount -b /dev/sda1"))

(add-hook 'dired-mode-hook
  (lambda ()
		(local-set-key (kbd "C-M-m") 'mount-flash)
		(local-set-key (kbd "C-M-g") 'umount-flash)
		))
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(provide 'dir-config)
