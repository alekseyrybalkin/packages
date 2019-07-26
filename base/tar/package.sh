pkgname=tar
pkgver=1.32
vcs=git
gittag=release_${pkgver//\./_}
relmon_id=4939

build() {
    git clone -s `find_vcs_repo gnulib`
    git clone -s `find_vcs_repo paxutils`
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --enable-gcc-warnings=no \
        --build=x86_64-unknown-linux-gnu \
        --libexecdir=/usr/bin
    make
}

package() {
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} -C doc install-html docdir=/usr/share/doc/tar
}
