#!/bin/sh

KIIN_NON_FREE=1 # has jars in source tree
pkgname=intellij-idea
SKIP_ARCH_CHECK=1
vcs=git

pkgver=145
gittag=ab8aa376cc5f4ee8e07d92d4c8857aabb7750b9f
kotlinver=1.0.0-release-IJ143-78

extra_urls="https://teamcity.jetbrains.com/guestAuth/repository/download/Kotlin_Rc_Idea142branch150versionNoTests/${kotlinver}/kotlin-plugin-${kotlinver}.zip"
srcdir=${location}/idea-IC-${pkgver}

kiin_make() {
    sed -i -e "s/buildNumber = new URL(buildLocator.buildNumberUrl).text/buildNumber = \"${kotlinver}\"/g" \
        build/scripts/download_kotlin.gant
    cp ${KIIN_HOME}/tarballs/kotlin-plugin-${kotlinver}.zip build/
    rm -rf python/{ipnb,educational-{core,python}}
    sed -i -e 's/if (p("jdk.linux") != "false")/if (false)/g' build/scripts/dist.gant
    export PATH=${PATH}:/usr/lib/openjdk/bin:/usr/lib/apache-ant/bin
    ant

    cd python
    cp ../out/artifacts/ideaIC-${pkgver}.SNAPSHOT{-no-jdk,}.tar.gz
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
    ant -Didea.path=../out/artifacts/ -Didea.build.number=${pkgver}.SNAPSHOT plugin
}

kiin_install() {
    tar xvf out/artifacts/ideaIC-${pkgver}.SNAPSHOT-no-jdk.tar.gz
    cd idea-IC-${pkgver}.SNAPSHOT
    cd plugins
    unzip ../../python/distCE/python-community-${pkgver}.SNAPSHOT.zip
    cd ../
    mkdir -p ${pkgdir}/usr/lib/intellij-idea
    cp -a ./* ${pkgdir}/usr/lib/intellij-idea
    chown -R root:root ${pkgdir}/usr/lib/intellij-idea
    install -D -m755 ../../idea.sh ${pkgdir}/usr/bin/intellij-idea
}
