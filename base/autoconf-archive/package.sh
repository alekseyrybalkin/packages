pkgname=autoconf-archive
pkgver=2019.01.06
vcs=git
gittag=v${pkgver}
relmon_id=142

build() {
    # respect --docdir properly
    git revert --no-edit ad15d52fd1e552bc3d7fcfb3d7bc6a2681f364d8
    mkdir build-aux
    ln -sv /usr/bin/git-version-gen build-aux/git-version-gen
    touch README AUTHORS ChangeLog
    sed -i -e 's/doc//g' Makefile.am
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
