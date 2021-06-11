;; C IDE config
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)

(setq-default c-default-style "linux"
 c-basic-offset 2
 tab-width 2
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

(provide 'c-ide)
