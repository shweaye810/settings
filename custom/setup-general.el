(menu-bar-mode -1)
(tool-bar-mode -1)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

(global-set-key (kbd "<C-f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))


(add-hook 'c++-mode-hook
          (lambda ()
            (unless (or (file-exists-p "makefile")
                        (file-exists-p "Makefile"))
              (set (make-local-variable 'compile-command)
                   (concat "g++ -g -Wall -std=c++11 " (buffer-name) " -o "
                           (file-name-sans-extension (buffer-name)) ".out"
                           ;;" && ./" file_name ".out"
                           )))))

;; (defun compile_cpp()
;;   (defvar file_name (file-name-base buffer-file-name))
;;   (interactive)
;;   (shell-command (concat "g++ -g -Wall -std=c++11 " file_name ".cpp -o "
;;                              file_name ".out" ;;" && ./" file_name ".out"
;;                              )))

(global-set-key (kbd "<f9>") (lambda ()
                                 (interactive)
                                 (call-interactively 'run)))
(defun run()
  (interactive)
  (with-output-to-temp-buffer "*Shell Output*"
    (shell-command (concat "./" (file-name-base buffer-file-name) ".out")
                   "*Shell Output*"
                   "*Shell Output*")))

(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (call-interactively 'gdb)))
;; (global-set-key (kbd "<f5>") 'debug-this-prog)

;; (setq
;;  ;; use gdb-many-windows by default
;;  gdb-many-windows t

;;  ;; Non-nil means display source file containing the main routine at startup
;;  gdb-show-main t
;;  )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))

                                        ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

(provide 'setup-general)
