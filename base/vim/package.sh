pkgname=vim
pkgver=8.1.1772
vcs=git
gittag=v${pkgver}
relmon_id=5092

build() {
    echo 'set viminfo=' >> runtime/defaults.vim
    sed -i -e 's/set scrolloff=5/set scrolloff=0/g' runtime/defaults.vim
    echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
    ./configure --prefix=/usr \
        --enable-multibyte \
        --with-x=no \
        --disable-gui \
        --with-compiledby=jinni \
        --enable-python3interp=dynamic
    make
}

package() {
    make DESTDIR=${pkgdir} install
    ln -sv vim ${pkgdir}/usr/bin/vi
    mkdir -pv ${pkgdir}/usr/share/doc
    mkdir -pv ${pkgdir}/etc

    cat > ${pkgdir}/etc/vimrc << "EOF"
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif
EOF
}
