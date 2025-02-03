;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Personal Doom Emacs configuration
;; =================================

;;; Code:

;;; ─────────────────────────────────────────────────────────────────────────────
;;; User Information (Optional)
;;; ─────────────────────────────────────────────────────────────────────────────
;; Used by certain packages (like GPG and email clients) and file templates.
;; Uncomment and adjust if needed.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;;; ─────────────────────────────────────────────────────────────────────────────
;;; Font Configuration
;;; ─────────────────────────────────────────────────────────────────────────────
(setq doom-font (font-spec :family "Iosevka SS04" :size 18 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Noteworthy" :size 20))

;; Tips:
;; - M-x describe-font : Check available fonts
;; - M-x doom/reload-font : Reload your Doom Emacs fonts

;;; ─────────────────────────────────────────────────────────────────────────────
;;; Tab Navigation
;;; ─────────────────────────────────────────────────────────────────────────────
;; Use Ctrl+Tab and Ctrl+Shift+Tab to cycle through tabs.
(map! :n "<C-tab>"     #'centaur-tabs-forward
      :n "<C-S-tab>"   #'centaur-tabs-backward
      :i "<C-tab>"     #'centaur-tabs-forward
      :i "<C-S-tab>"   #'centaur-tabs-backward)

;;; ─────────────────────────────────────────────────────────────────────────────
;;; Theme
;;; ─────────────────────────────────────────────────────────────────────────────
(setq doom-theme 'doom-dracula)

;;; ─────────────────────────────────────────────────────────────────────────────
;;; Line Numbers
;;; ─────────────────────────────────────────────────────────────────────────────
;; Possible values: `t` (absolute), `'relative`, or `nil` (disable).
(setq display-line-numbers-type t)

;;; ─────────────────────────────────────────────────────────────────────────────
;;; Org Mode Configuration
;;; ─────────────────────────────────────────────────────────────────────────────

;;;; 1. Org Directories & Agenda
(setq org-directory "~/org/"
      org-agenda-files '("~/org/inbox.org"
                         "~/org/projects.org"
                         "~/org/single-actions.org"
                         "~/org/someday-maybe.org"
                         "~/org/checklists.org")
      calendar-week-start-day 0
      org-agenda-start-on-weekday 0)

;;;; 2. Custom TODO Keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" | "DONE(d)")))

;;;; 3. Capture Templates
(setq org-capture-templates
      '(("t" "Todo"
         entry
         (file "~/org/inbox.org")
         "* TODO %?\n  %i")))

;;;; 4. Refile Targets
(setq org-refile-targets '((org-agenda-files :maxlevel . 1)))

;;;; 5. Org Agenda Custom Commands
(setq org-agenda-custom-commands
      '(("w" "Weekly Review"
         agenda ""
         ((org-agenda-span 7)
          (org-agenda-overriding-header "Week at a Glance")))
        ("t" "Today"
         agenda ""
         ((org-agenda-span 1)
          (org-agenda-overriding-header "Today’s Agenda")))))

;;;; 6. Log When Tasks are Marked DONE
(setq org-log-done 'time)

;;; ─────────────────────────────────────────────────────────────────────────────
;;; Doom Emacs Configuration Best Practices
;;; ─────────────────────────────────────────────────────────────────────────────
;; - Use `after!' to modify package settings after they load, e.g.:
;;   (after! PACKAGE
;;     (setq some-variable some-value))
;; - Use `map!' for keybindings.
;; - Use `use-package!' for package configurations.
;; - Use `load!' to load external files relative to your Doom config directory.

;; Happy hacking!

;;; config.el ends here
