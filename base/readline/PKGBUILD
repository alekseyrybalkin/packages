pkgname=readline
pkgver=8.0.000
vcs=git
#FIXME no tag
gittag=8e6ccd0373d77b86ed37a9a7d232ccfea3d6670c
relmon_id=4173

build() {
    sed -i '/MV.*old/d' Makefile.in
    sed -i '/{OLDSUFF}/c:' support/shlib-install
    ./configure --prefix=/usr --disable-static --docdir=/usr/share/doc/readline
    make SHLIB_LIBS=-lncurses
}

package() {
    make DESTDIR=${pkgdir} SHLIB_LIBS=-lncurses install
    mkdir -pv ${pkgdir}/usr/share/doc/readline
    install -v -m644 doc/*.{ps,pdf,html,dvi} \
        ${pkgdir}/usr/share/doc/readline
}
