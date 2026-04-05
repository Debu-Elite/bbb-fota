FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://system.conf"

do_install:append() {
    install -d ${D}${sysconfdir}/rauc
    install -m 0644 ${WORKDIR}/system.conf ${D}${sysconfdir}/rauc/system.conf
}
