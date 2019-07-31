pkgname=libnl
pkgver=3.4.0
vcs=git
gittag=libnl${pkgver//\./_}
relmon_id=1684
relmon_rules="repl_underscore_dot,skip_rc"

build() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
