Emacs-org
=========

RAW config for org-export and some basic editing


installation
------------

1. New emacs 

    sudo add-apt-repository -y ppa:cassou/emacs
    sudo apt-get update
    sudo apt-get -y install emacs24 emacs24-el emacs24-common-non-dfsg
    git clone git@github.com:exu/emacs-org.git ~/.emacs.d
    emacs

    
2. New org mode

    M-x package-install <RET>
    org <RET>

    M-x package-install <RET>
    org-plus-contrib <RET>
    
    
2.FUCK. (optional)  ELPA bug can't export to markdown
    
run `emacs -q` from shell (emacs without any config files)

goto "*scratch*" buffer and paste (C-y) from clipboard this:

    (require 'package)<----- C-xC-e
    (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)<----- C-xC-e

On each line end execute `C-x C-e` (`eval-line`) after that 

after that `GOTO step 2`
   


999. Why emacs? Because it rocks http://emacsrocks.com/
   