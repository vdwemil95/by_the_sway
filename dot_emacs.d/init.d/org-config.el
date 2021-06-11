(add-hook 'org-mode-hook (lambda ()
			   (flyspell-mode)
			   (auto-fill-mode)
			   ))

;; Keybindings
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key (kbd "C->") 'org-capture)

(setq org-directory "~/Documents/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-agenda-files (list "~/Documents/agenda" "~/Documents/org"))
(setq org-log-done 'note)
(setq org-archive-subtree-save-file-p t)

(setq org-todo-keywords
      '(
				(sequence "TODO(t)" "|" "DONE(d)" "DELAYED(b)" "ABANDONED(a)")
				(sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "LOGGED(l)" "FIXED(f)")
				(sequence "|" "CANCELED(c)")
				)
			)

;; My diary

;; (setq org-todo-keyword-faces
;;       '(("STARTED" . "yellow")
;;         ("CANCELED" . (:foreground "blue" :weight bold))))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; Tags
(setq org-tag-alist '((:startgrouptag)
                      ("work")
                      (:grouptags)
											("Hennie")
                      ("lab")
                      ("test")
											("dev")
											("investigate")
											("bug")
                      (:endgrouptag)
                      (:startgrouptag)
                      ("personal")
                      (:grouptags)
                      ("system")
                      ("research")
                      (:endgrouptag)))

(provide 'org-config)
