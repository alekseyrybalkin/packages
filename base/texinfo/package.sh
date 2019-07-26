pkgname=texinfo
pkgver=6.6
vcs=git
gittag=texinfo-${pkgver}
relmon_id=4958

build() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}

known="usr/share/info/dir"
