#!/bin/sh

pkgname=lightlang
SKIP_ARCH_CHECK=1
vcs=git
pkgver=20140809
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i -e 's/\.sl/\.config\/sl/g' apps/sl/src/settings.h
    autoconf
    ./configure --with-gui-flag=no --with-python-xlib-flag=no --with-audio-player=aplay
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

known="usr/share/sl/dicts/Mueller-24.en-ru \
    usr/share/sl/dicts/Mova-Magus.en-ru \
    usr/share/sl/dicts/Babylon_Dictionary.ru-en \
    usr/share/sl/dicts/SDict_Dictionary.ru-en \
    usr/share/sl/dicts/Sokrat-Mova.ru-en"
