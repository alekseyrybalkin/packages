pkgname=iptables
pkgver=1.8.3
vcs=git
gittag=v${pkgver}
relmon_id=1394

build() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --with-xtlibdir=/usr/lib/xtables \
        --disable-nftables \
        --enable-libipq
    make
}

package() {
    make DESTDIR=${pkgdir} install
    install -Dm644 ../iptables.service ${pkgdir}/usr/lib/systemd/system/iptables.service
    install -Dm755 ../iptables-flush ${pkgdir}/usr/bin/iptables-flush
}

generated_files="etc/systemd/system/multi-user.target.wants/iptables.service"
