(defvar custom-keys-mode-map (make-keymap))

(define-minor-mode custom-keys-mode
  "Minor mode for global keybindings."
  nil
  :lighter nil
  :global t
  :keymap 'custom-keys-mode-map)

;; Movement
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; Replace
(define-key custom-keys-mode-map (kbd "C-x r") 'replace-string)
(define-key custom-keys-mode-map (kbd "C-x R") 'replace-regexp)

;; Find
(define-key custom-keys-mode-map (kbd "C-x f") 'find-file-in-project)
(define-key custom-keys-mode-map (kbd "C-x F") 'ack-and-a-half-find-file)
(define-key custom-keys-mode-map (kbd "C-c r") 'ack-and-a-half)

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

;; (defun custom-minibuffer-setup-hook ()
;;   (custom-keys-mode 0))

(custom-keys-mode t)
