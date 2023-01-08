# Maintainer: WhiteFall <whitefall76@outlook.com>
# Maintainer: asukaminato <asukaminato@nyan.eu.org>

pkgname=supermemo-18.05
pkgver=1.4.0
pkgrel=1
pkgdesc="A program that makes learning fun and easy."
arch=('x86_64')
url="https://github.com/Zacharia2/SuperMemo18-ON-Wine/"
license=('proprietary')
depends=() # I guess there is no dep.
options=('!strip') # appimage can't strip
source=("${pkgname}-${pkgver}-${arch}.deb::https://github.com/Zacharia2/SuperMemo18-ON-Wine/releases/download/v1.4.0/SuperMemo18.05-lazy-wine32-package.v1.4.0.deb")

sha512sums=('73255d16afca25017fa5184b553fd6b764e188408e680949b3d909995b924eb227f54ff2d2f52f52d515bea02830ead58e3807ab0ca09fa8f09213fe7698a147')

package() {
        tar xpf data.tar.zst -C ${pkgdir}
        # todo: fix permission problems
        # asked in archlinuxcn-group, tell me to give up, so let it go. At least it works.
}
