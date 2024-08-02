{ pkgs, ... }: {  
  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacs-gtk;
      extraComfig = "
        ;;; Personal configuration -*- lexical-binding: t -*-

		;; Save the contents of this file under ~/.emacs.d/init.el
		;; Do not forget to use Emacs' built-in help system:
		;; Use C-h C-h to get an overview of all help commands.  All you
		;; need to know about Emacs (what commands exist, what functions do,
		;; what variables specify), the help system can provide.

		;; Disable the menu bar
		(menu-bar-mode -1)

		;; Disable the tool bar
		(tool-bar-mode -1)

		;; Disable the scroll bars
		(scroll-bar-mode -1)

		;; Disable splash screen
		(setq inhibit-startup-screen t)

		;;; Completion framework
		(unless (package-installed-p 'vertico)
		(package-install 'vertico))

		;; Enable completion by narrowing
		(vertico-mode t)

		;; Enable horizontal completion
		(vertico-flat-mode t)

		;; Improve directory navigation

		;;; Extended completion utilities
		(unless (package-installed-p 'consult)
		(package-install 'consult))
		(global-set-key [rebind switch-to-buffer] #'consult-buffer)
		(global-set-key (kbd "C-c j") #'consult-line)
		(global-set-key (kbd "C-c i") #'consult-imenu)
		(setq read-buffer-completion-ignore-case t
			read-file-name-completion-ignore-case t
			completion-ignore-case t)

		;; Enable line numbering by default
		(global-display-line-numbers-mode t)

		;; Automatically pair parentheses
		(electric-pair-mode t)

		;;; LSP Support
		(unless (package-installed-p 'eglot)
		(package-install 'eglot))

		;; Enable LSP support by default in programming buffers
		(add-hook 'prog-mode-hook #'eglot-ensure)

		;; Create a memorable alias for `eglot-ensure'.
		(defalias 'start-lsp-server #'eglot)

		;;; Git client
		(unless (package-installed-p 'magit)
		(package-install 'magit))

		;; Bind the `magit-status' command to a convenient key.
		(global-set-key (kbd "C-c g") #'magit-status)

		;;; Indication of local VCS changes
		(unless (package-installed-p 'diff-hl)
		(package-install 'diff-hl))

		;; Enable `diff-hl' support by default in programming buffers
		(add-hook 'prog-mode-hook #'diff-hl-mode)

		;; Update the highlighting without saving
		(diff-hl-flydiff-mode t)

		;;; Go Support
		(unless (package-installed-p 'go-mode)
		(package-install 'go-mode))

		;;; Haskell Support
		(unless (package-installed-p 'haskell-mode)
		(package-install 'haskell-mode))

		;;; JSON Support
		(unless (package-installed-p 'json-mode)
		(package-install 'json-mode))

		;;; NASM Support
		(unless (package-installed-p 'nasm-mode)
		(package-install 'nasm-mode))

		;;; Rust Support
		(unless (package-installed-p 'rust-mode)
		(package-install 'rust-mode))

		;;; Additional Lisp support
		(unless (package-installed-p 'sly)
		(package-install 'sly))

		;;; Standard ML Support
		(unless (package-installed-p 'sml-mode)
		(package-install 'sml-mode))

		;;; Typescript Support
		(unless (package-installed-p 'typescript-mode)
		(package-install 'typescript-mode))

		;;; YAML Support
		(unless (package-installed-p 'yaml-mode)
		(package-install 'yaml-mode))

		;;; LaTeX support
		(unless (package-installed-p 'auctex)
		(package-install 'auctex))
		(setq TeX-auto-save t)
		(setq TeX-parse-self t)
		(setq-default TeX-master nil)

		;;; Markdown support
		(unless (package-installed-p 'markdown-mode)
		(package-install 'markdown-mode))

		;;; In-Emacs Terminal Emulation
		(unless (package-installed-p 'eat)
		(package-install 'eat))

		;; Close the terminal buffer when the shell terminates.
		(setq eat-kill-buffer-on-exit t)

		;; Enable mouse-support.
		(setq eat-enable-mouse t)

		;; Miscellaneous options
		(setq-default major-mode
					(lambda () ; guess major mode from file name
					(unless buffer-file-name
						(let ((buffer-file-name (buffer-name)))
						(set-auto-mode)))))
		(setq confirm-kill-emacs #'yes-or-no-p)
		(setq window-resize-pixelwise t)
		(setq frame-resize-pixelwise t)
		(save-place-mode t)
		(savehist-mode t)
		(recentf-mode t)
		(defalias 'yes-or-no #'y-or-n-p)

		;; Store automatic customisation options elsewhere
		(setq custom-file (locate-user-emacs-file "custom.el"))
		(when (file-exists-p custom-file)
		(load custom-file))

      ";
    };
  };
}
