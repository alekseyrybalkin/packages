#!/bin/sh

pkgname=autoconf
pkgver=2.69
vcs=git
gittag=v${pkgver}
relmon_id=141

build() {
    # doc: fix texinfo macro usage
    git cherry-pick a357718b081f1678748ead5d7cb67c766c930441
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
    cp build-aux/git-version-gen ${pkgdir}/usr/bin/
}
