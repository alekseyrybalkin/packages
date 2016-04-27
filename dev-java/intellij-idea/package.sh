#!/bin/sh

KIIN_NON_FREE=1 # has jars in source tree
pkgname=intellij-idea
SKIP_ARCH_CHECK=1
_pkgbase=145
pkgver=${_pkgbase}.955
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

    cd python
    cp ../out/artifacts/ideaIC-${_pkgbase}.SNAPSHOT{-no-jdk,}.tar.gz
    sed -i -e '/ipnb/d' build/plugin-list.txt
    sed -i -e '/ipnb\/src/d' build/python_plugin_build.gant
    mkdir trash
    sed -i -e 's/ipnb\/lib/trash/g' build/python_plugin_build.gant
    sed -i -e 's/ipnb\/resources/trash/g' build/python_plugin_build.gant
    _major=`cat python-community-ide-resources/resources/idea/PyCharmCoreApplicationInfo.xml | grep major | sed 's/^.*major="//g' | sed 's/".*$//g'`
    _minor=`cat python-community-ide-resources/resources/idea/PyCharmCoreApplicationInfo.xml | grep minor | sed 's/^.*minor="//g' | sed 's/".*$//g'`
    sed -i -e "s/major = .*/major = \"${_major}\"/g" build/python_plugin_build.gant
    sed -i -e "s/minor = .*/minor = \"${_minor}\"/g" build/python_plugin_build.gant
    sed -i -e '/ipython/d' build/python-plugin-dependencies.xml
    ant -Didea.path=../out/artifacts/ -Didea.build.number=${_pkgbase}.SNAPSHOT plugin
}

kiin_install() {
    tar xvf out/artifacts/ideaIC-${_pkgbase}.SNAPSHOT-no-jdk.tar.gz
    cd idea-IC-${_pkgbase}.SNAPSHOT
    cd plugins
    unzip ../../python/distCE/python-community-${_pkgbase}.SNAPSHOT.zip
    cd ../
    mkdir -p ${pkgdir}/usr/lib/intellij-idea
    cp -a ./* ${pkgdir}/usr/lib/intellij-idea
    chown -R root:root ${pkgdir}/usr/lib/intellij-idea
    install -D -m755 ../../idea.sh ${pkgdir}/usr/bin/intellij-idea
}
