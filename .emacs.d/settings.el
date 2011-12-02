;; Packages
(setq package-user-dir (concat package-dir "remote/"))

(when (load (expand-file-name (concat package-dir "local/package.el")))
  (package-initialize))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Make local packages known
(add-to-list 'load-path (concat package-dir "local"))

;; Load local initializers
(mapcar
 (lambda (file) (load (concat init-dir file)))
 (directory-files init-dir nil ".el$"))

;; Initial directory
(setq default-directory "~/")

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

(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (setq fill-column 80) (fci-mode 1)))

(global-fci-mode 1)

;; Soft tabs
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
(winner-mode 1)

;; Startup
(setq inhibit-startup-message t)

;; Change auto-save directory
(setq backup-directory-alist `((".*" . ,temp-dir)))
(setq auto-save-file-name-transforms `((".*" ,temp-dir t)))

;; Add xxx/todo highlighting to specific major modes
(mapcar
 (lambda (mode)
   (font-lock-add-keywords mode
                           '(("\\<\\(XXX\\):" 1 font-lock-warning-face prepend)
                             ("\\<\\(TODO\\):" 1 '(:foreground "#f0dfaf" :background "#506070") prepend))))
 '(text-mode lisp-mode emacs-lisp-mode erlang-mode ruby-mode))

;; Hippie
(make-hippie-expand-function
 '(try-expand-dabbrev-visible
   try-expand-dabbrev
   try-expand-dabbrev-from-kill
   try-expand-dabbrev-all-buffers))

;; Minibuffers
(setq enable-recursive-minibuffers t)

;; IDO
(require 'ido)
(ido-mode t)

(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

(defun ido-disable-line-trucation ()
  (set (make-local-variable 'truncate-lines) nil))

(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)

;; Command statistics
(require 'command-frequency)
(command-frequency-mode 1)
(command-frequency-autosave-mode 1)

;; Start up ze server
(server-start)

;; Set themes dir
(add-to-list 'custom-theme-load-path theme-dir)

;; Theme!
(load-theme 'zenburn)

;; Enable skeleton-pair insert globally
(setq skeleton-pair t)

;; Don't apply skeleton-pair from the front of a word
(setq skeleton-pair-on-word nil)

(global-set-key (kbd "(")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "[")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "{")  'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)




