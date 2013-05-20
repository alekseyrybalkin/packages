#!/bin/sh

pkgname=grails
pkgver=2.2.2
urls="http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/${pkgname}-${pkgver}.zip \
  http://dist.springframework.org/snapshot/SPRING-LOADED/springloaded-1.1.2.20130430.jar"
srczip=${pkgname}-${pkgver}.zip
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's/DIRNAME=`dirname\ "\$0"`/DIRNAME=\/usr\/share\/grails/g' bin/grails
  sed -i -e 's/DIRNAME=`dirname\ "\$0"`/DIRNAME=\/usr\/share\/grails/g' bin/grails-debug
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/share/pixmaps/
  cp -r . ${pkgdir}/usr/share/${pkgname}
  cp ../springloaded-1.1.2.20130430.jar \
    ${pkgdir}/usr/share/grails/lib/org.springsource.springloaded/springloaded-core/jars/springloaded-core-1.1.1.jar

  install -Dm755 bin/startGrails \
    ${pkgdir}/usr/share/${pkgname}/startGrails
  install -Dm755 ../grails.sh \
    ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 ../grails.sh \
    ${pkgdir}/usr/share/${pkgname}/bin/${pkgname}

  cp media/icons/*.png ${pkgdir}/usr/share/pixmaps/
  cd ${pkgdir}/usr/share/${pkgname}
  rm -rf doc
  rm -f INSTALL LICENSE README
  find ${pkgdir}/usr/share -name "*.bat" -exec rm {} \;
}
