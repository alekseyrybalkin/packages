pkgname=ttf-fonts
SKIP_ARCH_CHECK=1
pkgver=1
vcs=git

build() {
    :
}

package() {
    install -m755 -d ${pkgdir}/usr/share/fonts/TTF
    for dir in `find . -mindepth 1 -maxdepth 1 -type d -name "ttf-*"`; do
        install -m644 ${dir}/*.ttf ${pkgdir}/usr/share/fonts/TTF/
    done
}

after_install() {
    mkfontscale /usr/share/fonts/TTF
    mkfontdir /usr/share/fonts/TTF
    fc-cache -fs > /dev/null
}

after_upgrade() {
    after_install
}
