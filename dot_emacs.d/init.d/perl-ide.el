;; Perl development setup

(use-package cperl-mode
  :mode ("\\.pl\\'" . cperl-mode)
	:config
	(add-hook 'cperl-mode
		  'company-mode
		  'electric-pair-mode
		  'rainbow-delimiters-mode
		  )
	)

(provide 'perl-ide)
