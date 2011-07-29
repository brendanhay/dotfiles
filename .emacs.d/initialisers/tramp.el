(require 'tramp)

(setq tramp-default-method "scp")
(setq tramp-auto-save-directory temp-dir)
(setq tramp-backup-directory-alist backup-directory-alist)
(setq tramp-default-method "plink")
(setq auto-save-file-name-transforms nil)
