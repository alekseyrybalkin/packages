#!/bin/sh

KIIN_NON_FREE=1 # has jars in source tree
pkgname=intellij-idea
SKIP_ARCH_CHECK=1
pkgver=145.944
vcs=git
gittag=idea/${pkgver}
srcdir=${location}/idea-IC-${pkgver}

kiin_make() {
    sed -i -e 's/buildNumber = new URL(buildLocator.buildNumberUrl).text/buildNumber = "1.0.0-release-IJ143-78"/g' \
        build/scripts/download_kotlin.gant
    cp ${KIIN_HOME}/tarballs/kotlin-plugin-1.0.0-release-IJ143-78.zip build/
    rm -rf python/{ipnb,educational-{core,python}}
    sed -i -e 's/if (p("jdk.linux") != "false")/if (false)/g' build/scripts/dist.gant
    export PATH=${PATH}:/usr/lib/openjdk/bin:/usr/lib/apache-ant/bin
    ant
}

kiin_install() {
    tar xvf out/artifacts/ideaIC-*.SNAPSHOT-no-jdk.tar.gz
    cd idea-IC-*.SNAPSHOT
    mkdir -p ${pkgdir}/usr/lib/intellij-idea
    cp -a ./* ${pkgdir}/usr/lib/intellij-idea
    chown -R root:root ${pkgdir}/usr/lib/intellij-idea
    install -D -m755 ../../idea.sh ${pkgdir}/usr/bin/intellij-idea
}
