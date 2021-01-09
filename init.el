;(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;;bootstrap utils

;; (setq package-enable-at-startup nil)

;; turn off startup screen

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Set the backup folder
  (if (eq system-type 'darwin)
    (setq backup-directory-alist `(("." . "~/Desktop/Black Hole")))
    (setq backup-directory-alist `(("." . "c:\\temp\\emacs_saves")))
)

(defvar my-packages
    '(;; makes handling lisp expressions much, much easier
      ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
      paredit

      ;; key bindings and code colorization for Clojure
      ;; https://github.com/clojure-emacs/clojure-mode
      clojure-mode

      ;; extra syntax highlighting for clojure
      clojure-mode-extra-font-locking

      ;; integration with a Clojure REPL
      ;; https://github.com/clojure-emacs/cider
      cider

      ;; allow ido usage in as many contexts as possible. see
      ;; customizations/navigation.el line 23 for a description
      ;; of ido
      ido-completing-read+

      ;; Enhances M-x to allow easier execution of commands. Provides
      ;; a filterable list of possible commands in the minibuffer
      ;; http://www.emacswiki.org/emacs/Smex
      smex

      ;; project navigation
      projectile

      ;; colorful parenthesis matching
      rainbow-delimiters
      
      ;; company mode
      company

      ;; theme
      darcula-theme
))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/init.d")

(load "preferences.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; Load server mode - Not working. TODO
;; (load "server.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")