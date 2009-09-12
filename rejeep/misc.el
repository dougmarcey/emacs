;;; misc.el --- Stuff that don't fit anywhere else goes here

;; Want to use this in many modes.
(require 'flymake)

;; Custom file.
(setq custom-file "~/.emacs.d/rejeep/custom.el")
(load custom-file)

;; Open files with specified external programs.
(require 'openwith)
(openwith-mode t)

;; Default spelling dictionary.
(setq ispell-dictionary "english")

;; Add flyspell to modes.
(add-hook 'ruby-mode-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'java-mode-hook 'flyspell-prog-mode)
(add-hook 'espresso-mode-hook 'flyspell-prog-mode)
(add-hook 'magit-log-edit-mode-hook 'flyspell-mode)
(add-hook 'yaml-mode-hook 'flyspell-mode)

;; Interactively do, or ido
(ido-mode t)

;; Prefix matching enabled.
(setq ido-enable-prefix nil)

;; Flexible string matching (pacu will match package.use).
(setq ido-enable-flex-matching t)

;; Always create buffer if no buffer matches search string.
(setq ido-create-new-buffer 'always)

;; Look for filename at point.
(setq ido-use-filename-at-point nil)

;; Show max 10 matches.
(setq ido-max-prospects 10)

;; Hide menubar.
(menu-bar-mode nil)

;; Hide toolbar.
(tool-bar-mode nil)

;; Hide scrollbar.
(scroll-bar-mode nil)

;; Highlight the selected region.
(transient-mark-mode t)

;; Show information in minibuffer instead of as a tooltip.
(tooltip-mode nil)

;; Hitting delete will delete region
;; and selecting a region and then
;; press a character will replace
;; region with that character.
(pending-delete-mode 1)

;; Indent with spaces, instead of tabs.
(setq-default indent-tabs-mode nil)

;; No backup files
(setq make-backup-files nil)

;; kill-line will kill whole line (including empty line).
(setq kill-whole-line t)

;; Skip startup message.
(setq inhibit-startup-message t)

;; Title will show active buffer.
(setq frame-title-format "Emacs - '%b'")

;; Yellow cursor.
(set-cursor-color "#FFFF00")

;; White mouse pointer.
(set-mouse-color "white")

;; So that you only have to type y / n instead of yes / no.
(fset 'yes-or-no-p 'y-or-n-p)

;; Easy buffer switching by holding down shift and press any arrow key.
(windmove-default-keybindings 'shift)

;; Show unfinished keystrokes early.
(setq echo-keystrokes 0.1)

;; Maximum decoration
(setq font-lock-maximum-decoration t)

;; No ECB tip of the day.
(setq ecb-tip-of-the-day nil)

;; Wider IRC column.
(setq rcirc-fill-column 150)

;; Yank where pointer is.
(setq mouse-yank-at-point t)

;; Use firefox as default browser.
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/usr/bin/firefox")

;; Enable narrowing.
(put 'narrow-to-region 'disabled nil)

;; Highlight matching parenthesis.
(show-paren-mode 1)

;; Show empty lines at end of buffer.
(set-default 'indicate-empty-lines t)

;; For it's awesome rectangle mode.
(setq cua-enable-cua-keys nil)
(setq cua-toggle-set-mark nil)
(cua-mode)

;; Show line numbers.
(require 'linum)

;; Git interaction.
(require 'magit)

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; Don't insert twice when no region is selected.
(setq wrap-region-insert-twice nil)

;; Run after wraping a region.
(add-hook 'wrap-region-after-hook
          '(lambda ()
             (indent-region wrap-region-beginning wrap-region-end)))

;; Paste buffer/region or get pastie.
(require 'pastie)

;; Snippets.
(require 'dropdown-list)
(require 'yasnippet)
(yas/load-directory "~/.emacs.d/snippets")
(yas/initialize)

;; Emacs Code Browser.
(require 'ecb)

;; Easy building of regular expressions.
(require 're-builder)
(require 're-builder+)

;; Prefer utf8.
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Colorize parenthesis.
(require 'parenface)

;; Show battery information in the mode-line.
(require 'battery)
(display-battery-mode)

;; Show wireless information in mode-line.
(require 'wireless)
(display-wireless-mode t)

;; Indentation level by default is 2.
(setq-default c-basic-offset 2)

;; Display time and date in mode-line.
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;; Use keats to handle keyboard shortcuts.
(setq keats-file "~/dev/emacs/keats")
(require 'keats)
(require 'keats-interactive)
(keats-mode t)

;; delete-trailing-whitespace is to long.
(defalias 'dtw 'delete-trailing-whitespace)

;; Remember window configuration.
(winner-mode 1)

;; W3M settings.
(setq w3m-use-cookies t)
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

;; Add parts of each file's directory to the buffer name if not
;; unique.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Minimal finge.
(fringe-mode 'minimal)

;; Auto complete settings.
(require 'auto-complete)
(global-auto-complete-mode t)
(global-set-key (kbd "M-/") 'ac-start)
(define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(define-key ac-complete-mode-map (kbd "n") 'ac-next)
(define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map (kbd "p") 'ac-previous)
(define-key ac-complete-mode-map (kbd "C-g") 'ac-stop)
(setq ac-auto-start nil)
(setq-default ac-sources '(ac-source-words-in-all-buffer))

;; Save place in files.
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Allow up and down case of region.
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Set font-size.
(set-face-attribute 'default nil :height 110)

;; Associate modes with file extensions.
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(provide 'misc)