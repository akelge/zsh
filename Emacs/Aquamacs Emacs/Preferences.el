;; -----------------------------
;; Aquamacs ONLY customizations
;; -----------------------------

(defvar aquamacs-p (string-match "Aquamacs" (version))) ;; are we on Aquamacs?

;; Se stiamo usando acquamacs
(when (featurep 'aquamacs)
  
  ;; default window dimensions
  (setq default_height 55)
  (setq default_width 120)
  
  ;; non gestire il posizionamento dei frame
  (smart-frame-positioning-mode t)  
  
  ;; set size of main window
  (set-frame-height (selected-frame) default_height);; set size of main window
  (set-frame-width (selected-frame) default_width)
  
  ;;   ;; Apre un nuovo frame con il buffer *Scratch*
;;   (defun my-new-frame-with-new-scratch ()
;;     "Open a new window with default height and width"
;;     (interactive)
;;     (let ((one-buffer-one-frame t))
;;       (make-frame `((width . ,default_width)
;;                     (height . ,default_height)))))
  (defun my-new-frame-with-new-scratch ()
    (interactive)
    (let ((one-buffer-one-frame t))
      (new-frame-with-new-scratch))
    (set-frame-height (selected-frame) default_height);; set size of main window
    (set-frame-width (selected-frame) default_width))
  
  ;; Chiudiamo salvando
  (one-buffer-one-frame-mode 0)
  (defun my-close-current-window-asktosave ()
    (interactive)
    (let ((one-buffer-one-frame t))
      (close-current-window-asktosave)))
  
  ;; in Dired usiamo il comando open
  (defun dired-open-mac ()
    "Uses open command in dired mode"
    (interactive)
    (let (( file-name (dired-get-file-for-visit)))
      (if (file-exists-p file-name)
          (call-process "/usr/bin/open" nil 0 nil file-name))))
  
  ;; OSX Keybindings
  (define-key osx-key-mode-map (kbd "<home>") 'beginning-of-line)
  (define-key osx-key-mode-map (kbd "<end>") 'end-of-line)
  
  ;; Mela-N per aprire una nuova finestra
  (define-key osx-key-mode-map (kbd "A-n") 'my-new-frame-with-new-scratch)
  ;; Mela-W per chiudere salvando
  (define-key osx-key-mode-map (kbd "A-W") 'my-close-current-window-asktosave)
  (define-key osx-key-mode-map (kbd "A-w") 'kill-this-buffer)
  (define-key osx-key-mode-map (kbd "A-j") 'join-line)  
  ;; o in dired per aprire con l'applicazione di default  
  (define-key dired-mode-map "o" 'dired-open-mac)
  )
