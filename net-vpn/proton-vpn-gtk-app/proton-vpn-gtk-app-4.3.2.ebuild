# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..12} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 desktop

DESCRIPTION="Official ProtonVPN Linux app"
HOMEPAGE="https://protonvpn.com https://github.com/ProtonVPN/proton-vpn-gtk-app"
SRC_URI="https://github.com/ProtonVPN/proton-vpn-gtk-app/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+appindicator"
RESTRICT="test"

DEPEND="
	net-vpn/python-proton-core[${PYTHON_USEDEP}]
	net-vpn/python-proton-keyring-linux[${PYTHON_USEDEP}]
	net-vpn/python-proton-keyring-linux-secretservice[${PYTHON_USEDEP}]
	net-vpn/python-proton-vpn-api-core[${PYTHON_USEDEP}]
	net-vpn/python-proton-vpn-connection[${PYTHON_USEDEP}]
	net-vpn/python-proton-vpn-killswitch[${PYTHON_USEDEP}]
	net-vpn/python-proton-vpn-killswitch-network-manager[${PYTHON_USEDEP}]
	net-vpn/python-proton-vpn-logger[${PYTHON_USEDEP}]
	net-vpn/python-proton-vpn-network-manager[${PYTHON_USEDEP}]
	net-vpn/python-proton-vpn-network-manager-openvpn[${PYTHON_USEDEP}]
	dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/dbus-python[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/bcrypt[${PYTHON_USEDEP}]
	dev-python/python-gnupg[${PYTHON_USEDEP}]
	dev-python/pyopenssl[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/distro[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/pynacl[${PYTHON_USEDEP}]
	dev-python/sentry-sdk[${PYTHON_USEDEP}]
	dev-python/secretstorage[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	appindicator? ( dev-libs/libappindicator )
"

src_install() {
	distutils-r1_src_install

	rm "${D}/usr/version.py" || die "Failed to remove ${D}/usr/version.py!"
	rm "${D}/usr/versions.yml" || die "Failed to remove ${D}/usr/version.yml!"

	domenu "${WORKDIR}/${P}/rpmbuild/SOURCES/protonvpn-app.desktop"
	doicon "${WORKDIR}/${P}/rpmbuild/SOURCES/proton-vpn-logo.svg"
}
