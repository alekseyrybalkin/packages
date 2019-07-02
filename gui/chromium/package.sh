#!/bin/sh

pkgname=chromium
pkgver=75.0.3770.100
vcs=git
gittag=${pkgver}
extra_urls="somethere/node_modules-${pkgver}.tar.gz"
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
    python prepare_deps.py $(dirname `find_vcs_repo chromium`)

    bash filldeps.sh
    rm filldeps.sh prepare_deps.py deps.py
}

kiin_make() {
    cp ../gclient_args.gni build/config/

    cd third_party/node/
    tar xf ${TARBALLS_HOME}/node_modules-${pkgver}.tar.gz
    cd ../../

    # Allow building against system libraries in official builds
    sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
        tools/generate_shim_headers/generate_shim_headers.py

    # https://crbug.com/893950
    sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
        third_party/blink/renderer/core/xml/*.cc \
        third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
        third_party/libxml/chromium/libxml_utils.cc

    # libstdc++: do not assume unique_ptr has ostream operator
    git cherry-pick aeed4d1f15ce84a17ea0bc219e258dc4982b2368
    # Disallow partial swaps for linux based on gl_version_string
    git cherry-pick e55ec7368dbbe1970cc229350299963eb7b74ec4

    _check_and_clone_deps DEPS

    cd third_party/angle
    _check_and_clone_deps DEPS
    cd ../../

    cd buildtools
    _check_and_clone_deps DEPS
    cd ../

    python2 build/util/lastchange.py -o build/util/LASTCHANGE
    cp build/util/LASTCHANGE{,.blink}
    python2 build/util/lastchange.py -m GPU_LISTS_VERSION --revision-id-only --header gpu/config/gpu_lists_version.h
    python2 build/util/lastchange.py -m SKIA_COMMIT_HASH -s third_party/skia --header skia/ext/skia_commit_hash.h
    git log -1 --format='%ct' --grep=^Change-Id: HEAD > build/util/LASTCHANGE.committime
    rm -rf .git

    patch -Np1 -i ../chromium-fix-window-flash-for-some-WMs.patch
    patch -Np0 -i ../chromium-skia-harmony.patch
    patch -Np1 -i ../chromium-non-const-deltas.patch

    # Force script incompatible with Python 3 to use /usr/bin/python2
    sed -i '1s|python$|&2|' third_party/dom_distiller_js/protoc_plugins/*.py

    mkdir -p third_party/node/linux/node-linux-x64/bin
    ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

    export CCACHE_SLOPPINESS=time_macros
    export CC=clang
    export CXX=clang++
    export AR=ar
    export NM=nm

    export PATH=${PATH}:/usr/lib/openjdk/bin
    export TMPDIR=${srcdir}/temp
    mkdir -p ${TMPDIR}

    GN_CONFIG=(
        'custom_toolchain="//build/toolchain/linux/unbundle:default"'
        'host_toolchain="//build/toolchain/linux/unbundle:default"'
        'clang_use_chrome_plugins=false'
        'clang_use_default_sample_profile=false'
        'is_official_build=true'
        'treat_warnings_as_errors=false'
        'fieldtrial_testing_like_official_build=true'
        'ffmpeg_branding="Chrome"'
        'proprietary_codecs=true'
        'rtc_use_pipewire=true'
        'rtc_link_pipewire=true'
        'link_pulseaudio=false'
        'use_gnome_keyring=false'
        'use_sysroot=false'
        'linux_use_bundled_binutils=false'
        'use_custom_libcxx=false'
        'enable_hangout_services_extension=false'
        'enable_widevine=false'
        'enable_nacl=false'
        'enable_swiftshader=false'
        'use_kerberos=false'
        'use_libpci=false'
        'use_pulseaudio=false'
        'symbol_level=0'
    )

    # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
    CFLAGS+='   -Wno-builtin-macro-redefined'
    CXXFLAGS+=' -Wno-builtin-macro-redefined'
    CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

    # Mimic exclude_unwind_tables=true
    CFLAGS+='   -fno-unwind-tables -fno-asynchronous-unwind-tables'
    CXXFLAGS+=' -fno-unwind-tables -fno-asynchronous-unwind-tables'
    CPPFLAGS+=' -DNO_UNWIND_TABLES'

    gn gen out/Release --args="${GN_CONFIG[*]}" --script-executable=/usr/bin/python2
    ninja -C out/Release chrome chrome_sandbox chromedriver
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

    cp -rv out/Release/locales ${pkgdir}/usr/lib/chromium/
}
