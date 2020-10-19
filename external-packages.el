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
(when (< emacs-major-version 27)
  (package-initialize))

;; Now, you have to install use-package with M-x package-install
;; before the following will work.  That's the one time you'll have to
;; manually run package-install (ideally, but I have had to manually
;; install a couple packages).  The following will take care of
;; installing all other packcages: This is only needed once, near the
;; top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(use-package ag
  :ensure t
  :custom (ag-arguments (list "--word-regexp" "--smart-case"))
  ;; replace xref:
  :config (define-key global-map [remap xref-find-references] 'ag-project))

(use-package cmake-mode
  :ensure t)

;; replaces guess-offset
(use-package dtrt-indent
  :ensure t
  :init (dtrt-indent-global-mode 1))

(use-package dumb-jump
  :ensure t
  :custom (dumb-jump-force-searcher 'ag)
  ;; replace xref:
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

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

;; (use-package ido-completing-read+
;;   :ensure t
;;   :config (ido-ubiquitous-mode 1))

(use-package magit
  :ensure t
  :custom (magit-completing-read-function 'magit-ido-completing-read))

(use-package magit-log
  :init
  (progn
    ;; Default value:
    ;; (setq magit-log-margin '(t age magit-log-margin-width t 18))
    (setq magit-log-margin
          '(t age-abbreviated magit-log-margin-width :author 11))))

(use-package markdown-mode
  :ensure t)

(use-package smart-tab
  :ensure t
  :config (global-smart-tab-mode 1))

(use-package smex
  :ensure t
  ;; Invoke M-x without the Alt key.  I got this from
  ;; http://www.cabochon.com/~stevey/blog-rants/effective-emacs.html
  :bind (("C-x C-m" . smex)
         ("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))

(use-package wgrep-ag
  :ensure t)

(use-package yaml-mode
  :ensure t)

;; more essentials for big hairy yaml file editing,
;; highlight-indent-guides and indent-tools
(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (add-hook 'yaml-mode-hook 'highlight-indent-guides-mode))
;; I've avoided hydra for a while now, but indent-tools really wanted
;; it, and after using magit for a while, it looks pretty normal to me
;; now.  Oh, and it can replace smartrep!  OK, I'm sold.
(use-package hydra
  :ensure t
  :config
  (defhydra hydra-window-size (global-map "C-x")
    "shrink and grow windows"
    ("{" shrink-window-horizontally)
    ("}" enlarge-window-horizontally))
  (defhydra hydra-other-window (global-map "C-x")
    "move to other window(s)"
    ("o" other-window))
  ;; from the hydra wiki:
  ;; https://github.com/abo-abo/hydra/wiki/Rectangle-Operations
  (defhydra hydra-rectangle (:body-pre (rectangle-mark-mode 1)
                                       :color pink
                                       :hint nil
                                       :post (deactivate-mark))
    "
  ^_k_^       _w_ copy      _o_pen       _N_umber-lines            |\\     -,,,--,,_
_h_   _l_     _y_ank        _t_ype       _e_xchange-point          /,`.-'`'   ..  \-;;,_
  ^_j_^       _d_ kill      _c_lear      _r_eset-region-mark      |,4-  ) )_   .;.(  `'-'
^^^^          _u_ndo        _q_ quit     ^ ^                      '---''(./..)-'(_\_)
"
    ("k" rectangle-previous-line)
    ("j" rectangle-next-line)
    ("h" rectangle-backward-char)
    ("l" rectangle-forward-char)
    ("d" kill-rectangle)                    ;; C-x r k
    ("y" yank-rectangle)                    ;; C-x r y
    ("w" copy-rectangle-as-kill)            ;; C-x r M-w
    ("o" open-rectangle)                    ;; C-x r o
    ("t" string-rectangle)                  ;; C-x r t
    ("c" clear-rectangle)                   ;; C-x r c
    ("e" rectangle-exchange-point-and-mark) ;; C-x C-x
    ("N" rectangle-number-lines)            ;; C-x r N
    ("r" (if (region-active-p)
             (deactivate-mark)
           (rectangle-mark-mode 1)))
    ("u" undo nil)
    ("q" nil))
  (global-set-key (kbd "C-c R") 'hydra-rectangle/body))

(use-package indent-tools
  :ensure t
  :config 
  (global-set-key (kbd "C-c >") 'indent-tools-hydra/body)
  (add-hook 'python-mode-hook
            (lambda ()
              (define-key python-mode-map (kbd "C-c >")
                'indent-tools-hydra/body)))
  (add-hook 'yaml-mode-hook
            (lambda ()
              (define-key yaml-mode-map (kbd "C-c >")
                'indent-tools-hydra/body))))

;; needed for polymode below
(use-package jinja2-mode
  :ensure t)

(use-package polymode
  :ensure t
  ;; pretty neat, a mode for jinja2 inside verilog.  I followed the
  ;; example here:
  ;; https://www.masteringemacs.org/article/polymode-multiple-major-modes-how-to-use-sql-python-in-one-buffer
  :mode ("\\.jinja\\'" . poly-verilog-jinja2-mode)
  :config
  (define-hostmode poly-verilog-hostmode :mode 'verilog-mode)

  ;; this function came: from https://gitlab.com/mavit/poly-ansible
  (defcustom pm-inner/jinja2
    (pm-inner-chunkmode :mode #'jinja2-mode
                        :head-matcher "{[%{#][+-]?"
                        :tail-matcher "[+-]?[%}#]}"
                        :head-mode 'body
                        :head-adjust-face nil)
    "Jinja2 chunk."
    :group 'innermodes
    :type 'object)

  (define-polymode poly-verilog-jinja2-mode
    :hostmode 'poly-verilog-hostmode
    :innermodes '(pm-inner/jinja2)
    (verilog 1)))
