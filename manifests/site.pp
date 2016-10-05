/**
 * Title:     site.pp
 * Author:    [Rob Dumas](https://rpjd.io)
 * Created:   4 October 2016
 * Copyright: Copyright (c) 2016 Rob Dumas.
 * License:   GNU General Public License, version 3.0 (See LICENSE file.)
 */

node 'rpjd.io' {
    include rpjdbootstrap
    include rpjdbootstrap::ubuntu
}

node 'cadigan.rpjd.io' {
    # Cadigan notes:
    #
    # - For most sites on this host, http://site redirects to https://site
    #
    # Requirements:
    #
    # - https://rpjd.io
    # - https://portfolio.rpjd.io
    # - https://sitehub.rpjd.io

    include bnbbootstrap
    include bnbbootstrap::ubuntu
}

node 'zed.rpjd.io' {
    # Home server requirements:
    #
    # - Static network address.
    # - HFS+ support (read-only) for external HDDs.
    # - Samba for shares.
    # - Netatalk/Avahi for Time Machine.

    include rpjdbootstrap
    include rpjdbootstrap::ubuntu
}
