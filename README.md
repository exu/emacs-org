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

### Optional dependencies

PDF export in org-mode

```
sudo apt-get -y install texlive texlive-latex-extra
```

UML diagrams export in org-mode

```
sudo apt-get -y install graphviz ditaa
mkdir -p ~/Appz; curl -L http://sourceforge.net/projects/plantuml/files/plantuml.jar/download > ~/Appz/plantuml.jar
```

learn about UML diagrams in plain text http://plantuml.sourceforge.net/index.html


Basics in this config
---------------------

- `C-g` - abort (if you f*** up sth)
- `F4` - runs directory browser `dired`
- `C-right` - next-buffer
- `C-left`  - previous-buffer

- `C-x C-b` - ibuffer - opened buffers browser
- `C-x ^` - join-line
- `C-x p`- proced
- `C-x \` - align-regexp

- `<f2>` prefix to open directory
- `<f2>a` - "/etc/apache2"
- `<f2>p` - "/etc/postgresql/9.1/main"
- `<f2>e` - "/etc/"
- `<f2>w` - "/srv/www/"
- `<f2>c` - "/srv/www/crm"
- `<f2>q` - "/srv/www/qarson"

- `<f5>` - kmacro-start-macro
- `<f6>` - kmacro-end-macro
- `<f7>` - kmacro-end-and-call-macro


Basics in emacs
---------------

### Ask for help

- `C-h t` - learn by doing tutorial (Basics of basics)
- `C-h m` - help about mode in which you are
- `C-h C-h` - help about help
- `C-h k` - I want to know what that fucking key do!
- `C-h f` - as above but about some functions
- `C-h r` - parts of emacs (why it's so cool look at emacsrocks too)


### Links

- http://orgmode.org/worg/org-tutorials/org4beginners.html
- http://cheat.errtheblog.com/s/orgmode

### Moving

- `C-f` - move forward
- `C-b` - move backward

- `C-n` - move next line
- `C-b` - move previous line

- `M-f` - move forward by word
- `M-b` - move backward by word




### Selecting text

- `C-SPACE` - start text selecting (config allows to select by SHIFT-ARROWS)
- `C-M-SPACE` - mark expression (different behaviour in each mode)

### Cut - Copy - paste

- `C-y` - paste
- `M-w` - copy
- `C-w` - cut (add to kill-ring, its a "RING" so we can move around it on paste look below!)

### Advanced Cut - Copy - paste example

- you can COPY COPY COPY COPY COPY
- and paste e.g. 3rd copied element (from "kill-ring" by:

```
C-y M-y M-y
```


### Rectangles ###

- Select text

```
C-SPACE
smome text smome text smome text smome text
smome text smome text smome text smome text
smome text smome text smome text smome text
smome text smome text smome text smome text
smome text smome text smome text smome text
C-SPACE
```
- `C-x r t` - emacs ask You what to put there (e.g. " - ")
- Result:
```
 - smome text smome text smome text smome text
 - smome text smome text smome text smome text
 - smome text smome text smome text smome text
 - smome text smome text smome text smome text
 - smome text smome text smome text smome text
```

- `C-x r d` - deletes rectangle (tip rectangle is two dimensional)

Why emacs?
----------

- Because it rocks http://emacsrocks.com/

- Because it have some plugins
  - magit - http://magit.github.io/magit/magit.html
  - yasnippet - http://www.youtube.com/watch?v=ZCGmZK4V7Sg ,
    https://github.com/capitaomorte/yasnippet
  - multiple cursors - https://github.com/magnars/multiple-cursors.el
  - elpa repository with plugins
