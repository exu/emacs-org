;; Paths
(fset 'yes-or-no-p 'y-or-n-p)

(setq workdir (file-name-directory (or load-file-name buffer-file-name)))
(setq org-dir (expand-file-name "org" workdir))

(setq fringe-mode (cons 1 0))
(setq echo-keystrokes 0.1)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-message t) ;; No emacs startup message
(setq transient-mark-mode t) ;; selecting text between markers

;; Terminal settings
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)
(setq  xterm-mouse-mode t)

(show-paren-mode 1)    ; Highlight matching parentheses when the point is on them.
(ido-mode t)
(global-linum-mode -1)
(global-hl-line-mode -1)
(delete-selection-mode 1) ; emacs doesn't delete selected text

(setq create-lockfiles nil)
(setq mouse-yank-at-point t)
(setq require-final-newline nil)
(setq truncate-partial-width-windows nil)
(setq scroll-margin 0)
(setq scroll-conservatively 0)
(setq scroll-preserve-screen-position 1)
(setq default-directory org-dir)
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq dired-listing-switches "-al --group-directories-first")

(global-auto-revert-mode t)
(global-linum-mode 1)

(setq linum-format "%d ")


 ;; IDO mode
(setq ido-enable-prefix nil)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-use-filename-at-point 'guess)
(setq ido-max-prospects 10)

(setq default-truncate-lines t) ;; disable line wrap
(setq truncate-partial-width-windows nil) ;; make side by side buffers function the same as the main window
(setq longlines-auto-wrap nil)

(setq initial-major-mode 'text-mode) ; change scratch buffer to text-mode
(setq initial-scratch-message "")    ; change scratch buffer message

(setq set-mark-command-repeat-pop 1) ; jump back to marker by C-u C-SPC C-SPC
(setq visible-bell t)

;; org-mode configuration
;; (setq org-directory org-dir)
(define-key global-map "\C-cc" 'org-capture)
(setq org-return-follows-link 1)
(setq org-log-done t)
(setq org-startup-indented t)
(setq org-agenda-window-setup 'current-window)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-export-allow-bind-keywords t)
(setq org-export-backends '(html odt latex ascii))
(require 'org)
;; (require 'ox-md)
;; (require 'ox-html)

;; active Babel languages
(setq org-plantuml-jar-path (expand-file-name "plantuml.jar" workdir))
(setq org-ditaa-jar-path (expand-file-name "ditaa.jar" workdir))

;; for code exec in org babel src blocks
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ruby . t)
   (ditaa . t)
   (dot . t)
   (python . t)
   (emacs-lisp . t)
   (sh . t)
   (plantuml . t)
   ))


(add-to-list 'org-agenda-files (expand-file-name "work.org" org-dir))
(add-to-list 'org-agenda-files (expand-file-name "home.org" org-dir))


;; (setq org-todo-keywords
;;       '((sequence "TODO" "STARTED" "TESTING" "|" "COMPLETED")
;;         (sequence "FUTURE" "|" "SUSPENDED")))

;; (setq org-todo-keyword-faces
;;       '(
;;         ("FUTURE" . (:foreground "lightblue" :weight bold))
;;         ("STARTED"  . (:foreground "orange" :weight bold))
;;         ("SUSPENDED" . (:foreground "light gray" :weight bold))
;;         ("TESTING" . (:foreground "light salmon" :weight bold))
;;         ))
