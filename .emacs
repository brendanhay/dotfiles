(defvar tmp-dir   "~/tmp/")
(defvar emacs-dir "~/.emacs.d/")

;;
;; Packages
;;

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;;
;; Generic
;;

;; Remove Visual Elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Default mode
(setq default-major-mode 'text-mode)

;; Keyboard
(set-keyboard-coding-system nil)

;; Kill startup message
(setq inhibit-startup-message t)

;; Replace Yes with Y (or N)
(fset 'yes-or-no-p 'y-or-n-p)

;; Line wrap
(set-default 'truncate-lines t)

;; Cua
(cua-mode 0)

;; Startup
(setq inhibit-startup-message t)

;;
;; Bookmarks
;;

(setq bookmark-save-flag 1
      bookmark-default-file (concat emacs-dir "bookmarks"))

;;
;; Theme Paths
;;

(add-to-list 'custom-theme-load-path emacs-dir)

;;
;; Initialise
;;

(add-hook 'after-init-hook
          (lambda ()
            (load (concat emacs-dir "settings.el"))
            (load (concat emacs-dir "functions.el"))
            (load (concat emacs-dir "keys.el"))
            (load (concat emacs-dir "languages.el"))
            (load (concat emacs-dir "theme.el"))))

;;
;; Overrides
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe-mode (quote (10 . 10)) nil (fringe))
 '(line-move-ignore-invisible nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
