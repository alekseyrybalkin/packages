pkgname=rust
pkgver=1.36.0
vcs=git
gittag=${pkgver}
extra_urls="somethere/cargo-crates-${pkgver}.tar.gz"
relmon_id=7635

build() {
    tar xf ${TARBALLS_HOME}/cargo-crates-${pkgver}.tar.gz -C ~

    cp ../config.toml .

    # initialize git submodules
    rust_vcs_dir=`find_vcs_repo ${pkgname}`
    rust_vcs_dir=`echo ${rust_vcs_dir} | sed 's/\/rust$//g'`

    HAS_MISSING_MODULES=
    for module in `cat .gitmodules | grep 'url = ' | sed 's/^.*url = //g'`; do
        vcs_repo=rust-$(basename `echo ${module//\.git/}`)
        if [ "${module}" == "https://github.com/rust-embedded/book.git" ]; then
            vcs_repo=rust-embedded-book
        fi
        if [ -z `find_vcs_repo ${vcs_repo}` ]; then
            echo git clone ${module} ${rust_vcs_dir}/${vcs_repo}
            HAS_MISSING_MODULES=true
        else
            module_path=`cat .gitmodules | grep -B 1 ${module} | head -n 1 | sed 's/^.*path = //g'`
            git clone `find_vcs_repo ${vcs_repo}` ${module_path}
        fi
    done
    if [ -n "${HAS_MISSING_MODULES}" ]; then
        false
    fi
    git submodule update --init

    SUDO_USER=${USER} python ./x.py build -j$(nproc)
}

package() {
    DESTDIR=${pkgdir} SUDO_USER=${USER} python ./x.py install

    cd ${pkgdir}/usr/lib
    rm rustlib/{components,manifest-rustc,rust-installer-version}
    ln -sf rustlib/x86_64-unknown-linux-gnu/lib/*.so .
}
