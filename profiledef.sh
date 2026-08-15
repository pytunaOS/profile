#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="pytuna"
iso_label="PYTUNAOS_DEV_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m%d)"
iso_publisher="pytunaOS <https://github.com/askell091/pytunaOS>"
iso_application="pytunaOS Live DVD"
iso_version="dev-$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="pytuna"
buildmodes=('iso')
bootmodes=('bios.syslinux'
           'uefi.grub')
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:0400"
  ["/etc/gshadow"]="0:0:0400"
  ["/root"]="0:0:750"
  ["/root/.gnupg"]="0:0:700"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/nvidia-module-loader"]="0:0:755"
  ["/usr/local/bin/pkexec-wrapper"]="0:0:755"
  ["/usr/local/bin/remove-nvidia"]="0:0:755"
)
