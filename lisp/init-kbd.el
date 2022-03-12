;;; init-kbd.el --- configs for key bind -*- lexical-binding: t -*-

;; Author: Cabins
;; Maintainer: Cabins
;; Version: 1.0
;; Package-Requires: ()
;; Homepage: https://github.com/cabins
;; Keywords:

;;; Commentary:
;; (c) Cabins Kong, 2020-2021

;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                    Global Keybinds Dependencies
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package crux)
(use-package hungry-delete)
(use-package drag-stuff)
(use-package format-all
  :diminish " Fmt."
  :init (add-hook 'prog-mode-hook 'format-all-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                   Global Key Bindings
;;
;; 当前版本全局按键绑定秉承以下原则：
;; 1. 自定义全局按键尽可能以C-c开头（或绑F5-F9），此为Emacs设计规范预期
;; 2. 记忆方式上，尽可能VSCode相近，因同在用VSCode
;; 3. 不违背Emacs Quirks [http://ergoemacs.org/emacs/keyboard_shortcuts.html]
;; 4. 为方便统一管理，全局按键不分散于use-package中，模式按键仍在use-package中
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Emacs Basic Keys ------------------------------
(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "C-c ,") #'crux-find-user-init-file)	; Open Settings
(global-set-key (kbd "C-c r") 'recentf-open-files) ; Open Recent Files

;; Window Move
(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>") 'windmove-up)
(global-set-key (kbd "C-c <down>") 'windmove-down)

;;; Code Editing ------------------------------
;; Comments（As C-x C-; is for comment-line, keep the postfix）
(global-set-key (kbd "C-c C-;") #'comment-or-uncomment-region)
;; Line Edit
(global-set-key (kbd "M-<down>") #'drag-stuff-down)
(global-set-key (kbd "M-<up>") #'drag-stuff-up)
(global-set-key (kbd "M-<left>") #'drag-stuff-left)
(global-set-key (kbd "M-<right>") #'drag-stuff-right)
(global-set-key (kbd "C-c C-d") #'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-a") #'crux-move-beginning-of-line)
;; Delete
(global-set-key (kbd "C-c <backspace>") #'hungry-delete-backward)
(global-set-key (kbd "C-c <delete>") #'hungry-delete-forward)
;; Code Beautify
(global-set-key (kbd "C-o") #'yas-expand)
(global-set-key (kbd "C-c f") #'format-all-buffer)
;; Syntax
(global-set-key (kbd "M-n") #'flymake-goto-next-error)
(global-set-key (kbd "M-p") #'flymake-goto-prev-error)
;; treemacs
(global-set-key (kbd "<f8>") 'treemacs)
;; consult
(global-set-key (kbd "C-c h") 'consult-history)
(global-set-key (kbd "C-c m") 'consult-mode-command)
(global-set-key (kbd "C-c k") 'consult-kmacro)
;; C-x bindings (ctl-x-map)
(global-set-key (kbd "C-x M-:") 'consult-complex-command)     ;; orig. repeat-complex-command
(global-set-key (kbd "C-x b") 'consult-buffer)                ;; orig. switch-to-buffer
(global-set-key (kbd "C-x 4 b") 'consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
(global-set-key (kbd "C-x 5 b") 'consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
(global-set-key (kbd "C-x r b") 'consult-bookmark)            ;; orig. bookmark-jump
(global-set-key (kbd "C-x p b") 'consult-project-buffer)      ;; orig. project-switch-to-buffer
;; Custom M-# bindings for fast register access
(global-set-key (kbd "M-#") 'consult-register-load)
(global-set-key (kbd "M-'") 'consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
(global-set-key (kbd "C-M-#") 'consult-register)
;; Other custom bindings
(global-set-key (kbd "M-y") 'consult-yank-pop)                ;; orig. yank-pop
(global-set-key (kbd "<help> a") 'consult-apropos)            ;; orig. apropos-command
;; M-g bindings (goto-map)
(global-set-key (kbd "M-g e") 'consult-compile-error)
(global-set-key (kbd "M-g f") 'consult-flymake)               ;; Alternative: consult-flycheck
(global-set-key (kbd "M-g g") 'consult-goto-line)             ;; orig. goto-line
(global-set-key (kbd "M-g M-") 'consult-goto-line)           ;; orig. goto-line
(global-set-key (kbd "M-g o") 'consult-outline)               ;; Alternative: consult-org-heading
(global-set-key (kbd "M-g m") 'consult-mark)
(global-set-key (kbd "M-g k") 'consult-global-mark)
(global-set-key (kbd "M-g i") 'consult-imenu)
(global-set-key (kbd "M-g I") 'consult-imenu-multi)
;; M-s bindings (search-map)
(global-set-key (kbd "M-s d") 'consult-find)
(global-set-key (kbd "M-s D") 'consult-locate)
(global-set-key (kbd "M-s g") 'consult-grep)
(global-set-key (kbd "M-s G") 'consult-git-grep)
(global-set-key (kbd "M-s r") 'consult-ripgrep  )
(global-set-key (kbd "M-s l") 'consult-line)
(global-set-key (kbd "M-s L") 'consult-line-multi)
(global-set-key (kbd "M-s m") 'consult-multi-occur)
(global-set-key (kbd "M-s k") 'consult-keep-lines)
(global-set-key (kbd "M-s u") 'consult-focus-lines)
;; Isearch integration
(global-set-key (kbd "M-s e") 'consult-isearch-history)
;;embark
(global-set-key (kbd "C-.") 'embark-act)         ;; pick some comfortable binding
(global-set-key (kbd "C-;") 'embark-dwim)        ;; good alternative: M-.
(global-set-key (kbd "C-h B") 'embark-bindings)

(provide 'init-kbd)

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
;;; init-kbd.el ends here
