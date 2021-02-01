#!/bin/bash
set -x

#If current mounted, unmount
sudo umount $MOUNT_DIR

#Compile the kernel
cd $KERN_SRC


#Enable the KVM mode in your kernel config file
make x86_64_defconfig $PARA
make kvm_guest.config $PARA

#Compile the kernel with '-j' (denotes parallelism) in sudo mode
make $PARA
#make modules
#make modules_install
#make install

cp ./arch/x86/boot/bzImage $KERNEL/vmlinuz-$VER
cp System.map $KERNEL/System.map-$VER
cp .config $KERNEL/config-$VER

