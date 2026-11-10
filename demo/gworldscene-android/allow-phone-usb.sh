#!/usr/bin/env bash
set -euo pipefail

# Grant the current user access to a connected TCL phone until it is unplugged.
command -v setfacl >/dev/null || {
    echo "Install the Ubuntu acl package first: sudo apt install acl" >&2
    exit 1
}
command -v lsusb >/dev/null || {
    echo "Install the Ubuntu usbutils package first: sudo apt install usbutils" >&2
    exit 1
}

phone_user="${SUDO_USER:-$(id -un)}"
mapfile -t phone_nodes < <(lsusb -d 1bbb:0c01 | awk '{ sub(/:$/, "", $4); print "/dev/bus/usb/" $2 "/" $4 }')
if ((${#phone_nodes[@]} == 0)); then
    echo "Connect your TCL phone and enable USB debugging, then run this script again." >&2
    exit 1
fi
for phone_node in "${phone_nodes[@]}"; do
    echo "Granting $phone_user access to $phone_node"
    sudo setfacl -m "u:${phone_user}:rw" "$phone_node"
done
echo 'Unlock the phone and accept its "Allow USB debugging?" prompt.'
echo 'If you reconnect the USB cable, run this script again.'
