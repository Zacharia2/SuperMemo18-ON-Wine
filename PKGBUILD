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

sha512sums=('25546af94bcf31f9868e0bf1f75c160e025f7405f9a3f1f888e066cd820208d5ff04359d3d3c78de403e6d47fd18eb3652c5d6879c22ee8eeeef43b60d58ba90')

package() {
        tar xpf data.tar.xz -C ${pkgdir}
        # todo: fix permission problems
        # asked in archlinuxcn-group, tell me to give up, so let it go. At least it works.
}
