;; spell checker
(setq ispell-program-name "hunspell")
;; (setq ispell-hunspell-dict-paths-alist
;;  '(("en_GB" "/usr/share/myspell/dicts/en_GB-large.aff")))

(setq ispell-local-dictionary "en_GB")
(setq ispell-local-dictionary-alist
'(("en_GB" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_GB") nil utf-8)))

(global-set-key (kbd "M-\\") 'ispell-word)

(require 'flyspell-correct-ivy)
(define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-wrapper)

(provide 'text-config)
