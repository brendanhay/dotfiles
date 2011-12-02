;; Movement
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; Comments
(global-set-key (kbd "C-\\") 'uncomment-region)
(global-set-key (kbd "C-]") 'comment-region)

;; Completion
(global-set-key (kbd "M-/") 'hippie-expand)

;; Replace
(global-set-key (kbd "C-x r") 'replace-string)

;; Tags
(global-set-key (kbd "M-l") 'my-ido-find-tag)

;; Buffers

(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-<delete>") 'my-kill-buffer)

;; Terminal Buffers
(global-set-key (kbd "C-x b") 'ido-switch-buffer)
(global-set-key (kbd "C-x n") 'next-buffer)
(global-set-key (kbd "C-x p") 'previous-buffer)

;; Windows
(global-set-key (kbd "<right>") 'shrink-window-horizontally)
(global-set-key (kbd "<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "<up>") 'shrink-window)
(global-set-key (kbd "<down>") 'enlarge-window)

;; Bookmarks
(global-set-key (kbd "M-,") 'bookmark-jump)
(global-set-key (kbd "M-.") 'bookmark-set)

;; Org-capture
(global-set-key (kbd "C-c c") 'org-capture)
