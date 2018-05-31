#! /bin/sh
set -e
set -x
REPO_DIR=$(pwd)
cd ~/.emacs.d/
if [ ! -d eshell ]; then
    mkdir eshell
fi
ln -fs $REPO_DIR/dot-emacs init.el
for f in $REPO_DIR/*.el; do
    ln -fs $f
done
ln -fs $REPO_DIR/eshell-alias eshell/alias


