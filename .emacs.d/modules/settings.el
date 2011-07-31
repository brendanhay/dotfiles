(progn
  ;; Working dir
  (setq default-directory "~/")

  ;; Soft tabs (spaces)
  (setq-default indent-tabs-mode nil)

  ;; Split windows
  (split-window-horizontally)

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

  ;; Change auto-save directory
  (setq backup-directory-alist `((".*" . ,temp-dir)))
  (setq auto-save-file-name-transforms `((".*" ,temp-dir t))))

(provide 'settings)
