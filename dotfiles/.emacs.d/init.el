; Definition of package repositories
;
(require 'package) 
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) 

; Theme
;
(load-theme 'wombat t)

; Disbale menu bar
;
(menu-bar-mode -1)

; Line num mode
;
(setq linum-format "%4d ")
(global-linum-mode t)

; Multiple cursors
;
(global-set-key (kbd "C-c l") 'mc/edit-lines)
(global-set-key (kbd "C-c e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c a") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-c >") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c <") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c =") 'mc/mark-all-like-this)

; Neotree 
;
(setq projectile-switch-project-action 'neotree-projectile-action)
(setq neo-smart-open t)
(global-set-key (kbd "C-c t") 'neotree-toggle)

; Fuzzy finder
;
(global-set-key (kbd "C-c f") 'fiplr-find-file)
(global-set-key (kbd "C-c d") 'fiplr-find-directory)

; Alchemist
;
(setq alchemist-mix-command "~/bin/mix")
(setq alchemist-iex-program-name "~/bin/iex") 
(setq alchemist-execute-command "~/bin/elixir") 
(setq alchemist-compile-command "~/bin/elixirc")

; Company
;
(add-hook 'after-init-hook 'global-company-mode)

; Helm
;
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           nil
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line        t
      helm-M-x-fuzzy-match                  t)                

(defun helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
		   (let ((bg-color (face-background 'default nil)))
		     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
	  'helm-hide-minibuffer-maybe)

(setq helm-autoresize-min-height 20)
(setq helm-autoresize-max-height 40)
(setq helm-autoresize-mode t)
(helm-mode 1)

; Projectile
;
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
