#!/system/bin/sh
# Safe Wi-Fi module loader for MT6835 in recovery
echo "TWRP_WIFI: Loading MT6835 Wi-Fi modules..." > /dev/kmsg

mkdir -p /tmp/recovery/sockets 2>/dev/null
chmod 0770 /tmp/recovery 2>/dev/null
chmod 0770 /tmp/recovery/sockets 2>/dev/null

# Load Wi-Fi driver stack safely with insmod (avoids modprobe ccci/modem cascade)
insmod /lib/modules/connadp.ko 2>/dev/kmsg || true
insmod /lib/modules/btif_drv.ko 2>/dev/kmsg || true
insmod /lib/modules/wmt_drv.ko 2>/dev/kmsg || true
insmod /lib/modules/wmt_chrdev_wifi.ko 2>/dev/kmsg || true
insmod /lib/modules/cfg80211.ko 2>/dev/kmsg || true
insmod /lib/modules/mddp.ko 2>/dev/kmsg || true
insmod /lib/modules/wlan_drv_gen4m_6835.ko 2>/dev/kmsg || true

echo "TWRP_WIFI: Module loading finished." > /dev/kmsg
