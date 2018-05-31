;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; trying use-package with MELPA now instead of el-get. el-get was
;; having trouble matching up dependencies, maybe because I added
;; MELPA to it?  Also, dang Glyph got me nervous about security and
;; el-get pulling from the wiki or who knows where.
;;
;; NOTE: will not automatically delete packages that I remove from
;; this file like el-get does.  That'll have to be manual, sadly.
;;
;; I'm very tempted to just use arch packages instead of package.el
;; and MELPA.  Some of what I want is already on the AUR, but some is
;; not.  It's not hard to make packages and maybe I could even get
;; them on the AUR, but it would still be more work than MELPA, at
;; least I believe so at this point.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use melpa, comes from here:
;; http://melpa.milkbox.net/#/getting-started
(require 'package)
;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives (cons "melpa-stable" "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Now, you have to install use-package with M-x package-install
;; before the following will work.  That's the one time you'll have to
;; manually run package-install (ideally, but I have had to manually
;; install a couple packages).  The following will take care of
;; installing all other packcages: This is only needed once, near the
;; top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))
;; Packages TODO (make sure they are still not included with emacs
;; before downloading them):
; - [X]  ag
; - [X]  dumb-jump
; - [X]  color-theme had to upgrade to color-theme-modern, which seems fine
; - [X]  exec-path-from-shell (I think I only needed this on my mac?)
; - [X]  graphviz-dot-mode
; - [X]  guess-offset (replace with dtrt-indent)
; - [X]  ido-ubiquitous (replace with ido-completing-read+)
; - [ ]  key-chord (I never got used to these)
; - [X]  magit
; - [X]  markdown-mode
; - [ ]  rusti (I haven't done much rust, really)
; - [X]  session
; - [X]  smart-tab
; - [X]  smartrep
; - [X]  smex
; - [X]  wgrep-ag
; - [X]  yaml-mode
(use-package ag
  :ensure t
  :custom (ag-arguments (list "--word-regexp" "--smart-case"))
  ;; replace xref:
  :config (define-key global-map [remap xref-find-references] 'ag-project))

;; replaces guess-offset
(use-package dtrt-indent
  :ensure t
  :config (dtrt-indent-mode t))

(use-package dumb-jump
  :ensure t
  :custom (dumb-jump-force-searcher 'ag)
  ;; replace xref:
  :config
  (define-key global-map [remap xref-find-definitions]
    'dumb-jump-go)
  (define-key global-map [remap xref-pop-marker-stack]
    'dumb-jump-back))

(use-package color-theme-modern
  :ensure t)

(use-package tango-2-theme
  :ensure t
  :config (load-theme 'tango-2 t))

;; more ido-like completion:
(use-package crm-custom
  :ensure t
  :config (crm-custom-mode 1))

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

(use-package graphviz-dot-mode
  :ensure t)

(use-package ido-completing-read+
  :ensure t
  :config (ido-ubiquitous-mode 1))

(use-package magit
  :ensure t
  :custom (magit-completing-read-function 'magit-ido-completing-read))

(use-package markdown-mode
  :ensure t)

;; this is pretty good, I just wish this mode let you open recent
;; files with the keyboard the same way it lets you with the menu
(use-package session
  :ensure t
  :hook (after-init . session-initialize)
  ;; this is so it will save periodically, not just on exit, so that
  ;; sessions will get saved before a crash:
  :config (run-with-idle-timer 30 t 'session-save-session))

(use-package smart-tab
  :ensure t
  :config (global-smart-tab-mode 1))

(use-package smartrep
  :ensure t
  :config
  ;; "Changing Window size tends to execute the same command
  ;; continuously. It is boring work. So eval this example and type
  ;; C-x { { {."
  (smartrep-define-key
   global-map "C-x"
   '(("{" . shrink-window-horizontally)
     ("}" . enlarge-window-horizontally)))
  (smartrep-define-key
      global-map "C-x"
    '(("o" . other-window))))

(use-package smex
  :ensure t
  ;; this is the best bit of emacs advice I've ever seen.  Invoke M-x
  ;; without the Alt key!!!!  I got this from
  ;; http://www.cabochon.com/~stevey/blog-rants/effective-emacs.html
  :bind (("C-x C-m" . smex)
         ("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))

(use-package wgrep-ag
  :ensure t)

(use-package yaml-mode
  :ensure t)
