;(package-initialize)

(require 'package)

;;bootstrap utils

(setq package-enable-at-startup nil)

;; turn off startup screen

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Set the backup folder
  (if (eq system-type 'darwin)
    (setq backup-directory-alist `(("." . "~/Desktop/Black Hole")))
    (setq backup-directory-alist `(("." . "c:\\temp\\emacs_saves")))
)

;; load extensions

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init-real.el")))
