(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-refresh-contents)

(package-install 'org)
(package-install 'org-plus-contrib)
