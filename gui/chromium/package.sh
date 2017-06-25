#!/bin/sh

pkgname=chromium
pkgver=59.0.3071.109
vcs=git
gittag=${pkgver}
relmon_id=13344

# updating node_modules:
# cd third_party/node
# ./update_npm_deps

_check_and_clone_deps() {
    echo "vars = {}" > deps.py
    echo "" >> deps.py
    echo "def Var(key):" >> deps.py
    echo "    return vars[key]" >> deps.py
    echo "" >> deps.py
    cat DEPS >> deps.py

    cp ${srcdir}/../prepare_deps.py .
    python prepare_deps.py ${SOURCES_HOME}

    bash filldeps.sh
    rm filldeps.sh prepare_deps.py deps.py
}

kiin_make() {
    cp -r ${KIIN_HOME}/tarballs/chromium_node_modules third_party/node/node_modules

    LASTCHANGE=`git show ${gittag} | head -n 1 | sed 's/commit //g'`
    echo "LASTCHANGE=${LASTCHANGE}" > build/util/LASTCHANGE
    echo "LASTCHANGE=${LASTCHANGE}" > build/util/LASTCHANGE.blink
    rm -rf .git

    _check_and_clone_deps

    python2 build/util/lastchange.py -m SKIA_COMMIT_HASH -s third_party/skia --header skia/ext/skia_commit_hash.h
    rm -rf third_party/skia/.git

    cd buildtools
    _check_and_clone_deps
    cd ../

    patch -Np1 -i ../gcc7.patch
    sed -i -e 's/4, 6/4, 15/g' ui/gfx/linux/client_native_pixmap_dmabuf.cc

    sed 's/^config("compiler") {/&\ncflags_cc = [ "-fno-delete-null-pointer-checks" ]/' \
        -i build/config/linux/BUILD.gn

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
        'linux_use_bundled_binutils=false'
        'use_gconf=false'
        'use_gnome_keyring=false'
        'use_gold=false'
        'use_sysroot=false'
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
