#!/bin/sh

pkgname=python2
_pybasever=2.7
pkgver=${_pybasever}.16
vcs=git
vcs_pkgname=python
gittag=v${pkgver}
relmon_id=13255

build() {
    rm -rf .git .gitignore .bzrignore .hgeol .hgignore .hgtags

    # do not use berkeley db
    sed -i -e "s/\/usr\/include\/db.h/\/usr\/include\/db_does_not_exist.h/g" setup.py
    sed -i -e 's/"db\.h"/"db_does_not_exist\.h"/g' setup.py

    # Temporary workaround for FS#22322
    # See http://bugs.python.org/issue10835 for upstream report
    sed -i "/progname =/s/python/python${_pybasever}/" Python/pythonrun.c

    # Enable built-in SQLite module to load extensions (fix FS#22122)
    sed -i "/SQLITE_OMIT_LOAD_EXTENSION/d" setup.py

    # FS#23997
    sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python2|" Lib/cgi.py

    sed -i "s/python2.3/python2/g" Lib/distutils/tests/test_build_scripts.py \
        Lib/distutils/tests/test_install_scripts.py

    # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
    # rather than copies shipped in the tarball
    rm -r Modules/expat
    rm -r Modules/zlib
    rm -r Modules/_ctypes/{darwin,libffi}*

    # clean up #!s
    find . -name '*.py' | \
        xargs sed -i "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python2|"

    # Workaround asdl_c.py/makeopcodetargets.py errors after we touched the shebangs
    touch Include/Python-ast.h Python/Python-ast.c Python/opcode_targets.h

    ./configure --prefix=/usr \
        --enable-shared \
        --with-system-expat \
        --with-system-ffi \
        --enable-unicode=ucs4 \
        --build=x86_64-unknown-linux-gnu \
        --without-ensurepip
    make
}

package() {
    make DESTDIR=${pkgdir} altinstall

    ln -sf python${_pybasever}        ${pkgdir}/usr/bin/python2
    ln -sf python${_pybasever}-config ${pkgdir}/usr/bin/python2-config
    ln -sf python${_pybasever}.1      ${pkgdir}/usr/share/man/man1/python2.1

    # See Arch Linux FS#33954
    ln -sf python-${_pybasever}.pc    ${pkgdir}/usr/lib/pkgconfig/python2.pc

    ln -sf ../../libpython${_pybasever}.so ${pkgdir}/usr/lib/python${_pybasever}/config/libpython${_pybasever}.so

    mv ${pkgdir}/usr/bin/smtpd.py ${pkgdir}/usr/lib/python${_pybasever}/

    # some useful "stuff"
    install -dm755 ${pkgdir}/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
    install -m755 Tools/i18n/{msgfmt,pygettext}.py ${pkgdir}/usr/lib/python${_pybasever}/Tools/i18n/
    install -m755 Tools/scripts/{README,*py} ${pkgdir}/usr/lib/python${_pybasever}/Tools/scripts/

    # fix conflicts with python
    mv ${pkgdir}/usr/bin/idle{,2}
    mv ${pkgdir}/usr/bin/pydoc{,2}
    mv ${pkgdir}/usr/bin/2to3{,-2.7}

    # clean-up reference to build directory
    sed -i "s#${srcdir}/Python-${pkgver}:##" ${pkgdir}/usr/lib/python${_pybasever}/config/Makefile
}
