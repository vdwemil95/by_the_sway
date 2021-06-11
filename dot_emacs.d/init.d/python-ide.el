;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy


(use-package python-mode
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python3" . python-mode)
	)

(use-package elpy
  :init
	(elpy-enable)
	(use-package flycheck)
	(use-package rainbow-delimiters)
	(use-package company-jedi)
	(use-package sphinx-doc)
	(use-package company
		:bind
		(:map company-active-map
	      ("C-n". company-select-next)
	      ("C-p". company-select-previous)
	      ("M-<". company-select-first)
	      ("M->". company-select-last)))
	:hook
	(python-mode . elpy-mode)
	(python-mode . sphinx-doc-mode)
	:custom
	(elpy-formatter 'black)
	:config
	(add-to-list 'company-backends 'company-jedi)
	(jedi:setup)
	(setq jedi:setup-keys t)
	)

(add-hook 'elpy-mode-hook (lambda ()(add-hook 'before-save-hook'elpy-format-code nil t)))

(provide 'python-ide)
