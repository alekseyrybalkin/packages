#!/bin/sh

pkgname=gettext
pkgver=0.20.1
vcs=git
gittag=v${pkgver}
relmon_id=898

build() {
    # don't build problematic examples
    for lang in java pascal csharp; do
        sed -i -e "/hello-${lang}/d" gettext-tools/examples/po/Makefile.am \
            Makefile.am \
            gettext-tools/examples/Makefile.am \
            gettext-tools/examples/check-examples

        rm -rf gettext-tools/examples/hello-${lang}*
    done

    # disable man pages
    sed -i -e '/man/d' autogen.sh
    for subdir in runtime tools; do
        sed -i -e '/man/d' gettext-${subdir}/configure.ac
        sed -i -e '/MAKEFILE_DISTRIB/d' gettext-${subdir}/configure.ac
        sed -i -e 's/man //g' gettext-${subdir}/Makefile.am
        rm -rf gettext-${subdir}/man
    done

    # pre-clone gnulib
    git clone -s `find_vcs_repo gnulib`
    git submodule update --init

    git clone -s `find_vcs_repo gnulib` libtextstyle/gnulib
    sed -i -e 's/ && git pull//g' libtextstyle/autogen.sh

    export GNULIB_TOOL=${srcdir}/gnulib/gnulib-tool

    # copy archive.dir.tar.xz from system
    cp /usr/share/gettext/archive.dir.tar.xz gettext-tools/misc/

    ./autogen.sh
    ./configure --prefix=/usr \
        --docdir=/usr/share/doc/gettext \
        --disable-static \
        --build=x86_64-unknown-linux-gnu \
        --without-git
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
