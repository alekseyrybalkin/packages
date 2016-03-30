#!/bin/sh

pkgname=python-gunicorn
SKIP_ARCH_CHECK=1
pkgver=19.4.5
vcs=git
git_pkgname=gunicorn
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  python setup.py build
}

kiin_install() {
  python setup.py install --prefix=/usr --root=${pkgdir}
  mkdir ${pkgdir}/usr/bin
  cp ../gunicorn.py ${pkgdir}/usr/bin/gunicorn
  chmod 755 ${pkgdir}/usr/bin/gunicorn
}
