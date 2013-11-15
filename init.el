;; Paths
(fset 'yes-or-no-p 'y-or-n-p)
(setq dotfiles-dir "~/.emacs.d/")

(defvar root-dir "~/.emacs.d/")
(defvar dotfiles-dir root-dir)
(defvar autload-dir (expand-file-name "autoload" root-dir))
(defvar vendor-dir (expand-file-name "vendor" root-dir))
(defvar themes-dir (expand-file-name "themes" root-dir))
(defvar savefile-dir (expand-file-name "var" root-dir))
(defvar elpa-dir (expand-file-name "elpa" root-dir))
(defvar snippets-dir (expand-file-name "snippets" root-dir))

(defun add-subfolders-to-load-path (parent-dir)
  "Adds all first level `parent-dir' subdirs to the Emacs load path."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(setq custom-file (expand-file-name "custom.el" autload-dir))

(add-to-list 'load-path vendor-dir)

(add-subfolders-to-load-path vendor-dir)
(add-subfolders-to-load-path elpa-dir)

(setq bookmark-default-file (concat dotfiles-dir "bookmarks/bookmarks-" system-name ".el"))
(setq bookmark-save-flag 1)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/var/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/var/backups/"))))


;; UI
(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")
(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")
(setq fringe-mode (cons 1 0))
(setq echo-keystrokes 0.1)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-message t) ;; No emacs startup message
(setq transient-mark-mode t) ;; selecting text between markers
(setq color-theme-is-global t)
(tool-bar-mode 0)

;; Text formattig and indenting
(set-fill-column 120)
(setq fill-column 120)
(setq whitespace-line-column 120)
(setq whitespace-style (quote (face trailing tabs newline tab-mark newline-mark)))
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space, ·
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [172 10]) ; newlne, ¶¬
   (tab-mark 9 [9655 9] [92 9]) ; tab, ▷ 9655
   ))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 4)
(setq-default yaml-indent-offset 4)
(setq-default js-indent-level 4)

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
;;(global-smart-tab-mode 1) ; does'nt work well

(setq create-lockfiles nil)
(setq mouse-yank-at-point t)
(setq require-final-newline nil)
(setq truncate-partial-width-windows nil)
(setq eshidiff-window-setup-function 'ediff-setup-windows-plain)
(setq save-place-file (concat savefile-dir "places"))
(setq scroll-margin 0)
(setq scroll-conservatively 0)
(setq scroll-preserve-screen-position 1)
(setq default-directory "~/")
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq dired-listing-switches "-al --group-directories-first")

(global-auto-revert-mode t)

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
(setq linum-format "%4d ")           ; number format in line number

(setq abbrev-file-name "~/.emacs.d/config/abbrevs.el")
(setq default-abbrev-mode t)

(setq mouse-wheel-scroll-amount '(3))
(setq mouse-wheel-progressive-speed nil)

(setq set-mark-command-repeat-pop 1) ; jump back to marker by C-u C-SPC C-SPC
(setq visible-bell t)


;;;; no shell EMACS
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))


(global-set-key [C-right] 'next-buffer)
(global-set-key [C-left] 'previous-buffer)

;;; KEYS
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x ^") 'join-line)
(global-set-key (kbd "C-x p") 'proced)
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))
(global-set-key (kbd "C-x M-m") 'shell)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key "\C-m" 'newline-and-indent)


(define-prefix-command 'exu-f1-dirs-map)

(global-set-key (kbd "<f2>") 'exu-f1-dirs-map) ;; dirs
(global-set-key (kbd "<f2>a") (lambda nil (interactive) (dired "/etc/apache2")))
(global-set-key (kbd "<f2>p") (lambda nil (interactive) (dired "/etc/postgresql/9.1/main")))
(global-set-key (kbd "<f2>e") (lambda nil (interactive) (dired "/etc/")))
(global-set-key (kbd "<f2>w") (lambda nil (interactive) (dired "/srv/www/")))
(global-set-key (kbd "<f2>c") (lambda nil (interactive) (dired "/srv/www/crm")))
(global-set-key (kbd "<f2>q") (lambda nil (interactive) (dired "/srv/www/qarson")))

(global-set-key (kbd "<f4>") ( lambda () (interactive) ( dired ".")))
(global-set-key (kbd "<f5>") 'kmacro-start-macro)
(global-set-key (kbd "<f6>") 'kmacro-end-macro)
(global-set-key (kbd "<f7>") 'kmacro-end-and-call-macro)

;; org-mode configuration
(setq org-directory "~/org/")
(define-key global-map "\C-cc" 'org-capture)
(setq org-return-follows-link 1)
(setq org-log-done t)
(setq org-startup-indented t)
(setq org-agenda-window-setup 'current-window)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-export-allow-bind-keywords t)

;; open files in image browser from system
;; emacs sometimes didn't display pngs corectly
(add-to-list 'org-file-apps '("\\.png" . system))
(add-to-list 'org-file-apps '("\\.jpg" . system))
(add-to-list 'org-file-apps '("\\.gif" . system))

(require 'package)
(defvar org-list-allow-alphabetical nil)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org-mode" . "http://orgmode.org/elpa/") t)
(package-initialize)

(setq org-export-backends '(freemind deck md html odt latex ascii))
(require 'org)
(require 'ox-md)
(require 'ox-html)

;; active Babel languages
(setq org-plantuml-jar-path  (expand-file-name "~/Appz/plantuml.jar"))
(setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")

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
