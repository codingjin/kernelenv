#!/bin/bash
set -x

#If current mounted, unmount
sudo umount $MOUNT_DIR

#Compile the kernel
cd $KERN_SRC


#Enable the KVM mode in your kernel config file
sudo make x86_64_defconfig $PARA
sudo make kvm_guest.config $PARA

#Compile the kernel with '-j' (denotes parallelism) in sudo mode
sudo make $PARA
#sudo make modules
#sudo make modules_install
#sudo make install

sudo cp ./arch/x86/boot/bzImage $KERNEL/vmlinuz-$VER
sudo cp System.map $KERNEL/System.map-$VER
sudo cp .config $KERNEL/config-$VER

