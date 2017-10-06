#!/bin/sh

pkgname=chromium
pkgver=61.0.3163.117
vcs=git
gittag=${pkgver}
relmon_id=13344

# updating node_modules:
# cd third_party/node
# ./update_npm_deps

# fetching webrtc branch_heads:
# git fetch origin '+refs/branch-heads/*:refs/remotes/branch-heads/*'

_check_and_clone_deps() {
    echo "vars = {}" > deps.py
    echo "" >> deps.py
    echo "def Var(key):" >> deps.py
    echo "    return vars[key]" >> deps.py
    echo "" >> deps.py
    cat ${1} >> deps.py

    cp ${srcdir}/../prepare_deps.py .
    python prepare_deps.py ${SOURCES_HOME}

    bash filldeps.sh
    rm filldeps.sh prepare_deps.py deps.py
}

kiin_make() {
    cp -r ${KIIN_HOME}/tarballs/chromium_node_modules third_party/node/node_modules
    rm -rf third_party/node/node_modules/.git

    LASTCHANGE=`git show ${gittag} | head -n 1 | sed 's/commit //g'`
    echo "LASTCHANGE=${LASTCHANGE}" > build/util/LASTCHANGE
    echo "LASTCHANGE=${LASTCHANGE}" > build/util/LASTCHANGE.blink

    # fix compilation error with gcc
    git cherry-pick 63c4dc41d2b90dc3386e331b62ee893a32bb0b11
    rm -rf .git

    _check_and_clone_deps DEPS
    _check_and_clone_deps third_party/angle/DEPS

    python2 build/util/lastchange.py -m SKIA_COMMIT_HASH -s third_party/skia --header skia/ext/skia_commit_hash.h
    rm -rf third_party/skia/.git

    cd buildtools
    _check_and_clone_deps DEPS
    cd ../

    patch -Np1 -i ../chromium-blink-gcc7.patch
    patch -Np1 -i ../chromium-gcc-r1.patch
    patch -Np1 -i ../chromium-atk-r1.patch
    patch -Np1 -i ../chromium-gn-bootstrap-r14.patch

    # Fix build with glibc 2.26
    patch -Np1 -i ../breakpad-use-ucontext_t.patch
    sed -i -e 's/xlocale/locale/' buildtools/third_party/libc++/trunk/include/__locale \
        third_party/icu/source/i18n/digitlst.cpp

    find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +
    mkdir -p ${srcdir}/python2-path
    ln -sf /usr/bin/python2 ${srcdir}/python2-path/python

    mkdir -p third_party/node/linux/node-linux-x64/bin
    ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

    export PATH=${srcdir}/python2-path:${PATH}
    export TMPDIR=${srcdir}/temp
    mkdir -p ${TMPDIR}

    GN_CONFIG=(
        'is_clang=false'
        'clang_use_chrome_plugins=false'
        'is_debug=false'
        'fatal_linker_warnings=false'
        'treat_warnings_as_errors=false'
        'fieldtrial_testing_like_official_build=true'
        'remove_webcore_debug_symbols=true'
        'ffmpeg_branding="Chrome"'
        'proprietary_codecs=true'
        'link_pulseaudio=false'
        'use_gtk3=true'
        'use_gconf=false'
        'use_gnome_keyring=false'
        'use_gold=false'
        'use_sysroot=false'
        'linux_use_bundled_binutils=false'
        'enable_hangout_services_extension=true'
        'enable_widevine=false'
        'enable_nacl=false'
        'symbol_level=0'
        'use_cups=true'
        'use_kerberos=false'
        'use_dbus=true'
        'use_libpci=false'
        'use_pulseaudio=false'
    )
    python2 tools/gn/bootstrap/bootstrap.py --gn-gen-args "${GN_CONFIG[*]}"
    out/Release/gn gen out/Release --args="${GN_CONFIG[*]}" \
        --script-executable=/usr/bin/python2
    ninja -j 4 -C out/Release chrome chrome_sandbox chromedriver
}

kiin_install() {
    install -vDm755  out/Release/chrome ${pkgdir}/usr/lib/chromium/chromium
    install -vDm4755 out/Release/chrome_sandbox ${pkgdir}/usr/lib/chromium/chrome-sandbox
    install -vDm755  out/Release/chromedriver ${pkgdir}/usr/lib/chromium/chromedriver
    mkdir -p ${pkgdir}/usr/bin
    ln -svf /usr/lib/chromium/chromium ${pkgdir}/usr/bin
    ln -svf /usr/lib/chromium/chromedriver ${pkgdir}/usr/bin/

    install -vDm644 out/Release/icudtl.dat ${pkgdir}/usr/lib/chromium
    install -vDm644 out/Release/gen/content/content_resources.pak ${pkgdir}/usr/lib/chromium/
    install -vm644 out/Release/{*.pak,*.bin} ${pkgdir}/usr/lib/chromium/

    cp -av out/Release/locales ${pkgdir}/usr/lib/chromium/
    chown -Rv root:root ${pkgdir}/usr/lib/chromium/locales

    install -vDm644 out/Release/chrome.1 ${pkgdir}/usr/share/man/man1/chromium.1
}
