pkgname=man-db
pkgver=2.8.5
vcs=git
gittag=${pkgver}
relmon_id=1882

build() {
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib \
        --libdir=/usr/lib \
        --docdir=/usr/share/doc/man-db \
        --sysconfdir=/etc \
        --disable-setuid \
        --with-browser=/usr/bin/lynx \
        --with-vgrind=/usr/bin/vgrind \
        --with-grap=/usr/bin/grap \
        --enable-cache-owner=root \
        --with-systemdsystemunitdir=/usr/lib/systemd/system
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
