# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A JavaScript runtime built on Chrome's V8 JavaScript engine"
HOMEPAGE="https://nodejs.org/"
SRC_URI="amd64? ( https://nodejs.org/dist/v16.14.2/node-v16.14.2-linux-x64.tar.xz )"

LICENSE="Apache-1.1 Apache-2.0 BSD BSD-2 MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
#amd64? ( https://nodejs.org/dist/v${PV}/node-v${PV}-linux-x64.tar.xz )
S="${WORKDIR}/node-v${PV}-linux-x64"

src_install() {
	exeinto /usr/local/bin
	doexe bin/*
	insinto /usr/local/include
	doins -r include/*
	insinto /usr/local/lib
	doins -r lib/*
	insinto /usr/local/share
	doins -r share/*
}
