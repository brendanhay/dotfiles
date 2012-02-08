(defvar emacs-dir   "~/.emacs.d/")
(defvar package-dir (concat emacs-dir "pkg/"))
(defvar temp-dir    "~/tmp/")
(defvar init-dir    (concat emacs-dir "init/"))
(defvar theme-dir   (concat emacs-dir "theme/"))

(load (concat emacs-dir "settings.el"))
(load (concat emacs-dir "functions.el"))
(load (concat emacs-dir "keys.el"))
(load (concat emacs-dir "custom.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9cdf9fb94f560902b567b73f65c2ed4e5cfbaafe" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:background "#292829"))))
 '(flymake-warnline ((t (:background "#555"))))
 '(linum ((nil :background "#333" :foreground "#404040")))
 '(vertical-border ((nil (:foreground "#3f3f3f"))))
 '(whitespace-line ((t (:background "black" :foreground "violet"))))
 '(whitespace-tab ((t (:background "black" :foreground "violet"))))
 '(whitespace-trailing ((t (:background "black" :foreground "violet" :weight bold)))))
