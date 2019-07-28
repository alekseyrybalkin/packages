pkgname=icu
pkgver=64.2
vcs=git
gittag=release-${pkgver//\./-}
relmon_id=16134
relmon_rules="repl_dash_dot,skip_rc"

build() {
    cd icu4c/source
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

package() {
    cd icu4c/source
    make DESTDIR=${pkgdir} install
}
