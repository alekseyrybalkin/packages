pkgname=fontconfig
pkgver=2.13.1
ARCH_VERSION=2.13.1+12+g5f5ec56
vcs=git
gittag=${pkgver}
relmon_id=827
relmon_rules="skip_big_third"

build() {
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --docdir=/usr/share/doc/${pkgname} \
        --disable-docs \
        --disable-static \
        --with-default-fonts=/usr/share/fonts \
        --with-add-fonts=/usr/share/fonts \
        --with-templatedir=/etc/fonts/conf.avail \
        --libdir=$LIBDIR
    make
}

package() {
    make DESTDIR=${pkgdir} install
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
}

after_install() {
    fc-cache -rs > /dev/null
}

after_upgrade() {
    after_install
}

generated_files="usr/share/fonts/TTF/.uuid \
    usr/share/fonts/X11/encodings/.uuid \
    usr/share/fonts/X11/.uuid \
    usr/share/fonts/.uuid \
    usr/share/fonts/TTF/fonts.scale \
    usr/share/fonts/TTF/fonts.dir"
