(setq user-full-name "Wojciech Chodkowski"
      user-mail-address "chodkows@gmail.com")

(setq org-directory "~/git/notes/")

(setq display-line-numbers-type t)

(set-frame-parameter (selected-frame) 'alpha '(95 95))
(use-package org-tree-slide
  :custom
  (org-image-actual-width nil))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(defun ek/babel-ansi ()
  (when-let ((beg (org-babel-where-is-src-block-result nil nil)))
    (save-excursion
      (goto-char beg)
      (when (looking-at org-babel-result-regexp)
        (let ((end (org-babel-result-end))
              (ansi-color-context-region nil))
          (ansi-color-apply-on-region beg end))))))
(add-hook 'org-babel-after-execute-hook 'ek/babel-ansi)
