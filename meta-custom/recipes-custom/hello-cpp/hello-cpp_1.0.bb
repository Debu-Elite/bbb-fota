SUMMARY = "Simple C++ Hello World for BeagleBone"
DESCRIPTION = "A sample C++ app running on BeagleBone Yocto Linux"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://hello.cpp"

S = "${WORKDIR}"

do_compile() {
    ${CXX} ${CXXFLAGS} ${LDFLAGS} hello.cpp -o hello-cpp
}

do_install() {
    install -d ${D}${bindir}
    install -m 0755 hello-cpp ${D}${bindir}
}

