;; Default notes dump
(setq org-default-notes-file "~/Dropbox/Documents/org/refile.org")

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Dropbox/Documents/org/todo.org")
               "* TODO %^{Description} %^g\n%?  Added: %U")
              ("n" "note" entry (file "~/Dropbox/Documents/org/notes.org")
               "* %? :NOTE:\n%U\n%a\n  %i" :clock-in t :clock-resume t)
              ("s" "study" entry (file "~/Dropbox/Documents/org/study.org")
               "* %? :STUDY:\n%U\n%a\n  %i" :clock-in t :clock-resume t)
              ("f" "follow-up" entry (file "~/Dropbox/Documents/org/followup.org")
               "* FOLLOWUP %? :FOLLOWUP:\n%U" :clock-in t :clock-resume t))))
