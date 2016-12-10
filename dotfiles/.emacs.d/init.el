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
