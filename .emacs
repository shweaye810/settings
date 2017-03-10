(setq backup-directory-alist `(("." . "~/.emacs_bk_files")))
(setq diff-switches "-u")

(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-c)
(require 'setup-general)
(require 'setup-ivy-counsel)
(require 'setup-cedet)
(require 'setup-editing)



;; function-args
;; (require 'function-args)
;; (fa-config-default)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(android-mode-sdk-dir "~/Android/Sdk/")
 '(c-default-style "linux")
 '(package-selected-packages
   (quote
    (vlf jdee racket-mode comment-dwim-2 zygospore zenburn-theme yasnippet ws-butler web-mode volatile-highlights undo-tree stickyfunc-enhance sr-speedbar smartparens php-mode multiple-cursors iedit helm-swoop helm-projectile helm-gtags google-c-style function-args flycheck-google-cpplint fill-column-indicator ess duplicate-thing dumb-jump dtrt-indent company-c-headers clean-aindent-mode anzu android-mode ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-line ((t (:background "black" :foreground "#FFD700")))))


;; aspell or ispell to work
(setq ispell-program-name "aspell")

(load-theme 'zenburn t)

(defun shwe-mode-hook ()
  (c-set-style "linux")
  (setq	c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (c-set-offset 'inline-open '0))

(require 'android-mode)



;; R in emacs
(require 'ess-site)
(ess-toggle-underscore nil)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))

;; php-mode
(require 'php-mode)
;; (eval-after-load 'php-mode
;;   '(require 'php-ext))
(add-hook 'c++-mode-hook 'shwe-mode-hook)
;; (add-hook 'prog-mode-hook 'show-paren-mode)
(add-hook 'java-mode-hook 'shwe-mode-hook)
(add-hook 'android-mode-hook 'shwe-mode-hook)
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; line at column 80
;; (require 'fill-column-indicator)
;; (setq fci-rule-column 79)
;; (setq fci-rule-width 2)
;; (setq fci-rule-color "#FFD700")
;; (add-hook 'prog-mode-hook 'fci-mode)


(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
;; (global-whitespace-mode t)
(add-hook 'prog-mode-hook 'whitespace-mode)
(set-face-attribute 'whitespace-line nil
                    :foreground nil
                    :background "#000"
                    :weight 'bold)

(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
(global-auto-revert-mode t)
