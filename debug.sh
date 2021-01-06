#!/bin/bash

if test $# -ne 1; then
    echo "Usage: $0 <kvm_image>" 1>&2
    exit 1
fi

kvm_image="$1"
debug_port="12345"

# Show script commands when run.
set -x

#-ex "hbreak lwip_socket" \
#-ex "hbreak lwip_setsockopt" \

gdb --eval-command="target remote :12345" -ex "set confirm off" -ex "set pagination off" \
    # -ex "hbreak lwip_bind" \
   # -ex "hbreak  lwip_socket" \
    -ex "c" \
    -ex "disconnect" -ex "set arch i386:x86-64:intel" \
    -ex "target remote localhost:$debug_port" "$kvm_image"
