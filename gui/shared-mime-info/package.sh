pkgname=shared-mime-info
pkgver=1.12
vcs=git
gittag=Release-${pkgver//\./-}
relmon_id=5524

build() {
    MAKEFLAGS=
    ./autogen.sh --prefix=/usr --disable-default-make-check
    make
}

package() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}

after_install() {
    update-mime-database -n /usr/share/mime
}

after_upgrade() {
    after_install
}

generated_files="usr/share/applications/mimeinfo.cache"
