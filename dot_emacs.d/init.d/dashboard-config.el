(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
	(setq dashboard-projects-backend 'projectile)
	(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
												)
	      )
	)

(provide 'dashboard-config)
