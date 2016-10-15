;; load package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; load use-package
(add-to-list 'load-path "~/.emacs.d/use-package")
(require 'use-package)

;; load req-package
(add-to-list 'load-path "~/.emacs.d/req-package")
(require 'req-package)

;; load initializations
(add-to-list 'load-path "~/.emacs.d/init.d")
(require 'init-preferences)
(req-package-finish)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(ht log4e dash markdown-mode haskell-mode flymd darcula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
