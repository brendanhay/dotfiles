(custom-set-variables
 '(custom-safe-themes (quote ("01d0ff95b0b897b55f577c241ecab86269870fce" "d2c13a983064a67ccd71fe363ea712b5374fa484" "fa4a96fbf85d8ab62b906268f5ad3e37938c2810" "9cdf9fb94f560902b567b73f65c2ed4e5cfbaafe" default))))

(custom-set-faces
 '(linum ((nil :background "#333" :foreground "#404040")))
 '(vertical-border ((nil (:foreground "#3f3f3f")))))

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

  ;; Winner mode
  (winner-mode -1)

  ;; Startup
  (setq inhibit-startup-message t)
  (server-start)

  ;; Change auto-save directory
  (setq backup-directory-alist `((".*" . ,temp-dir)))
  (setq auto-save-file-name-transforms `((".*" ,temp-dir t))))

(provide 'settings)
