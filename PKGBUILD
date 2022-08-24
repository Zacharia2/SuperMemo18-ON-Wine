pkgname=supermemo-18
pkgver=1.0.0
pkgrel=1
pkgdesc="A program that makes learning fun and easy."
arch=('x86_64')
url="https://github.com/Zacharia2/SuperMemo18-ON-Wine/"
license=('proprietary')
depends=() # I guess there is no dep.
options=('!strip') # appimage can't strip
source=("${pkgname}-${pkgver}-${arch}.deb::https://github.com/Zacharia2/SuperMemo18-ON-Wine/releases/download/v3/SuperMemo18-Wine32-dpkg-3.deb")

sha512sums=('0cdea36c2ba72143b8efc4c52d617bf065f746f700157f2d0db92824795cdec6da12677638cd3f02fcb2ae61a102cbcb6a0505e417584a33fb4033ecde898560')

package() {
        tar xpf data.tar.xz -C ${pkgdir}
        # todo: fix permission problems
        # asked in archlinuxcn-group, tell me to give up, so let it go. At least it works.
}
