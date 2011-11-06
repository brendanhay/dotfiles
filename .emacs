(defvar base-dir "~/")
(defvar emacs-dir (concat base-dir ".emacs.d/"))
(defvar package-dir (concat emacs-dir "packages/"))
(defvar temp-dir (concat emacs-dir "temp/"))

;; Packages
(setq package-user-dir package-dir)

(when (load (expand-file-name (concat emacs-dir "package.el")))
  (package-initialize))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(load (concat emacs-dir "functions.el"))
(load (concat emacs-dir "keys.el"))
(load (concat emacs-dir "settings.el"))
;(load (concat emacs-dir "bindings.el"))

;; (global-set-key (kbd "C-l") 'event-apply-hyper-modifier)
;;(define-key key-translation-map (kbd "C-") 'event-apply-super-modifier)

(defvar erlang-dir "/usr/local/Cellar/erlang/R14B03/")

(setq erlang-root-dir erlang-dir)
(setq exec-path (cons erlang-dir exec-path))

(setq load-path (cons (concat emacs-dir "erlang") load-path))

(require 'erlang-start)
(require 'erlang-flymake)

;; OSX copy/paste in terminal
(load (concat emacs-dir "pbcopy.el"))
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
 '(flymake-errline ((t (:background "#332323"))))
 '(flymake-warnline ((t (:background "#5f5f5f"))))
 '(linum ((nil :background "#333" :foreground "#404040")))
 '(vertical-border ((nil (:foreground "#3f3f3f"))))
 '(whitespace-line ((t (:background "black" :foreground "violet"))))
 '(whitespace-tab ((t (:background "black" :foreground "violet"))))
 '(whitespace-trailing ((t (:background "black" :foreground "violet" :weight bold)))))
