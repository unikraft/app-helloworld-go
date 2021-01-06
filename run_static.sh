#!/bin/bash

if test $# -ne 1; then
    echo "Usage: $0 <kvm_image>" 1>&2
    exit 1
fi

kvm_image="$1"
qemu_script="/usr/local/bin/qemu-guest"
debug_port="12345"
bridge_iface="uk0"
bridge_ip="172.44.0.1"
ip="172.44.0.2"

echo "Creating bridge $bridge_iface with IP address $bridge_ip ..."
sudo brctl addbr "$bridge_iface" || true
sudo ifconfig "$bridge_iface" "$bridge_ip"

echo "Starting KVM image in debug mode. GDB server listening on port $debug_port ..."
"$qemu_script" -k "$kvm_image" -b "$bridge_iface" -m 4096 -a "netdev.ipv4_addr=${ip}
netdev.ipv4_gw_addr=172.44.0.1 netdev.ipv4_subnet_mask=255.255.255.0 --" \
-g "$debug_port" -P