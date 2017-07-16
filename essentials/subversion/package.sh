#!/bin/sh

#vcs=git
pkgname=subversion
pkgver=1.9.6
extension=bz2
folder="http://www.apache.org/dist/${pkgname}/"
check_server=1
relmon_id=4905

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    # move configuration to ~/.config
    sed -i -e 's/SVN_CONFIG__USR_DIRECTORY   "\.subversion"/SVN_CONFIG__USR_DIRECTORY   "\.config\/subversion"/g' \
        subversion/libsvn_subr/config_impl.h
    MAKEFLAGS=
    ./configure --prefix=/usr --with-apr=/usr --with-apr-util=/usr \
        --with-zlib=/usr --with-serf=/usr --with-neon=/usr \
        --with-sqlite=/usr --disable-static
    make LT_LDFLAGS="-L$Fdestdir/usr/lib" local-all
    make swig-pl
    make swig-py swig_pydir=/usr/lib/python2.7/site-packages/libsvn \
        swig_pydir_extra=/usr/lib/python2.7/site-packages/svn
}

kiin_install() {
    MAKEFLAGS=
    export LD_LIBRARY_PATH=${pkgdir}/usr/lib:${LD_LIBRARY_PATH}
    make DESTDIR=${pkgdir} install
    install -v -m755 -d ${pkgdir}/usr/share/doc/subversion-${pkgver}
    cp -v -R doc/* ${pkgdir}/usr/share/doc/subversion-${pkgver}
    make DESTDIR=${pkgdir} install-swig-pl
    make DESTDIR=${pkgdir} install-swig-py swig_pydir=/usr/lib/python2.7/site-packages/libsvn \
        swig_pydir_extra=/usr/lib/python2.7/site-packages/svn
    find ${pkgdir} -name perllocal.pod -delete
    find ${pkgdir} -name .packlist -delete
}
