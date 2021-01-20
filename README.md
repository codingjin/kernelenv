# kernelenv

## On Ubuntu

### 1.Installing Git  
sudo apt-get update  
sudo apt-get upgrade  
sudo apt-get install git  
git clone https://github.com/codingjin/kernelenv.git  
cd kernelenv  

### 2.Set environmental variables
source scripts/setvars.sh  

### 3.Get Kernel Source
cd $BASE  
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.9.tar.xz
tar xf linux-5.9.tar.xz  

### 4.Install required libraries
sudo apt-get install -y build-essential cmake libssl-dev bison flex libelf-dev  

### 5.Compile the Kernel
From the source directory set the environment variables.   
source scripts/setvars.sh  
$BASE/scripts/compile_kernel.sh  

### 6.Create the QEMU image
Create the QEMU IMAGE only for the first time. You should not create an image(which is your disk now) every time you will be compiling and running your kernel.  
(1)During installation, if promoted (y,n), enter yes  

$BASE/scripts/qemu_create.sh  

(2)Set your QEMU image  
cd $BASE  
source scripts/setvars.sh  
$BASE/scripts/mount_qemu.sh  
cd $MOUNT_DIR                      //Go to where the QEMU disk is mounted  
sudo chroot .                             //set the disk as your root file system  
passwd                                     //add new password for the root user in the virtual machine  

sudo apt-get update; sudo apt-get -y install curl tar gcc make time
sudo apt-get install -y flex bison python-dev libelf-dev libaudit-dev libslang2-dev libperl-dev binutils-dev liblzma-dev libnuma-dev
sudo apt-get install -y git vim screen usbutils build-essential cmake libssl-dev  

exit                                            //Unmount the QEMU disk  
cd $BASE  
$BASE/scripts/umount_qemu.sh         //Unmount the QEMU disk  

### 7.Launch the QEMU
$BASE/scripts/run_qemu.sh  

### 8.Killing the QEMU process
$BASE/scripts/killqemu.sh  

### 9.Copying data from your host to QEMU
This script copies directories/files from your host machine to QEMU’s root folder  

$BASE/scripts/copy_data_to_qemu.sh FULL_PATH_OF_DIRECTORY_TO_COPY  
