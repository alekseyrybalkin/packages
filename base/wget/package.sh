pkgname=wget
pkgver=1.20.3
vcs=git
gittag=v${pkgver}
relmon_id=5124

build() {
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --build=x86_64-unknown-linux-gnu \
        --with-ssl=openssl
    make
}

package() {
    make DESTDIR=${pkgdir} install
    echo "ca-directory=/etc/ssl/certs" >> ${pkgdir}/etc/wgetrc
}
