;(package-initialize)

(require 'package)

;;bootstrap utils

(setq package-enable-at-startup nil)

;; turn off startup screen

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; load extensions

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init-real.el")))
