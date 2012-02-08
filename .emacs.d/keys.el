;; my minor mode for really global keybindings
(defvar custom-keys-mode-map (make-keymap))

(define-minor-mode custom-keys-mode
  "My minor mode for global keybindings."
  nil
  :lighter nil
  :global t
  :keymap 'custom-keys-mode-map)

;; Movement
(define-key custom-keys-mode-map (kbd "M-p") 'backward-paragraph)
(define-key custom-keys-mode-map (kbd "M-n") 'forward-paragraph)

;; Completion
(define-key custom-keys-mode-map (kbd "M-/") 'my-ido-hippie-expand)

;; Replace
(define-key custom-keys-mode-map (kbd "C-x r") 'replace-string)

;; Find
(define-key custom-keys-mode-map (kbd "C-c f") 'find-file-in-project)
(define-key custom-keys-mode-map (kbd "C-c r") 'rinari-rgrep)
(define-key custom-keys-mode-map (kbd "C-c t") 'my-ido-find-tag)

;; Buffers
(define-key custom-keys-mode-map (kbd "C-c b") 'revert-buffer)
(define-key custom-keys-mode-map (kbd "C-x b") 'ido-switch-buffer)
(define-key custom-keys-mode-map (kbd "C-x n") 'next-user-buffer)
(define-key custom-keys-mode-map (kbd "C-x p") 'previous-user-buffer)

;; Windows
(define-key custom-keys-mode-map (kbd "<right>") 'shrink-window-horizontally)
(define-key custom-keys-mode-map (kbd "<left>") 'enlarge-window-horizontally)
(define-key custom-keys-mode-map (kbd "<up>") 'shrink-window)
(define-key custom-keys-mode-map (kbd "<down>") 'enlarge-window)

;; Bookmarks
(define-key custom-keys-mode-map (kbd "M-,") 'bookmark-jump)
(define-key custom-keys-mode-map (kbd "M-.") 'bookmark-set)

;; Org-capture
(define-key custom-keys-mode-map (kbd "C-c c") 'org-capture)

;; Slime / Clojure
(define-key custom-keys-mode-map (kbd "C-c C-j") 'clojure-jack-in)

;; Occur
(define-key custom-keys-mode-map (kbd "M-s o") 'occur-multi-in-current-mode)

;; Align
(define-key custom-keys-mode-map (kbd "C-c a") 'align-regexp)

;; Extend Selection
(define-key custom-keys-mode-map (kbd "C-c s") 'extend-selection)

;; Remove suspend frame
(global-unset-key (kbd "C-z"))

;; Zap back to char
(define-key custom-keys-mode-map (kbd "C-z") 'zap-back-to-char)

;; Kill selected region, or line if no active region
(define-key custom-keys-mode-map (kbd "C-k") 'kill-region)

;; pbcopy/pbpaste
(define-key custom-keys-mode-map (kbd "C-x C-y") 'pbpaste)
(define-key custom-keys-mode-map (kbd "C-x M-w") 'pbcopy)

(defun my-minibuffer-setup-hook ()
  (custom-keys-mode 0))

(add-hook 'slime-repl-mode-hook
          (lambda () (custom-keys-mode t)))

(custom-keys-mode t)
