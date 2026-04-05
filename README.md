BeagleBone Black: FOTA-Ready Embedded Linux System
Project Overview: A custom Yocto-based distribution featuring robust Wi-Fi connectivity and a secure, atomic A/B update architecture.

🛠 Project Pillars
1. Hardware & Bootstrapping
Target: BeagleBone Black (AM335x ARM® Cortex-A8).

Boot Media: Optimized for MicroSD boot using a custom uEnv.txt to override the onboard eMMC.

Low-Level Success: Resolved initial serial "CC" boot loops by correctly partitioning the bootloader and aligning the MLO and U-Boot binaries.

2. Wireless Connectivity
Hardware: Realtek RTL8188ETV USB Wi-Fi Adapter.

Driver Integration: Enabled the r8188eu kernel module via Yocto kernel configuration (.bbappend).

Network Stack: Integrated NetworkManager for stable, CLI-based connection management.

Testing: Successfully established a persistent uplink to a mobile hotspot for remote data fetching.

3. A/B Partition Architecture
To ensure the device is "unbrickable" during remote updates, I implemented a redundant partition layout using WKS (Wic Kickstart):

Slot A: Active Root FileSystem.

Slot B: Standby Root FileSystem for background updates.

Benefit: If an update fails or power is lost mid-install, the system remains functional on the original partition.

4. DevOps & FOTA Integration
Update Framework: Integrated RAUC (Robust Auto-Update Controller).

Atomic Updates: Updates are delivered via signed .raucb bundles.

Process: The board fetches the update over Wi-Fi, installs it to the inactive slot, and toggles the boot flag only after a successful verification.

Version Control: Full source code and metadata managed via Git and hosted on GitHub for CI/CD readiness.

🚀 Technical Workflow
Configure: Modify kernel and local recipes on the Build PC.

Build: Generate the system image and RAUC bundle using bitbake.

Deploy: Host the bundle on a Python-based local server.

Update: Trigger the remote update on the BeagleBone:

Bash
rauc install http://<server-ip>:8000/update-bundle.raucb
