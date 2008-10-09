;; 
;; Copyright (c)2007 CUBE S.p.A. 
;; 
;; Author: Andrea Mistrali <andre@cubeholding.com> 
;; Description: Emacs Startup script
;;
;; 
;;
;; This file should go in ~/Library/Preferences/Emacs on OSX and
;; in .emacs on Unix/Linux


;; Definiamo i path di ricerca di moduli e librerie

;;(ignore-errors
  (add-to-list 'load-path "~/.emacs.d/")
  (add-to-list 'load-path "/sw/share/emacs/site-lisp/")
  (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/")
  (add-to-list 'load-path "/usr/share/emacs/site-lisp")
;;(add-to-list 'load-path "/usr/share/emacs/21.2/lisp"))


;; Carichiamo i moduli che ci servono subito
(require 'dired)
(require 'autoinsert)
(require 'hippie-exp)
(require 'tramp)
(require 'saveplace)
;; (require 'desktop)


;; (setq-default save-place t)
;; (setq-default desktop-read t)
;; (desktop-save-mode 1)


;; global variables
(setq organization "CUBE S.p.A.")
(setq user-mail-address "andre@cubeholding.com")

(setq-default frame-title-format 
              (list (format "%s %%S: %%j " (system-name))
                    '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


(setq column-number-mode t)
(setq european-calendar-style t)
(setq calendar-week-start-day 1)

(toggle-text-mode-auto-fill)1
(line-number-mode t)
(setq transient-mark-mode t)
(setq kill-whole-line t)

(display-time) ;; in global prefs
(setq-default indent-tabs-mode nil)
(setq-default default-tab-width 2)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq-default blink-match-paren t)

;; KEY BINDINGS
;; All version bindings

(global-set-key (kbd "C-x C-g") 'goto-line)
(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region-or-line)
;; This is better than normal behavior
(global-set-key (kbd "C-x C-b") 'electric-buffer-list)


(global-set-key (kbd "<f6>") 'other-window)
(global-set-key (kbd "<S-f6>") 'delete-other-windows)  ; remove the other windows
(global-set-key (kbd "<C-f6>") 'delete-window)         ; remove the selected window

(global-set-key (kbd "<S-f8>") 'split-window-horizontally)
(global-set-key (kbd "<f8>") 'split-window-vertically)

(global-set-key (kbd "C-x SPC") 'toggle-showtabs)

(global-set-key (kbd "<C-f12>") 'eshell) ;; <f12> conflicts with Dashboard
(global-set-key (kbd "<S-C-f12>") 'term) ;; <f12> conflicts with Dashboard

(global-set-key [(meta right)] 'forward-word)
(global-set-key [(meta left)] 'backward-word)

;; Italian Keyboard on Mac OS X
(global-set-key (kbd "M-\230") "@")
(global-set-key (kbd "M-\223") "~")
(global-set-key (kbd "M-\210") "#")
(global-set-key (kbd "M-ò") "@")
(global-set-key (kbd "M-à") "#")
(global-set-key (kbd "M-ì") "~")
(global-set-key (kbd "M-è") "[")
(global-set-key (kbd "M-+") "]")
(global-set-key (kbd "M-é") "{")
(global-set-key (kbd "S-M-+") "}")
(global-set-key (kbd "M-\\") "`")

;;;;;;;;;;;;
;; hippie 
;;;;;;;;;;;;
(setq hippie-expand-try-functions-list
      '(
        ;; try-complete-tempo-tag
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-list
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
        try-expand-whole-kill))

;; the expand-function. Called with a positive prefix <P> it jumpes direct
;; to the <P>-th try-function.
(defun my-hippie-expand (arg)
  (interactive "P")
  ;; hippie-expand does not have a customization-feature (like
  ;; dabbrev-expand) to search case-sensitive for completions.
  ;; So we must set 'case-fold-search' temp. to nil!
  (let ((old-case-fold-search case-fold-search))
    (setq case-fold-search nil)
    (hippie-expand arg)
    (setq case-fold-search old-case-fold-search)
    )
  )
;; all expansion is done by 'my-hippie-expand bound to C-TAB!
(global-set-key (kbd "<C-tab>") 'my-hippie-expand)


;;;;;;;;;;;
;; TRAMP
;;;;;;;;;;;
(setq tramp-shell-prompt-pattern "[#$%>] *")
(setq tramp-default-method "ssh") 


;; Some useful functions
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))  (beginning-of-buffer))

;; emulate set list in vi
(defvar *showtabs* nil)
(defun toggle-showtabs ()
  "toggle the display of tabs and newlines"
  (interactive)
  (setq *showtabs* (not *showtabs*))
  (let ((disptab (make-display-table)))
    (let ((i 0))
      (while (< i 32)
        (or (= i ?\t) (= i ?\n)
            (aset disptab i (vector ?^ (+ i 64))))
        (setq i (1+ i))))
    (when *showtabs*
      (aset disptab 127 (vector ?^ ??))
      (aset disptab ?\t (vector ?- ?>))
      (aset disptab ?\n (vector ?$ ?\n)))
    (set-window-display-table (selected-window) disptab)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto Insert - Template add-on
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'find-file-hooks 'auto-insert)

(define-skeleton insert-cvs-tags ;; insert CVS ID Tag
  "insert the CVS tags"
  nil
  comment-start " $Id$" comment-end)

(define-skeleton insert-gpl-disclaimer ;; insert GPL header
  "insert GPL disclaimer"
  nil

comment-start "This file is free software; you can redistribute it and/or modify" comment-end \n
comment-start "it under the terms of the GNU General Public License as published by" comment-end \n
comment-start "the Free Software Foundation; either version 2, or (at your option)" comment-end \n
comment-start "any later version." comment-end \n \n
comment-start "This file is distributed in the hope that it will be useful," comment-end \n
comment-start "but WITHOUT ANY WARRANTY; without even the implied warranty of" comment-end \n
comment-start "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the" comment-end \n
comment-start "GNU General Public License for more details." comment-end \n \n
comment-start "You should have received a copy of the GNU General Public License" comment-end \n
comment-start "along with this software; see the file COPYING.  If not, write to" comment-end \n
comment-start "the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor," comment-end \n
comment-start "Boston, MA 02110-1301, USA." comment-end \n \n

)

(define-skeleton insert-standard-header
  "insert a standard header in all programs"
  "Purpose or description:"
  comment-start "-*- coding: latin-1 -*-" comment-end \n
  comment-start (concat "Copyright (c)" (substring (current-time-string) -4)
                        " " organization " ") comment-end \n
  comment-start " " comment-end \n
  comment-start " Author: " (user-full-name) " <" user-mail-address "> " comment-end \n
  comment-start " Description: "
  str
  comment-end \n
  comment-start comment-end \n
  '(insert-cvs-tags)' "" \n
  comment-start " " comment-end \n \n)

;; Python Mode
(define-skeleton insert-python-header
  "inserts a Python header"
  nil
  "#!/usr/bin/env python" \n
  '(insert-standard-header)' "" \n \n
  "__version__=\"$Revision: 1.5 $\"[11:-2]" \n \n
  "")

(defun my-python-mode-settings ()
  "My Python programming mode settings."
  (interactive) 
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "<f4>") 'insert-python-header)
  (local-set-key (kbd "<M-up>") 'beginning-of-python-def-or-class)
  (local-set-key (kbd "<M-down>") 'end-of-python-def-or-class))


(when (locate-library "python-mode")
  (add-hook 'python-mode-hook 'my-python-mode-settings)
  (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  (autoload 'python-mode "python-mode"))

(custom-set-variables
 '(python-python-command "/usr/local/bin/python2.5")
)

;; CPerl Mode
(setq auto-mode-alist
      (append '(("\\.\\([pP][Llm]\\|al\\)$" . cperl-mode))  auto-mode-alist ))

(setq interpreter-mode-alist (append interpreter-mode-alist
                                     '(("miniperl" . perl-mode))))
(setq cperl-electric-parens t)
(setq cperl-electric-keywords t)
(setq cperl-electric-brace t)
(setq cperl-electric-backspace t)
(setq cperl-auto-newline-after-colon t)
(setq cperl-auto-newline t)

(define-skeleton insert-perl-header
  "inserts a Perl header"
  "Purpose of script: "
  "#!/usr/bin/perl" \n
  '(insert-standard-header)' "" \n \n
  )

;;run the current perl program
(defun run-perl ()
  (interactive "*")
  (setq perl-buffer-name buffer-file-name)
  (shell)
  (setq perl-run-command "perl ")
  (insert perl-run-command)
  (insert perl-buffer-name)
  )

;; debug the current perl program
(defun debug-perl ()
  (interactive "*")
  (setq perl-buffer-name buffer-file-name)
  (shell)
  (setq perl-run-command "perl -d ")
  (insert perl-run-command)
  (insert perl-buffer-name)
  )

(dolist (insertion '((("\\.py\\'" . "Python file") . insert-python-header)
                     (("\\.pl\\'" . "Perl header") . insert-perl-header)))
  (add-to-list 'auto-insert-alist insertion))

;;;;;;;;;;
;; GNUS
;;;;;;;;;;

(setq gnus-select-method '(nntp "news.fastwebnet.it"))
