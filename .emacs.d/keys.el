;; Movement
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; Comments
(global-set-key (kbd "C-\\") 'uncomment-region)
(global-set-key (kbd "C-]") 'comment-region)

;; Completion
(global-set-key (kbd "M-/") 'hippie-expand)

;; Use regex searches
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; Replace
(global-set-key (kbd "C-x r") 'replace-regexp)

;; File finding
(global-set-key (kbd "C-x f") 'ido-find-file)
(global-set-key (kbd "M-'") 'rinari-rgrep)
(global-set-key (kbd "M-;") 'find-file-in-project)

;; Tags
(global-set-key (kbd "M-l") 'my-ido-find-tag)

;; Buffers
(global-set-key (kbd "C-M-_") 'ido-switch-buffer) ; My terminal sends C-<tab> as hexcode 0x9f
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-<delete>") 'my-kill-buffer)

;; Terminal Buffers
(global-set-key (kbd "C-x n") 'next-buffer)
(global-set-key (kbd "C-x p") 'previous-buffer)

;; Windows
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Bookmarks
(global-set-key (kbd "M-,") 'bookmark-jump)
(global-set-key (kbd "M-.") 'bookmark-set)

;; Symbols
(global-set-key (kbd "M-]") 'highlight-symbol-next)
(global-set-key (kbd "M-[") 'highlight-symbol-prev)

;; Help should search more than just commands
(global-set-key (kbd "C-h a") 'apropos)

;; Org-capture
(global-set-key (kbd "C-c c") 'org-capture)
