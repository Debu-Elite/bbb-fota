# Override default git:// URL with HTTPS to avoid fetch hangs
SRC_URI =.replace(
    "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git",
    "https://git.ti.com/git/processor-firmware/ti-amx3-cm3-pm-firmware.git"
)
