#!/bin/bash
set -e

# Set your LFS mount point
export LFS=/mnt/lfs

# Safely unmount in reverse order
for dir in run sys proc dev/pts dev; do
  if mountpoint -q "$LFS/$dir"; then
    echo "Unmounting $dir..."
    umount -l "$LFS/$dir"
  else
    echo "$dir already unmounted."
  fi
done

