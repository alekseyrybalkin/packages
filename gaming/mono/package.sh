#!/bin/sh

pkgname=mono
pkgver=3.4.0
urls="http://download.mono-project.com/sources/mono/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -p1 < ../build_fix.patch
  cp ../Microsoft.Portable.Common.targets mcs/tools/xbuild/targets/

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --disable-quiet-build \
    --disable-system-aot \
    --disable-static \
    --with-mcs-docs=no
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove broken symlinks
  rm ${pkgdir}/usr/lib/mono/xbuild/12.0/bin/Microsoft.Build.dll
  rm ${pkgdir}/usr/lib/mono/xbuild/12.0/bin/Microsoft.Build.Engine.dll
  rm ${pkgdir}/usr/lib/mono/xbuild/12.0/bin/Microsoft.Build.Framework.dll
  rm ${pkgdir}/usr/lib/mono/xbuild/12.0/bin/Microsoft.Build.Tasks.v12.0.dll
  rm ${pkgdir}/usr/lib/mono/xbuild/12.0/bin/Microsoft.Build.Utilities.v12.0.dll
  rm ${pkgdir}/usr/lib/mono/xbuild/12.0/bin/Mono.XBuild.Tasks.dll
}
