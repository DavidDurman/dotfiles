;; .emacs

;;(require 'iso-transl)

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

(add-to-list 'load-path "~/.emacs.d/site-lisp")

(require 'font-lock) ; enable syntax highlighting
;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

; highlight current line 
(global-hl-line-mode t)
(set-face-background 'hl-line "#545454")
;(set-face-background 'hl-line "#5d5d5d")

; show line/column number in status bar
(line-number-mode t)
(column-number-mode t)

; mark more than 80 chars line tails
(setq whitespace-style 'lines-tail
  whitespace-line-column 80)
(global-whitespace-mode 1)

;(setq make-backup-files nil) ; stop creating backup~ files
;(setq auto-save-default nil) ; stop creating #autosave# files

; menu of recently opened files (Alt-x recentf-open-files)
(recentf-mode t)

; soft wrap words at line boundary
;(global-visual-line-mode t)

; lines truncated as default
(setq-default truncate-lines t)

; lines spacing (nil for default)
;(setq-default line-spacing 0.5)

; uncomment to open each file in a new window
;(setq pop-up-frames t)

; subword-mode - move through camelCase
;(subword-mode 1) ; 1 for on, 0 for off
;(global-subword-mode 1) ; 1 for on, 0 for off

;; spell checking
;(flyspell-mode 1)
;(defun turn-spell-checking-on ()
;  "Turn speck-mode or flyspell-mode on."
;  ;; (speck-mode 1)
;  (flyspell-mode 1)
;  )
;(add-hook 'text-mode-hook 'turn-spell-checking-on)

;; Store backup files in ~/.emacs.d/emacs-backup
;; instead of in the current directory.
(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let (backup-root bpath)
    (setq backup-root "~/.emacs.d/emacs-backup")
    (setq bpath (concat backup-root fpath "~"))
    (make-directory (file-name-directory bpath) bpath)
    bpath
  )
)
(setq make-backup-file-name-function 'my-backup-file-name)

;; disable menu-bar and tool-bar
(menu-bar-mode 0)
(tool-bar-mode 0)

(setq tramp-default-method "ftp")

;; set default font
;(set-default-font "Bitstream Vera Sans Mono-10")
(set-default-font "DejaVu Sans Mono-10")

;; Indent using spaces instead of tabs
;(setq-default c-basic-indent 2)
;(setq-default tab-width 4)
;(highlight-tabs)
;(highlight-trailing-whitespace)
(setq-default indent-tabs-mode nil)

; clipboard
(set-clipboard-coding-system 'utf-8)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; always end a file with a newline
;(setq require-final-newline 'query)

;;(setq php-manual-path "~/.emacs.d/php/php-manual/html")

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))
(setq diff-switches "-u")		; default to unified diffs
(column-number-mode t)			; column number in statusbar
(setq vc-handled-backends '(CVS RCS SCCS)) ; version control system; default is: `(RCS CVS SCCS)
(setq ange-ftp-ftp-program-name "pftp") ; ftp always in passive mode (set if behind NAT)
(setq inhibit-startup-message t)	; no startup image
(setq search-highlight t)		; highlight search string
(setq query-replace-highlight t)	; highlight query string
(setq mouse-sel-retain-highlight t)	; mouse highlighting
(setq dabbrev-case-replace nil)		; case-insensitive automatic completion

(set-face-background 'region "orange")  ; region background color
(set-background-color "white")		; emacsu background (color theme replaces it, see below)

(mouse-wheel-mode t)	; enable mouse scrolling

;(require 'auto-complete-extension)
;(load "hilit19")

; color theme
(require 'color-theme)
(color-theme-gray30)

;; emacs transparency

;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;; (set-frame-parameter (selected-frame) 'alpha '(85 50))
;; (add-to-list 'default-frame-alist '(alpha 85 50))

;;  (eval-when-compile (require 'cl))
;;  (defun toggle-transparency ()
;;    (interactive)
;;    (if (/=
;;         (cadr (find 'alpha (frame-parameters nil) :key #'car))
;;         100)
;;        (set-frame-parameter nil 'alpha '(100 100))
;;      (set-frame-parameter nil 'alpha '(85 60))))
;;  (global-set-key (kbd "C-c t") 'toggle-transparency)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mail
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(setq smtpmail-default-smtp-server "smtp.seznam.cz") ; needs to be specified before the (require)
;(require 'smtpmail)
;(setq send-mail-function 'smtpmail-send-it)
;(setq message-send-mail-function 'smtpmail-send-it)
;(setq user-full-name "David Durman")
;(setq smtpmail-local-domain "blog.promika.net/dave")
;(setq user-mail-address (concat "daviddurman@seznam.cz" smtpmail-local-domain))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; icicles @todo Look for it, it's great! Project like completion, searching, ...

;; DEVSML
;;(autoload 'xml-mode "xml-mode")
;;(setq auto-mode-alist
;;      (cons '("\\.devsml\\'" . xml-mode) auto-mode-alist))

;; better indentation than js2-mode
(autoload 'espresso-mode "espresso")

;; Praat mod
(setq load-path (cons "~/emacs" load-path))
(autoload 'praat-mode "praat-mode" "Enter Praat mode." t)
(setq auto-mode-alist (cons '("\\.praat$" . praat-mode) auto-mode-alist))

;; BEGIN js2-mode config

;; JavaScript advanced mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Improved indentation for js2-mode
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status))
           node)

      (save-excursion

        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ espresso-indent-level 2))))

        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-indent-sexp ()
  (interactive)
  (save-restriction
    (save-excursion
      (widen)
      (let* ((inhibit-point-motion-hooks t)
             (parse-status (syntax-ppss (point)))
             (beg (nth 1 parse-status))
             (end-marker (make-marker))
             (end (progn (goto-char beg) (forward-list) (point)))
             (ovl (make-overlay beg end)))
        (set-marker end-marker end)
        (overlay-put ovl 'face 'highlight)
        (goto-char beg)
        (while (< (point) (marker-position end-marker))
          ;; don't reindent blank lines so we don't set the "buffer
          ;; modified" property for nothing
          (beginning-of-line)
          (unless (looking-at "\\s-*$")
            (indent-according-to-mode))
          (forward-line))
        (run-with-timer 0.5 nil '(lambda(ovl)
                                   (delete-overlay ovl)) ovl)))))

(defun my-js2-mode-hook ()
  (require 'espresso)
  (setq espresso-indent-level 4
        indent-tabs-mode nil
        c-basic-offset 4)
  (c-toggle-auto-state 0)
  (c-toggle-hungry-state 1)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(meta control |)] 'cperl-lineup)
  (define-key js2-mode-map [(meta control \;)] 
    '(lambda()
       (interactive)
       (insert "/* -----[ ")
       (save-excursion
         (insert " ]----- */"))
       ))
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (define-key js2-mode-map [(control meta q)] 'my-indent-sexp)
  (if (featurep 'js2-highlight-vars)
    (js2-highlight-vars-mode))
  (message "My JS2 hook"))

;; END OF js2-mode config 

;; worse JavaScript mode
;;(autoload 'javascript-mode "javascript" nil t)
;;(add-to-list `auto-mode-alist `("\\.js\\'" . javascript-mode))

;; CSS mode
(autoload 'css-mode "css-mode")
(setq auto-mode-alist
      (cons '("\\.css\\'" . css-mode) auto-mode-alist))
; C-style CSS indentation
(setq cssm-indent-function #'cssm-c-style-indenter)

;; PHP mode
;;(require 'php-mode)

;; HTML mode indentation (default 2, changing to 4)
(add-hook 'html-mode-hook
	  (lambda ()
	    ;; Default indentation is usually 2 spaces, changing to 4.
	    (set (make-local-variable 'sgml-basic-offset) 4)))

;; GNU Smalltalk mode
;; (setq auto-mode-alist
;;            (append  '(("\\.st\\'" . smalltalk-mode))
;;                     auto-mode-alist))     
;;      (autoload 'smalltalk-mode "/usr/local/share/emacs/site-lisp/smalltalk-mode.elc" "" t)

;; JavaScript interpreter in emacs (Ejacs)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/js")  ; change this to the real location!
(autoload 'js-console "js-console" nil t)

;; Show matching parenteses
;(require 'paren) 
;; VI-style matching parenthesis - better
(defun match-paren (arg)
"Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "[([{]") (forward-sexp 1) (backward-char))
        ((looking-at "[])}]") (forward-char) (backward-sexp 1))))
(global-set-key "\C-cp" 'match-paren)

;;(require 'jabber) ; I think it's clear

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Run at startup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(shell)
;(ansi-term)     ;; shell

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Map file suffixes to modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Show HTML-like templates in HTML mode
(add-to-list `auto-mode-alist `("\\.tpl\\'" . html-mode))
(add-to-list `auto-mode-alist `("\\.ctp\\'" . html-mode))
(add-to-list `auto-mode-alist `("\\.kid\\'" . html-mode))

(setq auto-mode-alist (cons '("\\.xsl$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scxml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.devsml$" . nxml-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hooks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'python-mode-hook (lambda () 
   (define-key py-mode-map "\C-c#" 'comment-region)))
(add-hook 'python-mode-hook (lambda () 
   (define-key py-mode-map "\C-c;" 'uncomment-region)))
(add-hook 'js2-mode-hook 'my-js2-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Other crap. @todo Optimize, make it nicer...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun print-to-pdf ()
  "Prints current buffer to PDF, store the PDF to the same folder is the buffer file."
  (interactive)
  (ps-spool-buffer-with-faces)
  (switch-to-buffer "*PostScript*")
  (write-file "/tmp/tmp.ps")
  (kill-buffer "tmp.ps")
  (setq cmd (concat "ps2pdf14 /tmp/tmp.ps " (buffer-name) ".pdf"))
  (shell-command cmd)
  (shell-command "rm /tmp/tmp.ps")
  (message (concat "Saved to:  " (buffer-name) ".pdf"))
  )

(defun indent-buffer ()
  "indents entire buffer according to the current mode"
  (interactive)
  (indent-region 
   (point-min-marker)
   (point-max-marker)
   nil))

(defun ascii-table ()
  "prints the ASCII table"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))

(defun add-silksprite ()
  "Adds silk sprite to the current cursor position."
  (interactive)
  (insert "<span class=\"ss_sprite ss_")
  (insert (read-from-minibuffer "Silk sprite name:"))
  (insert "\">&nbsp;</span>")
)
  
;; @todo This is terrible, it's a quick ad-hoc solution.
(defun filter-pngcrush-output ()
  "Filters pngcrush output from unnecessary text."
  (interactive)
  (replace-regexp "^.*IDAT length with method.*$" "")
  (goto-char (point-min))
  (replace-regexp "^.*Total length of data found in IDAT chunks.*$" "")
  (goto-char (point-min))
  (replace-regexp "^.*color counting.*$" "")
  (goto-char (point-min))
  (replace-regexp "^.*Removed the .*$" "")
  (goto-char (point-min))
  (replace-regexp "^.*unknown chunk handling done.*$" "")
  (goto-char (point-min))
  (replace-regexp "^.*Best pngcrush method.*$" "")
  (goto-char (point-min))
  (replace-string "   Recompressing " "")
  (goto-char (point-min))
  (flush-lines "^$"))

(defun insert-latex-figure ()
  "Inserts template for a latex figure."
  (interactive)
  (insert "\\begin{figure}[h!]
  \\begin{center}
    \\includegraphics[scale=0.8]{img/}
  \\end{center}
  \\label{fig:}
  \\caption{}
\\end{figure}"))


(defun myconfigs ()
  "Opens some of my configuration files."
  (interactive)
  (find-file "~/.bashrc")
  (find-file "~/.bash_profile")
  (find-file "~/.bash_aliases")
  (find-file "~/.profile")
  (find-file "~/.mc/bindings")
  (find-file "~/.mplayer/config")
  (find-file "~/.emacs"))

;; Experiment. Not that good.
(defun php-man-search ()
  "Search the PHP manual in emacs using w3m.
   Assumes php manual as separate html files in .emacs.d/php/php-manual/html/"
  (interactive)
  (setq php-man-path "file:///home/dave/.emacs.d/php/php-manual/html/")
  (w3m-browse-url (concat php-man-path 
			  "function."
			  (replace-regexp-in-string "_" "-" 
						    (thing-at-point 'symbol))
			  ".html")))
  
(defun save-macro (name)                  
    "Saves a macro. Take a name as argument
     and save the last defined macro under 
     this name at the end of your .emacs file."
     (interactive "SName of the macro :")  ; ask for the name of the macro    
     (kmacro-name-last-macro name)         ; use this name for the macro    
     (find-file "~/.emacs")                ; open the .emacs file 
     (goto-char (point-max))               ; go to the end of the .emacs
     (newline)                             ; insert a newline
     (insert-kbd-macro name)               ; copy the macro 
     (newline)                             ; insert a newline
     (switch-to-buffer nil))               ; return to the initial buffer


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key shortcuts.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-c\C-k" 'comment-create)
(global-set-key "\C-c\C-l" 'comment-end)
(global-set-key "\C-ci" 'indent-buffer)
(global-set-key "\C-cj" 'goto-line)
(global-set-key [f5] 'copy-region-as-kill)	; Copy
(global-set-key [f6] 'kill-region)		; Cut
(global-set-key [f7] 'yank)			; Paste
(global-set-key "\C-cf" 'make-frame)		; new frame
(global-set-key "\C-cd" 'delete-frame)		; delete frame
(global-set-key "\C-cs" 'add-silksprite)	; Add Blueprint silk sprite
(global-set-key "\C-cm" 'php-man-search)	; search php manual for function at point
(global-set-key "\C-cl" 'insert-latex-figure)	; insert template for latex figure
(global-set-key "\C-ct" 'toggle-truncate-lines)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Macros.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'paren-line
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("()" 0 "%d")) arg)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Automatic customizations. (Always placed to the end of the file.)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.32")
 '(ecb-source-path (quote (("/" "/") "/home/ddur/perforce/mcl/component/ttnapplication/main/Munich/content/navx/models/siena/mirror/lib/mirror/controllers" "/home/ddur/perforce/nav3-base/fsbc/scc-common/main/Munich/content/nav3/packages/mirror/lib/mirror/controllers")))
 '(js2-basic-offset 4)
 '(js2-mode-escape-quotes nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
