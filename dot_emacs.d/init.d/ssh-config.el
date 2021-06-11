(setq tramp-default-method "ssh")
(define-key global-map (kbd "C-M-`") 'counsel-tramp)

(provide 'ssh-config)
