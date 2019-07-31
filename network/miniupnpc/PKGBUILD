pkgname=miniupnpc
pkgver=2.1
ARCH_VERSION=2.1.20190408
vcs=git
vcs_pkgname=miniupnp
gittag=miniupnpc_${pkgver//\./_}
relmon_id=1986
relmon_rules="skip_big_first,repl_underscore_dot"

build() {
    cd miniupnpc
    make
}

package() {
    cd miniupnpc
    make DESTDIR=${pkgdir} install
}
