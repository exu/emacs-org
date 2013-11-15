Emacs-org
=========

RAW config for org-export and some basic editing


installation
------------

TLDR version
------------

```
curl -L https://raw.github.com/exu/emacs-org/master/INSTALL | sh
```

New emacs installation - verbose 
--------------------------------

```
mv ~/.emacs.d ~/.emacs.d.backup
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get -y install emacs24 emacs24-el emacs24-common-non-dfsg
git clone https://github.com/exu/emacs-org.git ~/.emacs.d
mkdir ~/.emacs.d/vendor
mkdir ~/.emacs.d/elpa
emacs -q -l ~/.emacs.d/elpa-org.el
```
    

Why emacs?
----------

Because it rocks http://emacsrocks.com/
