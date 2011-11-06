(defvar ergo-minor-mode-map (make-sparse-keymap)
  "ergo-minor-mode keymap.")

;; Left hand, modifier Meta (mapped to Quote('), which is now Option_R)
(define-key ergo-minor-mode-map (kbd "M-q")        'keyboard-escape-quit)
(define-key ergo-minor-mode-map (kbd "C-q")        'save-buffers-kill-terminal)
(define-key ergo-minor-mode-map (kbd "M-w")        'backward-kill-word)
(define-key ergo-minor-mode-map (kbd "M-e")        'kill-line)
(define-key ergo-minor-mode-map (kbd "M-r")        'kill-word)
(define-key ergo-minor-mode-map (kbd "M-t")        'toggle-letter-case)
(define-key ergo-minor-mode-map (kbd "M-a")        'execute-extended-command)
(define-key ergo-minor-mode-map (kbd "C-a")        'shell-command)
(define-key ergo-minor-mode-map (kbd "M-s")        'delete-backward-char)
(define-key ergo-minor-mode-map (kbd "M-d")        'kill-line-backward)
(define-key ergo-minor-mode-map (kbd "M-f")        'delete-char)
(define-key ergo-minor-mode-map (kbd "C-g")        'extend-selection)     ; Expands selection of point to word, line, etc.
(define-key ergo-minor-mode-map (kbd "M-g")        'select-text-in-quote) ; Selects text inside quotes, sexp, expression
(define-key ergo-minor-mode-map (kbd "M-z")        'undo)
(define-key ergo-minor-mode-map (kbd "C-z")        'redo)
(define-key ergo-minor-mode-map (kbd "M-x")        'kill-region)          ; Cuts region if exists, or line
(define-key ergo-minor-mode-map (kbd "C-x")        'cut-all)
(define-key ergo-minor-mode-map (kbd "M-c")        'kill-ring-save)       ; Copies region if exists, or line
(define-key ergo-minor-mode-map (kbd "C-c")        'copy-all)
(define-key ergo-minor-mode-map (kbd "M-v")        'yank)
(define-key ergo-minor-mode-map (kbd "C-v")        'yank-pop)
(define-key ergo-minor-mode-map (kbd "M-b")        'next-user-buffer)
(define-key ergo-minor-mode-map (kbd "C-b")        'previous-user-buffer)

;; Right hand, modifier Control (mapped to apple caps_lock on left pinky)
(define-key ergo-minor-mode-map (kbd "C-u")        'backward-word)
(define-key ergo-minor-mode-map (kbd "M-u")        'backward-paragraph)
(define-key ergo-minor-mode-map (kbd "C-i")        'previous-line)
(define-key ergo-minor-mode-map (kbd "M-i")        'scroll-up)
(define-key ergo-minor-mode-map (kbd "C-o")        'forward-word)
(define-key ergo-minor-mode-map (kbd "M-o")        'forward-paragraph)
(define-key ergo-minor-mode-map (kbd "C-p")        'replace-string)
(define-key ergo-minor-mode-map (kbd "M-p")        'replace-regexp)
(define-key ergo-minor-mode-map (kbd "C-h")        'beginning-of-buffer)
(define-key ergo-minor-mode-map (kbd "M-h")        'end-of-buffer)
(define-key ergo-minor-mode-map (kbd "C-j")        'backward-char)
(define-key ergo-minor-mode-map (kbd "M-j")        'move-beginning-of-line)
(define-key ergo-minor-mode-map (kbd "C-k")        'next-line)
(define-key ergo-minor-mode-map (kbd "M-k")        'scroll-down)
(define-key ergo-minor-mode-map (kbd "C-l")        'forward-char)
(define-key ergo-minor-mode-map (kbd "M-l")        'move-end-of-line)
(define-key ergo-minor-mode-map (kbd "C-;")        'search-forward)
(define-key ergo-minor-mode-map (kbd "M-;")        'search-backward)
(define-key ergo-minor-mode-map (kbd "C-'")        'comment-region)
(define-key ergo-minor-mode-map (kbd "M-'")        'uncomment-region)
(define-key ergo-minor-mode-map (kbd "C-m")        'ido-switch-buffer)
(define-key ergo-minor-mode-map (kbd "M-m")        'buffer-menu)
(define-key ergo-minor-mode-map (kbd "C-n")        'move-cursor-next-pane)
(define-key ergo-minor-mode-map (kbd "M-n")        'move-cursor-previous-pane)
(define-key ergo-minor-mode-map (kbd "C-,")        'bookmark-jump)
(define-key ergo-minor-mode-map (kbd "M-,")        'bookmark-set)
(define-key ergo-minor-mode-map (kbd "C-.")        'ido-find-file)
(define-key ergo-minor-mode-map (kbd "M-.")        'find-file-in-project)
(define-key ergo-minor-mode-map (kbd "C-/")        'hippie-expand)

;; Any hand!
;(define-key ergo-minor-mode-map (kbd "C-x s")     'save-buffer)
(define-key ergo-minor-mode-map (kbd "C-<space>")  'set-mark-command)
(define-key ergo-minor-mode-map (kbd "M-<space>")  'mark-paragraph)

(define-minor-mode ergo-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  nil
  :lighter nil
  :global t
  :keymap ergo-minor-mode-map)

(defun my-minibuffer-setup-hook ()
  (ergo-minor-mode 0))

(provide 'ergo-minor-mode)
(ergo-minor-mode 1)
