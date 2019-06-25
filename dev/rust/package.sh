#!/bin/sh

pkgname=rust
pkgver=1.35.0
vcs=git
gittag=${pkgver}
relmon_id=7635

kiin_make() {
    cp ../config.toml .

    git clone ${SOURCES_HOME}/dev/rust-installer src/tools/rust-installer
    git clone ${SOURCES_HOME}/dev/cargo src/tools/cargo
    git clone ${SOURCES_HOME}/dev/nomicon src/doc/nomicon

    python ./x.py build -j$(nproc) --exclude src/tools/miri
}

kiin_install() {
    DESTDIR=${pkgdir} python ./x.py install
}
