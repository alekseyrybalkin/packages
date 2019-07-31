pkgname=gmp
_release=6.1
pkgver=${_release}.2
vcs=mercurial
vcs_pkgname=gmp-${_release}
#FIXME no tag
hgtag=aad821ef06cb
relmon_id=1186

build() {
    ./.bootstrap
    ./configure --prefix=/usr \
        --enable-cxx \
        --disable-static \
        --build=x86_64-unknown-linux-gnu \
        --docdir=/usr/share/doc/gmp
    make
    make html
}

package() {
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} install-html
}
