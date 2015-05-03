#!/bin/bash

source `dirname $0`/../_environment.sh

if [ -z "$PREFIX" ] ; then
  require_root
  PREFIX=/opt
fi;

mkdir -p $PREFIX/bin

curl 'http://beyondgrep.com/ack-2.14-single-file' > $PREFIX/bin/ack
chmod +x $PREFIX/bin/ack

CONSOLE_SRC=$USER_HOME/src/console

checkout_repo "$CONSOLE_SRC" "screen" \
              "git://git.savannah.gnu.org/screen.git" \
              "master"

cd $CONSOLE_SRC/screen/src
./autogen.sh && ./configure --prefix=$PREFIX && make && make install

checkout_repo "$CONSOLE_SRC" "vim" \
              "https://github.com/vim/vim.git" \
              "master"

cd $CONSOLE_SRC/vim
./configure --prefix=$PREFIX && make && make install

