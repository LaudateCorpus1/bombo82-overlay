# Copyright 2020-2021 Gianni Bombelli <bombo82@giannibombelli.it>
# Distributed under the terms of the GNU General Public License  as published by the Free Software Foundation;
# either version 2 of the License, or (at your option) any later version.

EAPI=7

inherit desktop eutils

DESCRIPTION="Free universal database tool and SQL client"
HOMEPAGE="http://dbeaver.io/"

SRC_URI="http://dbeaver.io/files/${PV}/dbeaver-ce-${PV}-linux.gtk.x86_64.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist mirror"

IUSE=""
DEPEND=">=x11-libs/gtk+-2:2"
RDEPEND="${DEPEND}
	media-libs/alsa-lib
	x11-libs/libXtst
"

QA_FLAGS_IGNORED="CFLAGS LDFLAGS"

S="${WORKDIR}/dbeaver"

src_install() {
	local dir="/opt/${PN}"

	insinto "${dir}"
	doins -r *
	fperms 755 "${dir}/dbeaver"
	fperms 755 "${dir}/jre/bin/java"

	make_wrapper "${PN}" "${dir}/dbeaver"
	newicon "dbeaver.png" "${PN}.png"
	make_desktop_entry "${PN}" "DBeaver" "${PN}" "Development;IDE"
}
