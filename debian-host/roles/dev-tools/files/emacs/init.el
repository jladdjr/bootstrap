;; evil
(require 'evil)
(evil-mode 1)

;; projectile
;; https://docs.projectile.mx/projectile/installation.html
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

;; Magit
;; https://magit.vc/manual/magit/
(require 'magit)
