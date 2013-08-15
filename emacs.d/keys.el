(defvar custom-keys-mode-map (make-keymap))

(define-minor-mode custom-keys-mode
  "Minor mode for global keybindings."
  nil
  :lighter nil
  :global t
  :keymap 'custom-keys-mode-map)

;; Regex ISearch
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; Movement
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; Clipboard
(global-set-key (kbd "C-c c") 'pbcopy)
(global-set-key (kbd "C-c p") 'pbpaste)

;; Indent/outdent blocks
(define-key custom-keys-mode-map (kbd "M-.") 'my-indent-region)
(define-key custom-keys-mode-map (kbd "M-,") 'my-unindent-region)

;; Replace
(define-key custom-keys-mode-map (kbd "C-c r") 'replace-regexp)
(define-key custom-keys-mode-map (kbd "C-c R") 'replace-string)

;; Find
(define-key custom-keys-mode-map (kbd "C-c f") 'find-file-in-project)
(define-key custom-keys-mode-map (kbd "C-c F") 'ack-and-a-half-find-file)
(define-key custom-keys-mode-map (kbd "C-c C-f") 'ack-and-a-half)

;; Buffers
(define-key custom-keys-mode-map (kbd "C-c b") 'revert-buffer)
(define-key custom-keys-mode-map (kbd "C-x b") 'ido-switch-buffer)
(define-key custom-keys-mode-map (kbd "C-x n") 'next-user-buffer)
(define-key custom-keys-mode-map (kbd "C-x p") 'previous-user-buffer)

;; Windows
(global-unset-key (kbd "C-x o"))
(global-unset-key (kbd "M-o"))

(define-key custom-keys-mode-map (kbd "M-h") 'windmove-left)
(define-key custom-keys-mode-map (kbd "M-l") 'windmove-right)
(define-key custom-keys-mode-map (kbd "M-k") 'windmove-up)
(define-key custom-keys-mode-map (kbd "M-j") 'windmove-down)

(define-key custom-keys-mode-map (kbd "M-H") 'shrink-window-horizontally)
(define-key custom-keys-mode-map (kbd "M-L") 'enlarge-window-horizontally)
(define-key custom-keys-mode-map (kbd "M-K") 'shrink-window)
(define-key custom-keys-mode-map (kbd "M-J") 'enlarge-window)

;; Bookmarks
(define-key custom-keys-mode-map (kbd "C-c ,") 'bookmark-jump)
(define-key custom-keys-mode-map (kbd "C-c .") 'bookmark-set)

;; Occur
(define-key custom-keys-mode-map (kbd "C-c o") 'multi-occur-in-this-mode)

;; Align
(define-key custom-keys-mode-map (kbd "C-c a") 'align-regexp)

;; Extend Selection
(define-key custom-keys-mode-map (kbd "C-c s") 'extend-selection)

;; Wrap Text
(define-key custom-keys-mode-map (kbd "C-c w") 'fill-region)

;; Camel Case
(define-key custom-keys-mode-map (kbd "C-c y") 'camelscore-word-at-point)

;; Remove suspend frame
(global-unset-key (kbd "C-z"))

;; Zap back to char
(define-key custom-keys-mode-map (kbd "C-z") 'zap-back-to-char)

;; Kill selected region, or line if no active region
(define-key custom-keys-mode-map (kbd "C-k") 'kill-region)

;; Toggle relative line numbers
(define-key custom-keys-mode-map (kbd "C-c l") 'linum-relative-toggle)

;; Toggle vim emulation
(define-key custom-keys-mode-map (kbd "C-c e") 'evil-mode)

(custom-keys-mode t)
