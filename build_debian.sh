#!/bin/sh

# Install the necessary packages

PKGS="autoconf automake autopoint gcc gettext git groff make pkg-config texinfo libncurses-dev"

echo "Verifying package installations."
for pkg in $PKGS; do
  if ! dpkg -s $pkg >/dev/null 2>/dev/null; then
    sudo apt update && sudo apt install $pkg
  fi
done


./autogen.sh
./configure --enable-utf8 CFLAGS="-O3 -march=native"
make -j
sudo cp src/nano /usr/bin/nano
sudo cp src/nano /usr/local/bin/nano
