#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/bootdevice/by-name/recovery:15513600:60ddffc013365a442bea980f03c80cce4839ca08; then
  applypatch  EMMC:/dev/block/platform/bootdevice/by-name/boot:9883648:aac871c12edaa2f45a3dee924f28f55c3dabbfbe EMMC:/dev/block/platform/bootdevice/by-name/recovery a4e8e914eda736e694ae2ee498b8c62ff6c1c7dc 15511552 aac871c12edaa2f45a3dee924f28f55c3dabbfbe:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/bootdevice/by-name/recovery bs=1 seek=15511552 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
