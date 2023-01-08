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

sha512sums=('ed960be944258023a4be546808235ee2358d6ecdea827974a7e4c1b94259ee15dc3a4c6c435f47a4b062622c3f4fbf442e916333e685422e39d8ecc77cf62eaa')

package() {
        tar xpf data.tar.zst -C ${pkgdir}
        # todo: fix permission problems
        # asked in archlinuxcn-group, tell me to give up, so let it go. At least it works.
}
