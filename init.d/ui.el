(message "Loading UI customizations")

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)

;; Display line number
(global-display-line-numbers-mode)

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Default font: Essential PragmataPro. The best font ever!
;; I don't know why but on MacOS I must use a bigger font. Px vs Pt?
(if (eq system-type 'darwin)
  (progn
    (set-face-attribute 'default nil :font "PragmataPro Liga-12")
  )
    (set-face-attribute 'default nil :font "PragmataPro Liga-10")
)

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'darcula t)

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)
      
;; disable a single keypress of Windows key
;; https://emacs.stackexchange.com/questions/48720/disable-left-win-key-in-emacs-for-windows
(setq w32-pass-lwindow-to-system nil)