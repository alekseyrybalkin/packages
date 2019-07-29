pkgname=ccache
pkgver=3.7.2
vcs=git
gittag=v${pkgver}
relmon_id=257

build() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --sysconfdir=/etc
    make
}

package() {
    CHOST=x86_64-unknown-linux-gnu
    install -Dm 755 ccache ${pkgdir}/usr/bin/ccache

    install -d ${pkgdir}/usr/lib/ccache/bin
    for prog in gcc g++ c++ cc cpp; do
        ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${prog}
        ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-${prog}
    done
    for prog in clang clang++; do
        ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${prog}
    done
}