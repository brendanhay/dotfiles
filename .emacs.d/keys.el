(defun my-ido-find-tag ()
  (interactive)
  (tags-completion-table)
  (let (tag-names)
    (mapc (lambda (x)
            (unless (integerp x)
              (push (prin1-to-string x t) tag-names)))
          tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))

(defun he-slime-symbol-beg ()
  (let ((p (slime-symbol-start-pos))) p))

(defun try-expand-slime-symbol (old)
  (unless  old
    (he-init-string (he-slime-symbol-beg) (point))
    (setq he-expand-list (sort
                          (car (slime-simple-completions
                                (buffer-substring-no-properties (slime-symbol-start-pos) (slime-symbol-end-pos))))
                          'string-lessp)))
  (while (and he-expand-list
              (he-string-member (car he-expand-list) he-tried-table))
    (setq he-expand-list (cdr he-expand-list)))
  (if (null he-expand-list)
      (progn
        (when old (he-reset-string))
        ())
    (he-substitute-string (car he-expand-list))
    (setq he-expand-list (cdr he-expand-list))
    t))

(make-hippie-expand-function
'(try-expand-slime-symbol
  try-expand-dabbrev-visible
  try-expand-dabbrev-from-kill
  try-expand-dabbrev-all-buffers
  try-complete-file-name-partially
  try-complete-file-name))

(setq enable-recursive-minibuffers t)

(progn
  ;; Movement
  (global-set-key (kbd "M-p") 'backward-sexp)
  (global-set-key (kbd "M-n") 'forward-sexp)
  (global-set-key (kbd "S-C-p") 'backward-paragraph)
  (global-set-key (kbd "S-C-n") 'forward-paragraph)
  
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
  (global-set-key (kbd "C-x f") 'ido-find-file) 
  (global-set-key (kbd "C-'") 'rinari-rgrep)
  (global-set-key (kbd "C-x p") 'find-file-in-project)

  ;; Tags
  (global-set-key (kbd "C-;") 'my-ido-find-tag)

  ;; Buffers
  (global-set-key (kbd "C-<tab>") 'ido-switch-buffer)
  (global-set-key (kbd "C-c r") 'revert-buffer)

  ;; Terminal Buffers
  (global-set-key (kbd "C-x M-[ 5 c") 'next-buffer)
  (global-set-key (kbd "C-x M-[ 5 d") 'previous-buffer)

  ;; Windows
  (windmove-default-keybindings) ;; Shift+direction
  (global-set-key (kbd "C-o") 'other-window)
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

