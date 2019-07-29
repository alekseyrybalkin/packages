pkgname=tk
_release=8.6
pkgver=${_release}.9.1
vcs=fossil
fossiltag=core-${pkgver//\./-}
relmon_id=11426
relmon_rules="skip_a"

build() {
    cd unix
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --enable-threads \
        --enable-64bit
    make
}

package() {
    cd unix
    make INSTALL_ROOT=${pkgdir} install install-private-headers
    ln -sf wish${_release} "${pkgdir}/usr/bin/wish"
    ln -sf libtk${_release}.so "${pkgdir}/usr/lib/libtk.so"

    # remove buildroot traces
    sed -e "s#${srcdir}/unix#/usr/lib#" \
        -e "s#${srcdir}#/usr/include#" \
        -i "${pkgdir}/usr/lib/tkConfig.sh"
    # remove man pages
    rm -rf ${pkgdir}/usr/share
}
