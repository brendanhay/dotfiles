(load-theme 'zenburn)

;; Initial directory
(setq default-directory base-dir)

;; Backups
(setq backup-directory-alist `((".*" . ,temp-dir)))
(setq auto-save-file-name-transforms `((".*" ,temp-dir t)))

;; Show columns
(setq column-number-mode 1)

;; Fill columns
(require 'fill-column-indicator)
(setq fci-rule-color "gray20")
(setq fci-always-use-textual-rule t)
(setq fci-rule-width 10)

(define-globalized-minor-mode global-fci-mode
  fci-mode (lambda ()
             (setq fill-column 80)
             (fci-mode 1)))

(global-fci-mode 1)

;; Soft tabs (spaces)
(setq-default indent-tabs-mode nil)

;; Show whitespace
(require 'whitespace)
(setq whitespace-line-column fill-column)
(setq whitespace-style '(face tabs trailing))
(global-whitespace-mode 1)

;; Split windows
(split-window-horizontally)

;; No menu bar
(menu-bar-mode -1)

;; Default mode
(setq default-major-mode 'text-mode)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; Keyboard
(set-keyboard-coding-system nil)

;; Highlight parens
(show-paren-mode t)

;; Kill startup message
(setq inhibit-startup-message t)

;; Replace Yes with Y (or N)
(fset 'yes-or-no-p 'y-or-n-p)

;; Bookmarks
(setq bookmark-save-flag 1)
(setq bookmark-default-file (concat emacs-dir "bookmarks"))

;; Line wrap
(set-default 'truncate-lines t)

;; Cua
(cua-mode 0)

;; Line numbers
(line-number-mode t)
(global-linum-mode 1)
(setq linum-format "%4d ")

;; Winner mode
(winner-mode -1)

;; Startup
(setq inhibit-startup-message t)
(server-start)

;; Change auto-save directory
(setq backup-directory-alist `((".*" . ,temp-dir)))
(setq auto-save-file-name-transforms `((".*" ,temp-dir t)))

;; Org-mode
(setq org-default-notes-file "~/Dropbox/Documents/org/refile.org")

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Dropbox/Documents/org/todo.org")
               "* TODO %^{Description} %^g\n%?  Added: %U")

              ("n" "note" entry (file "~/Dropbox/Documents/org/notes.org")
               "* %? :NOTE:\n%U\n%a\n  %i" :clock-in t :clock-resume t)
              ("s" "study" entry (file "~/Dropbox/Documents/org/study.org")
               "* %? :STUDY:\n%U\n%a\n  %i" :clock-in t :clock-resume t)
              ("f" "follow-up" entry (file "~/Dropbox/Documents/org/followup.org")
               "* FOLLOWUP %? :FOLLOWUP:\n%U" :clock-in t :clock-resume t))))

;; Various face adjustments
(custom-set-faces
 '(linum ((nil :background "#333" :foreground "#404040")))
 '(flymake-warnline ((t (:background "#5f5f5f"))))
 '(flymake-errline ((t (:background "#332323"))))
 '(vertical-border ((nil (:foreground "#3f3f3f"))))
 '(whitespace-line ((t (:background "black" :foreground "violet"))))
 '(whitespace-tab ((t (:background "black" :foreground "violet"))))
 '(whitespace-trailing ((t (:background "black" :foreground "violet" :weight bold)))))

(font-lock-add-keywords 'erlang-mode
                        '(("^\\(-\\<spec .+\\)$" 1 '(:foreground "#777" :background "#3a3a3a") prepend)))

;; Add xxx/todo highlighting to specific major modes
(mapcar (lambda (mode)
          (font-lock-add-keywords mode
                                  '(("\\<\\(XXX\\):" 1 font-lock-warning-face prepend)
                                    ("\\<\\(TODO\\):" 1 '(:foreground "#f0dfaf" :background "#506070") prepend))))
        '(text-mode lisp-mode emacs-lisp-mode erlang-mode ruby-mode))

(make-hippie-expand-function
 '(try-expand-dabbrev-visible
   try-expand-dabbrev-from-kill
   try-expand-dabbrev-all-buffers
   try-complete-file-name-partially
   try-complete-file-name))

(setq enable-recursive-minibuffers t)

;; IDO
(require 'ido)
(ido-mode t)
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(defun ido-disable-line-trucation ()
  (set (make-local-variable 'truncate-lines) nil))

(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

;; Rinari/Ruby
(setq rinari-tags-file-name "TAGS")
(setq ruby-insert-encoding-magic-comment nil)
