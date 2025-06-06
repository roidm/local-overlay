#Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg cmake

SRC_URI="https://gitlab.com/btrfs-assistant/btrfs-assistant/-/archive/${PV}/${P}.tar.bz2"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="A GUI management tool to make managing a Btrfs filesystem easier."
HOMEPAGE="https://gitlab.com/btrfs-assistant/btrfs-assistant"

LICENSE="GPL-3"
SLOT="0"
RESTRICT="mirror"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtsvg:5
"
BDEPEND="${DEPEND}"
RDEPEND="
	sys-auth/polkit
	sys-fs/btrfs-progs
	${DEPEND}
"

pkg_postinst() {
	xdg_pkg_postinst
	elog "emerge app-backup/snapper for snapshot management"
	elog "emerge sys-fs/btrfsmaintenance for scrub, balance, trim or defrag"
}
