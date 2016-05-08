#!/bin/sh

pkgname=firefox
pkgver=46.0.1
vcs=mercurial
hg_pkgname=firefox-release
hgtag=FIREFOX_${pkgver//\./_}_RELEASE
urls="https://ftp.mozilla.org/pub/mozilla.org/${pkgname}/releases/${pkgver}/source/${pkgname}-${pkgver}.source.tar.xz"
srctar=${pkgname}-${pkgver}.source.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  export CFLAGS="${CFLAGS} -flifetime-dse=1 -fno-delete-null-pointer-checks"
  export CXXFLAGS="${CXXFLAGS} -flifetime-dse=1 -fno-delete-null-pointer-checks"

  rm -rf .hg .hgignore .hgtags

  sed -e '/#include/i\
    print OUT "#define _GLIBCXX_INCLUDE_NEXT_C_HEADERS\\n"\;' \
    -i nsprpub/config/make-system-wrappers.pl

  sed -e '/#include/a\
    print OUT "#undef _GLIBCXX_INCLUDE_NEXT_C_HEADERS\\n"\;' \
    -i nsprpub/config/make-system-wrappers.pl

  cp ../mozconfig .
  patch -Np1 -i ../firefox-gtk3-20.patch
  sed -i -e '/MOZ_MAKE_FLAGS/d' mozconfig
  echo "mk_add_options MOZ_MAKE_FLAGS='${MAKEFLAGS}'" >> mozconfig

  # WebRTC build tries to execute "python" and expects Python 2
  mkdir path
  ln -s /usr/bin/python2 "$srcdir/path/python"

  CXX='g++ -std=c++11' make -f client.mk
}

kiin_install() {
  make -C firefox-build-dir DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/lib/mozilla/plugins
  mv ${pkgdir}/usr/lib/firefox{-${pkgver},}
  ln -sfv ../lib/firefox/firefox ${pkgdir}/usr/bin
  rm ${pkgdir}/usr/lib/firefox-devel-${pkgver}/bin
  ln -sfv /usr/lib/firefox ${pkgdir}/usr/lib/firefox-devel-${pkgver}/bin
}
