# AERA Recovery Project for Redmi 15C 5G (tornado)

Device tree for building AERA Recovery for **Redmi 15C 5G** (and variants).

## Device Specifications

| Feature | Specification |
| :--- | :--- |
| **Device** | Redmi 15C 5G /Redmi 17C 5G/ Redmi 15R 5G / Poco C85 5G |
| **Codename** | `tornado` |
| **SoC** | MediaTek MT6835 (Dimensity 6300) |
| **Architecture** | ARM64 (64-bit) |
| **Display** | 720 x 1640 (20.5:9), 90Hz/120Hz IPS LCD |
| **Storage & RAM** | UFS / eMMC, 4GB / 6GB / 8GB |
| **Partition Scheme** | Virtual A/B (Dynamic Partitions, Boot Header v4) |
| **Recovery Location** | `vendor_boot` partition (`vendor_boot-as-recovery`) |
| **Shipped Android** | Android 15 / 16 |

## Build Instructions

### Initialize Repository
```bash
repo init -u https://github.com/AERA-Recovery/android_manifest.git -b aera-16.0 --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### Clone Device Tree
```bash
git clone https://github.com/AERA-Recovery/android_device_xiaomi_tornado-AERA.git device/xiaomi/tornado
```

### Build AERA Recovery
```bash
source build/envsetup.sh
lunch aera_tornado-bp2a-eng
mka vendorbootimage
```

---
## Maintainer
- **Maintainer**: @heppysingh
