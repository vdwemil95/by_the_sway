(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq default-directory "~/")

(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

(add-to-list 'load-path "~/.emacs.d/init.d/")
(require 'global-config)
(require 'prog-mode-setup)
(require 'dashboard-config)
(require 'rust-ide)
(require 'python-ide)
(require 'perl-ide)
(require 'c-ide)
(require 'text-config)
(require 'treemacs-config)
(require 'ssh-config)
(require 'org-config)
(require 'diary-config)
(require 'dir-config)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(ansi-color-names-vector
	 ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes '(spacemacs-light))
 '(custom-safe-themes
	 '("ab0f81acbf7510140b0e592523eb12424b96da7c52bd3e0318c4456d114015a6" "95d0ed21bb0e919be7687a25ad59a1c2c8df78cbe98c9e369d44e65bfd65b167" "75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "7922b14d8971cce37ddb5e487dbc18da5444c47f766178e5a4e72f90437c0711" "89885317e7136d4e86fb842605d47d8329320f0326b62efa236e63ed4be23c58" "afd761c9b0f52ac19764b99d7a4d871fc329f7392dfc6cd29710e8209c691477" default))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#8CD0D3"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#7F9F7F"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#494949"))
 '(objed-cursor-color "#CC9393")
 '(package-selected-packages
	 '(all-the-icons-dired ibuffer-tramp ibuffer-vc vterm yasnippet-snippets sphinx-doc treemacs-all-the-icons counsel-tramp projectile all-the-icons elpher company-jedi magit-svn clippy doom-modeline doom-themes spacemacs-theme clang-format helm helm-lsp dap-mode exec-path-from-shell rustic lsp-mode lsp-ui slime irony free-keys counsel-gtags emmet-mode prettier-js add-node-modules-path web-mode rjsx-mode beacon magit rainbow-delimiters company elpy dashboard flyspell-correct-ivy material-theme nov all-the-icons-ivy all-the-icons-gnus all-the-icons-ibuffer all-the-icons-ivy-rich counsel swiper org-journal))
 '(rustic-ansi-faces
	 ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCDC"])
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
	 '((20 . "#f36c60")
		 (40 . "#ff9800")
		 (60 . "#fff59d")
		 (80 . "#8bc34a")
		 (100 . "#81d4fa")
		 (120 . "#4dd0e1")
		 (140 . "#b39ddb")
		 (160 . "#f36c60")
		 (180 . "#ff9800")
		 (200 . "#fff59d")
		 (220 . "#8bc34a")
		 (240 . "#81d4fa")
		 (260 . "#4dd0e1")
		 (280 . "#b39ddb")
		 (300 . "#f36c60")
		 (320 . "#ff9800")
		 (340 . "#fff59d")
		 (360 . "#8bc34a")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "SauceCodePro Nerd Font" :foundry "ADBO" :slant normal :weight normal :height 151 :width normal)))))

;; Enable flycheck globally
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; (add-hook 'flycheck-mode-hook 'add-node-modules-path)

(setq inferior-lisp-program "sbcl")

;; (use-package company
;;   :ensure
;;   :custom
;;   (company-idle-delay 0.5) ;; how long to wait until popup
;;   ;; (company-begin-commands nil) ;; uncomment to disable popup
;;   :bind
;;   (:map company-active-map
;; 	      ("C-n". company-select-next)
;; 	      ("C-p". company-select-previous)
;; 	      ("M-<". company-select-first)
;; 	      ("M->". company-select-last))
;;   (:map company-mode-map
;; 	("<tab>". tab-indent-or-complete)
;; 	("TAB". tab-indent-or-complete)))

;; (setq company-tooltip-align-annotations t)


(provide 'init)
;;; init.el ends here
