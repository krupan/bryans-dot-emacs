#! /bin/sh
set -e
set -x
REPO_DIR=$(pwd)
mv -f ~/.emacs.d{,bak}
mkdir -p ~/.config/emacs/
# just in case:
ln -s ~/.config/emacs ~/.emacs.d
cd ~/.config/emacs/
if [ ! -d eshell ]; then
    mkdir eshell
fi
ln -fs $REPO_DIR/dot-emacs init.el
for f in $REPO_DIR/*.el; do
    ln -fs $f
done
ln -fs $REPO_DIR/eshell-alias eshell/alias


