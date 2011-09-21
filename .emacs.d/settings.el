(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fa4a96fbf85d8ab62b906268f5ad3e37938c2810" "9cdf9fb94f560902b567b73f65c2ed4e5cfbaafe" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'zenburn)

(progn
  ;; Working dir
  (setq default-directory "~/")

  ;; Soft tabs (spaces)
  (setq-default indent-tabs-mode nil)

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
  (setq bookmark-default-file (concat brendan-dir "bookmarks"))

  ;; Line wrap
  (set-default 'truncate-lines t)

  ;; Cua
  (cua-mode 0)

  ;; Line numbers
  (line-number-mode t)
  (global-linum-mode 1)
  (setq linum-format "%4d ")
  (set-face-attribute 'linum nil :background "#353535" :foreground "#555")

  ;; Winner mode
  (winner-mode -1)

  ;; Startup
  (setq inhibit-startup-message t)
  (server-start)

  ;; Change auto-save directory
  (setq backup-directory-alist `((".*" . ,temp-dir)))
  (setq auto-save-file-name-transforms `((".*" ,temp-dir t))))

(provide 'settings)
