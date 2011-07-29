(progn
  ;; Movement
  (global-set-key (kbd "M-p") 'backward-sexp)
  (global-set-key (kbd "M-n") 'forward-sexp)
  
  ;; Terminal movement
  (global-set-key (kbd "M-[ 5 c") 'forward-word)
  (global-set-key (kbd "M-[ 5 d") 'backward-word)

  ;; Comments
  (global-set-key (kbd "C-\\") 'uncomment-region) 
  (global-set-key (kbd "C-]") 'comment-region)

  ;; Completion
  (global-set-key (kbd "C-<return>") 'hippie-expand)
  

  ;; Use regex searches
  (global-set-key (kbd "C-s") 'isearch-forward-regexp)
  (global-set-key (kbd "C-r") 'isearch-backward-regexp)

  ;; Replace
  (global-set-key (kbd "C-/") 'replace-string) 
  
  ;; File finding
  (global-set-key (kbd "C-x C-f") 'ido-find-file) 

  ;; Buffers
  (global-set-key (kbd "C-d") 'ido-switch-buffer)
  (global-set-key (kbd "C-<tab>") 'buffer-menu)
  (global-set-key (kbd "C-c r") 'revert-buffer)

  ;; Terminal Buffers
  (global-set-key (kbd "C-x M-[ 5 c") 'next-buffer)
  (global-set-key (kbd "C-x M-[ 5 d") 'previous-buffer)

  ;; Windows
  (windmove-default-keybindings) ;; Shift+direction
  (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
  (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (global-set-key (kbd "S-C-<down>") 'shrink-window)
  (global-set-key (kbd "S-C-<up>") 'enlarge-window)

  ;; Bookmarks
  (global-set-key (kbd "C-,") 'bookmark-jump)
  (global-set-key (kbd "C-.") 'bookmark-set)

  ;; Help should search more than just commands
  (global-set-key (kbd "C-h a") 'apropos))

(provide 'bindings)

