pkgname=ji
SKIP_ARCH_CHECK=1
pkgver=47+
vcs=git

build() {
    true
}

package() {
    mkdir -p ${pkgdir}/{etc,usr/bin,usr/lib/ji}
    cp exe ${pkgdir}/usr/bin/ji
    cp util.py ${pkgdir}/usr/lib/ji/
    cp conf.bash ${pkgdir}/etc/ji.conf
}
