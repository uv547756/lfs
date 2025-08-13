#!/bin/bash
set -e

# Set your LFS mount point
export LFS=/mnt/lfs

# Check and mount all necessary virtual filesystems using --bind (safe)
for dir in dev dev/pts proc sys run; do
  if ! mountpoint -q "$LFS/$dir"; then
    echo "Mounting $dir..."
    mount --bind /$dir "$LFS/$dir"
  else
    echo "$dir already mounted."
  fi
done

# Enter the LFS chroot with a clean environment
chroot "$LFS" /usr/bin/env -i \
  HOME=/root                  \
  TERM="$TERM"               \
  PS1='(lfs chroot) \u:\w\$ ' \
  PATH=/usr/bin:/usr/sbin     \
  MAKEFLAGS="-j$(nproc)"      \
  TESTSUITEFLAGS="-j$(nproc)" \
  /bin/bash --login

