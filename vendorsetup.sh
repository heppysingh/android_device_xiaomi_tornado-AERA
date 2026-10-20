#
#	This file is part of the AERA Recovery Project
# 	Copyright (C) 2024-2026 The OrangeFox Recovery Project
# 	Copyright (C) 2026 AERA Recovery Project contributors
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#

FDEVICE="tornado"

aera_get_target_device() {
	local script_path
	script_path="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
	if echo "$script_path" | grep -q "/$FDEVICE$"; then
		AERA_BUILD_DEVICE="$FDEVICE"
	elif echo "$0" | grep -q "$FDEVICE"; then
		AERA_BUILD_DEVICE="$FDEVICE"
	fi
}

if [ -z "$AERA_BUILD_DEVICE" ]; then
	aera_get_target_device
fi

if [ "$1" = "$FDEVICE" ] || [ "$AERA_BUILD_DEVICE" = "$FDEVICE" ]; then
	export LC_ALL="C"
	export TARGET_DEVICE="tornado"
	export TARGET_DEVICE_ALT="tornado,2508CRN2BI"
	export AERA_TARGET_DEVICES="tornado,2508CRN2BI"
	export AERA_MAINTAINER="heppysingh"

	# Target Architecture
	export TARGET_ARCH="arm64"

	# Virtual A/B & vendor_boot as recovery
	export AERA_AB_DEVICE=1
	export AERA_VIRTUAL_AB_DEVICE=1
	export AERA_VENDOR_BOOT_RECOVERY=1
	export AERA_INSTALLER_VENDOR_BOOT_RAMDISK_INSTALL=1
	export AERA_DYNAMIC_FULL_SIZE=9126805504
	export AERA_NO_REFLASH_CURRENT_RECOVERY=1
	export AERA_NO_SPLASH_CHANGE=1
        export AERA_ENABLE_WLAN=1
	# Build info & Vanilla build
	export AERA_VANILLA_BUILD=1
	export AERA_PRODUCT_PREFIX=AERA
	export AERA_BUILD_STATUS=Official
	export AERA_BUILD_TYPE=Beta

	# Size Optimization & Ramdisk Compression (LZ4 is required for MT6835 Little Kernel)
	export AERA_USE_LZ4_COMPRESSION=1
	export AERA_REMOVE_AAPT=1
	export AERA_EXCLUDE_NANO_EDITOR=1
	export AERA_COMPRESS_EXECUTABLES=1

	# Shell and standard binaries
	export AERA_DELETE_AROMAFM=1
	export AERA_DELETE_MAGISK_ADDON=1

	# Storage and settings roots
	export AERA_SETTINGS_ROOT_DIRECTORY=/data/recovery
	export AERA_MISCELLANEOUS_ROOT_DIRECTORY=/sdcard
	export AERA_ALLOW_EARLY_SETTINGS_LOAD=1
	export AERA_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export AERA_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

	# Display, Notch & UI Customization (720x1640 / 720x1600 notch)
	export AERA_SCREEN_H=2400
	export AERA_STATUS_H=100
	export AERA_STATUS_INDENT_LEFT=48
	export AERA_STATUS_INDENT_RIGHT=48
	export AERA_HIDE_NOTCH=1
	export AERA_CLOCK_POS=0
	export AERA_ALLOW_DISABLE_NAVBAR=0
	export AERA_USE_LOCKSCREEN_BUTTON=1

	# Hardware & System Features
	export AERA_USE_GREEN_LED=0
	export AERA_FLASHLIGHT_ENABLE=1
	export AERA_FL_PATH1="/sys/devices/platform/flashlights_ocp8132/torch_brightness"
	export AERA_USE_LEGACY_BATTERY_SERVICES=1
	export AERA_FORCE_CASEFOLDING=1
	export AERA_FORCE_PREBUILT_KERNEL=1
	export AERA_NO_TREBLE_COMPATIBILITY_CHECK=1
	export AERA_PATCH_AVB20=1
	export AERA_VAB_ORS_WIPE_DATA_IS_FORMAT=1
	export AERA_DEFAULT_TIMEZONE="TAIST-5:30;IST"
	export AERA_FBE_METADATA_MOUNT_IGNORE=1
	export AERA_ENABLE_ROOT_MANAGER=1

	# Partition Tools & Backups
	export AERA_ENABLE_ALL_PARTITION_TOOLS=1
	export AERA_QUICK_BACKUP_LIST="/boot;/data;/super;"

	# Unset legacy variables
	unset AERA_VARIANT
	unset AERA_MAINTAINER_PATCH_VERSION
fi
