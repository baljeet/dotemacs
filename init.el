
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/")  t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(when (member "Source Code Pro" (font-family-list)) (set-frame-font "Source Code Pro-16" t t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(doom-modeline-height 40)
 '(helm-truncate-lines t)
 '(package-selected-packages
   (quote
    (rjsx-mode emmet-mode magit neotree web-mode yasnippet-snippets vue-mode vue-html-mode mmm-mode company-tern xref-js2 js2-refactor js2-mode helm-projectile projectile doom-modeline doom-themes color-theme-solarized cherry-blossom-theme berrys-theme whole-line-or-region smartparens use-package idle-org-agenda counsel-org-clock counsel-org-capture-string org-protocol-jekyll orgnav orca org-drill org-pomodoro org-clock-today org-brain org-bullets org-plus-contrib)))
 '(projectile-completion-system (quote helm))
 '(tool-bar-mode nil))
(require 'helm-config)
(require 'helm-projectile)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(use-package idle-org-agenda
  :after org-agenda
  :ensure t
  :config (idle-org-agenda-mode))
(tool-bar-mode -1)
(setq apropos-sort-by-scores t)
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(global-set-key [remap dabbrev-expand] 'hippie-expand)
(global-set-key (kbd "M-i") 'imenu)
(windmove-default-keybindings)
(require 'doom-themes)
(load-theme 'doom-one t)
(doom-themes-visual-bell-config)
(doom-themes-org-config)
(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))
(setq doom-modeline-height 40)
(setq doom-modeline-bar-width 3)
(setq doom-modeline-project-detection 'project)
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
(setq doom-modeline-icon (display-graphic-p))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-buffer-modification-icon t)
(setq doom-modeline-unicode-fallback nil)
(setq doom-modeline-minor-modes t)
(setq doom-modeline-enable-word-count t)
(display-time-mode t)
(display-battery-mode t)
(require 'smartparens-config)
;; Use smartparens
(smartparens-global-mode t)
;; Use show-smartparens, which highlights matched pairs
(show-smartparens-global-mode)

(projectile-global-mode t)
;; Use helm-projectile
(customize-set-variable 'projectile-completion-system 'helm)
(helm-projectile-on)
;; Truncate long lines with helm
;; Only seems to affect helm-projectile
(customize-set-variable 'helm-truncate-lines t)

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
                           
;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)
(require 'magit)

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-html-mode-hook)
(add-hook 'html-mode-hook 'emmet-html-mode-hook)
(add-hook 'css-mode-hook 'emmet-css-mode-hook)
 
(defun emmet-html-mode-hook ()
  (emmet-mode)
  (ac-emmet-html-setup))
 
(defun emmet-css-mode-hook ()
  (emmet-mode)
  (ac-emmet-css-setup))

(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . rjsx-mode))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
