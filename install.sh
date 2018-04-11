#! /bin/sh
set -e
set -x
REPO_DIR=$(pwd)
cd ~/.emacs.d/
ln -fs $REPO_DIR/dot-emacs init.el
for f in $REPO_DIR/*.el; do
    ln -fs $f
done

