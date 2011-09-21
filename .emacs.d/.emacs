(defvar base-dir "~/")
(defvar app-dir (concat base-dir "app/"))
(defvar lang-dir (concat base-dir "lang/"))
(defvar tool-dir (concat base-dir "tool/"))
(defvar brendan-dir (concat base-dir ".emacs.d/"))
(defvar package-dir (concat brendan-dir "packages/"))
(defvar config-dir (concat brendan-dir "config/"))
(defvar temp-dir (concat brendan-dir "temp/"))

;; Packages
(setq package-user-dir package-dir)
(when (load (expand-file-name (concat brendan-dir "package.el"))) (package-initialize))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))

(load (concat brendan-dir "keys.el"))
(load (concat brendan-dir "settings.el"))

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
