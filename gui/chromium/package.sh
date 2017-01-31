#!/bin/sh

pkgname=chromium
pkgver=56.0.2924.79
#vcs=git
#gittag=${pkgver}
urls="https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz"
srctar=chromium-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    patch -Np1 -i ../chromium-glib-2.24.patch
    sed "s/^config(\"compiler\") {/&\ncflags_cc = [ \"-fno-delete-null-pointer-checks\" ]/" \
        -i build/config/linux/BUILD.gn

    find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +
    mkdir -p ${srcdir}/python2-path
    ln -sf /usr/bin/python2 ${srcdir}/python2-path/python

    for LIB in harfbuzz-ng libxslt yasm; do
        find -type f -path "*third_party/$LIB/*" \
            \! -path "*third_party/$LIB/chromium/*" \
            \! -path "*third_party/$LIB/google/*" \
            \! -regex '.*\.\(gn\|gni\|isolate\|py\)' \
            -delete
    done

    python2 build/linux/unbundle/replace_gn_files.py \
        --system-libraries harfbuzz-ng libxslt yasm

    python2 third_party/libaddressinput/chromium/tools/update-strings.py

    export PATH=${srcdir}/python2-path:${PATH}
    export TMPDIR=${srcdir}/temp
    mkdir -p ${TMPDIR}

    GN_CONFIG=('clang_use_chrome_plugins=false'
        'enable_hangout_services_extension=true'
        'enable_nacl=false'
        'enable_nacl_nonsfi=false'
        'enable_widevine=false'
        'fatal_linker_warnings=false'
        'ffmpeg_branding="Chrome"'
        'fieldtrial_testing_like_official_build=true'
        'is_debug=false'
        'is_clang=false'
        'link_pulseaudio=true'
        'linux_use_bundled_binutils=false'
        'proprietary_codecs=true'
        'remove_webcore_debug_symbols=true'
        'symbol_level=0'
        'treat_warnings_as_errors=false'
        'use_allocator="none"'
        'use_cups=true'
        'use_gconf=false'
        'use_gnome_keyring=false'
        'use_gold=false'
        'use_gtk3=false'
        'use_kerberos=false'
        'use_dbus=true'
        'use_libpci=false'
        'use_pulseaudio=false'
        'use_sysroot=false')
    python2 tools/gn/bootstrap/bootstrap.py --gn-gen-args "${GN_CONFIG[*]}"
    out/Release/gn gen out/Release --args="${GN_CONFIG[*]}" \
        --script-executable=/usr/bin/python2
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

    cp -av out/Release/locales ${pkgdir}/usr/lib/chromium/
    chown -Rv root:root ${pkgdir}/usr/lib/chromium/locales

    install -vDm644 out/Release/chrome.1 ${pkgdir}/usr/share/man/man1/chromium.1
}
