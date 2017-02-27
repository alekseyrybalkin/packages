#!/bin/sh

KIIN_NON_FREE=1 # has jars in source tree, also can't build python plugin from source, also kotlin
pkgname=intellij-idea
SKIP_ARCH_CHECK=1
vcs=git

pkgver=163
gittag=622b729d4b8ee80165fbad4c59090b530d81a662
kotlinver=1.0.5-release-IJ2016.3-1

extra_urls="https://plugins.jetbrains.com/files/6954/30100/kotlin-plugin-${kotlinver}.zip https://plugins.jetbrains.com/files/631/30455/python-community-163.125.zip"
srcdir=${location}/idea-IC-${pkgver}

kiin_make() {
    export PATH=${PATH}:/usr/lib/openjdk/bin:/usr/lib/apache-ant/bin
    cp ${KIIN_HOME}/tarballs/kotlin-plugin-${kotlinver}.zip build/

    sed -i -e "s/buildNumber = new URL(buildLocator.buildNumberUrl).text/buildNumber = \"${kotlinver}\"/g" \
        build/scripts/download_kotlin.gant
    sed -i -e 's/"android", //g' build/groovy/org/jetbrains/intellij/build/BaseIdeaProperties.groovy
    sed -i -e 's/ "javaFX-CE",//g' build/groovy/org/jetbrains/intellij/build/BaseIdeaProperties.groovy
    sed -i -e '250,268d' build/scripts/layouts.gant
    rm -rf plugins/javaFX/
    patch -Np1 -i ../only_linux.diff
    ant
}

kiin_install() {
    tar xvf out/artifacts/ideaIC-${pkgver}.SNAPSHOT-no-jdk.tar.gz
    cd idea-IC-${pkgver}.SNAPSHOT
    cd plugins
    unzip ${KIIN_HOME}/tarballs/python-community-163.125.zip
    cd ../
    mkdir -p ${pkgdir}/usr/lib/intellij-idea
    cp -a ./* ${pkgdir}/usr/lib/intellij-idea
    chown -R root:root ${pkgdir}/usr/lib/intellij-idea
    install -D -m755 ../../idea.sh ${pkgdir}/usr/bin/intellij-idea
}
