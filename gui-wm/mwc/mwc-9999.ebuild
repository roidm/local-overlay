# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson fcaps git-r3 optfeature

DESCRIPTION="mwc with eye candy! "
HOMEPAGE="https://github.com/dqrk0jeste/mwc"

EGIT_REPO_URI="https://github.com/dqrk0jeste/mwc.git"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

DEPEND="
	>=dev-libs/json-c-0.13:0=
	>=dev-libs/libinput-1.21.0:0=
	virtual/libudev
	sys-auth/seatd:=
	dev-libs/libpcre2
	>=dev-libs/wayland-1.21.0
	gui-libs/scenefx
	x11-libs/cairo
	>=x11-libs/libxkbcommon-1.5.0
	media-libs/libglvnd
	x11-libs/pango
	x11-libs/pixman
"
DEPEND+="
	>=gui-libs/wlroots-0.18
	<gui-libs/wlroots-0.19
"
RDEPEND="
	x11-misc/xkeyboard-config
	dev-libs/libevdev
	dev-libs/glib
	${DEPEND}
"
BDEPEND="
	>=dev-libs/wayland-protocols-1.24
	>=dev-build/meson-0.60.0
	virtual/pkgconfig
"

FILECAPS=(
	cap_sys_nice usr/bin/mwc # reflect ">=gui-wm/sway-1.9"
)


src_configure() {
	local emesonargs=(
	)

	meson_src_configure
}

src_install() {
	meson_src_install
}

pkg_postinst() {
	fcaps_pkg_postinst
}
