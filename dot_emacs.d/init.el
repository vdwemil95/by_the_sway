(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
;; (package-refresh-contents)

;; Installs packages
;;
;; myPackages contains a list of package names
(setq default-directory "~/")

(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

(defvar myPackages
  '(
    material-theme                  ;; Theme
    elpy                            ;; Python
    ivy
    emmet-mode
    prettier-js
    add-node-modules-path
    web-mode
    counsel
    counsel-gtags
    free-keys
    all-the-icons                   ;; icons
    swiper
    flycheck
    py-autopep8
    blacken
    rainbow-delimiters
    company
    magit                           ;; Git integration
    all-the-icons-dired
    all-the-icons-ivy
    all-the-icons-ibuffer
    company-box
    lsp-mode
    )
  )


;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(use-package company-box)

 (mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; Global
(doom-modeline-mode 1)

;; Icons
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(all-the-icons-ivy-setup)
(all-the-icons-ibuffer-mode 1)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; IVY
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; IVY shortcuts
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

(global-set-key (kbd "C-c c") 'counsel-compile)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c L") 'counsel-git-log)
(global-set-key (kbd "C-c k") 'counsel-rg)
(global-set-key (kbd "C-c m") 'counsel-linux-app)
(global-set-key (kbd "C-c n") 'counsel-fzf)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-c J") 'counsel-file-jump)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "C-c w") 'counsel-wmctrl)

(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-c b") 'counsel-bookmark)
(global-set-key (kbd "C-c d") 'counsel-descbinds)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c o") 'counsel-outline)
(global-set-key (kbd "C-c t") 'counsel-load-theme)
(global-set-key (kbd "C-c F") 'counsel-org-file)


;; ====================================
;; Development Setup
;; ====================================
;; Enable elpy

(setq python-shell-interpreter "python3"
      elpy-rpc-python-command "python3"
      )
(elpy-enable)
;; Enable Flycheck

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; (when (require 'flycheck nil t)
;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;  (add-hook 'elpy-mode-hook 'flycheck-mode))
;; (add-hook 'elpy-mode-hook 'jedi:setup)
;; (setq elpy-rpc-backend "jedi")  
;; (setq jedi:complete-on-dot t)                 ; optional


;; Enable autopep8
(require 'py-autopep8)

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'python-mode-hook 'rainbow-delimiters-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("ab0f81acbf7510140b0e592523eb12424b96da7c52bd3e0318c4456d114015a6" "95d0ed21bb0e919be7687a25ad59a1c2c8df78cbe98c9e369d44e65bfd65b167" "75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "7922b14d8971cce37ddb5e487dbc18da5444c47f766178e5a4e72f90437c0711" "89885317e7136d4e86fb842605d47d8329320f0326b62efa236e63ed4be23c58" "afd761c9b0f52ac19764b99d7a4d871fc329f7392dfc6cd29710e8209c691477" default))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#8CD0D3"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#7F9F7F"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#494949"))
 '(objed-cursor-color "#CC9393")
 '(package-selected-packages
   '(clippy doom-modeline doom-themes spacemacs-theme vs-dark-theme clang-format helm helm-lsp dap-mode exec-path-from-shell rustic lsp-mode lsp-ui slime irony free-keys counsel-gtags emmet-mode prettier-js add-node-modules-path web-mode rjsx-mode beacon magit rainbow-delimiters company elpy dashboard flyspell-correct-ivy material-theme nov all-the-icons-ivy all-the-icons-dired all-the-icons-gnus all-the-icons-ibuffer all-the-icons-ivy-rich counsel swiper org-journal))
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
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 162 :width normal)))))

;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'flycheck-mode-hook 'add-node-modules-path)

;; C IDE config
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)

(setq-default c-default-style "linux"
 c-basic-offset 4
                  tab-width 4
                  indent-tabs-mode t)

(with-eval-after-load 'counsel-gtags
  (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
  (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
  (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
  (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward)
  (define-key counsel-gtags-mode-map (kbd "M-f") 'counsel-gtags-find-file-other-window)
  )

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(setq clang-format-style-option "llvm")
(require 'clang-format)
(global-set-key (kbd "C-M-q") 'clang-format-buffer)

;; spell checker
(setq ispell-program-name "hunspell")
(setq ispell-hunspell-dict-paths-alist
 '(("en_GB" "/usr/share/myspell/dicts/en_GB-large.aff")))

(setq ispell-local-dictionary "en_GB")
(setq ispell-local-dictionary-alist
'(("en_GB" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_GB") nil utf-8)))

(global-set-key (kbd "M-\\") 'ispell-word)

(require 'flyspell-correct-ivy)
(define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-wrapper)

(add-hook 'org-mode-hook (lambda ()
			   (flyspell-mode)
			   (auto-fill-mode)
			   ))

(setq inferior-lisp-program "sbcl")

;; Rust env
;; Rust clippy shortcut?


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm
  (setq-local buffer-save-without-query t))

(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable nil))

(use-package company
  :ensure
  :custom
  (company-idle-delay 0.5) ;; how long to wait until popup
  ;; (company-begin-commands nil) ;; uncomment to disable popup
  :bind
  (:map company-active-map
	      ("C-n". company-select-next)
	      ("C-p". company-select-previous)
	      ("M-<". company-select-first)
	      ("M->". company-select-last))
  (:map company-mode-map
	("<tab>". tab-indent-or-complete)
	("TAB". tab-indent-or-complete)))

(setq company-tooltip-align-annotations t)

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(use-package flycheck :ensure)

(use-package exec-path-from-shell
  :ensure
  :init (exec-path-from-shell-initialize))

(use-package dap-mode
  :ensure
  :config
  (dap-ui-mode)
  (dap-ui-controls-mode 1)

  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  ;; installs .extension/vscode
  (dap-gdb-lldb-setup)
  (dap-register-debug-template
   "Rust::LLDB Run Configuration"
   (list :type "lldb"
         :request "launch"
         :name "LLDB::Run"
	 :gdbpath "rust-lldb"
         :target nil
         :cwd nil)))

(add-hook 'rustic-mode-hook
		  'company-mode
		  'electric-pair-mode
		  'rainbow-delimiters-mode
		  )

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rustic-mode))

;; Perl development setup

(add-to-list 'auto-mode-alist '("\\.pl\\'" . cperl-mode))
(add-hook 'cperl-mode
		  'company-mode
		  'electric-pair-mode
		  'rainbow-delimiters-mode
		  )

(provide 'init)
;;; init.el ends here
