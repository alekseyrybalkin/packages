#!/bin/sh

pkgname=cryptopp
_majorver=5.6
pkgver=${_majorver}.5
vcs=git
gittag=CRYPTOPP_${pkgver//\./_}
relmon_id=14487

kiin_make() {
    CXXFLAGS+=" -DNDEBUG -fPIC" make -f GNUmakefile-cross
    make libcryptopp.so
}

kiin_install() {
    install -d ${pkgdir}/usr/{lib/pkgconfig,include/cryptopp}
    install -m644 *.h ${pkgdir}/usr/include/cryptopp/
    install -m644 libcryptopp.so ${pkgdir}/usr/lib/libcryptopp.so
    ln -sv libcryptopp.so ${pkgdir}/usr/lib/libcryptopp.so.${_majorver}
    install -m644 ../libcrypto++.pc ${pkgdir}/usr/lib/pkgconfig/libcrypto++.pc
}
