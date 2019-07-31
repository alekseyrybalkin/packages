pkgname=libaio
pkgver=0.3.112
vcs=git
#FIXME no tag
gittag=8a71c9c7bdccb9dd5772d98e83c8c35a7771bb00
relmon_id=1557

build() {
    sed -i '/install.*libaio.a/s/^/#/' src/Makefile
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
