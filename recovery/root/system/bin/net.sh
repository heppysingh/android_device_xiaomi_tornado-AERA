#!/system/bin/sh
# Tiny hook (no tools inside the ramdisk): if the external toolkit exists in
# /persist/aera-net, expose it system-wide by generating launchers in /system/bin
# so Plugin Manager etc. find busybox/curl/... via normal PATH.
for N in /persist/aera-net /mnt/vendor/persist/aera-net; do [ -d "$N/bin" ] && break; done
[ -d "$N/bin" ] || exit 0
chmod -R 755 "$N/bin" 2>/dev/null
mk() { # name target-kind(applet|bin) force
  f=/system/bin/$1
  [ "$3" != force ] && [ -e "$f" ] && return
  rm -f "$f"
  if [ "$2" = applet ]; then cmd="$N/bin/busybox $1"; else cmd="$N/bin/$1"; fi
  printf '#!/system/bin/sh\nexport LD_LIBRARY_PATH="%s/lib:/system/lib64:/vendor/lib64:$LD_LIBRARY_PATH"\nexport CURL_CA_BUNDLE="%s/etc/cacert.pem" SSL_CERT_FILE="%s/etc/cacert.pem"\nexec %s "$@"\n' "$N" "$N" "$N" "$cmd" > "$f"
  chmod 755 "$f"
}
mk busybox bin force
mk curl bin force
for t in ip telnet netstat ifconfig; do mk $t bin; done
for t in wget nc traceroute route udhcpc ping ping6; do mk $t applet; done
# CA certificates for TLS clients
mkdir -p /system/etc/ssl /etc/ssl/certs 2>/dev/null
for c in /system/etc/ssl/cert.pem /etc/ssl/cert.pem /etc/ssl/certs/ca-certificates.crt; do
  [ -e "$c" ] || ln -s "$N/etc/cacert.pem" "$c" 2>/dev/null
done
setprop aera.net.tools 1
