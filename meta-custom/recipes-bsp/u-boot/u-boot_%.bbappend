FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://uEnv.txt"

do_deploy:append() {
    install -m 0644 ${WORKDIR}/uEnv.txt ${DEPLOYDIR}/uEnv.txt
}
