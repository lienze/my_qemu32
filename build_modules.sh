#!/bin/bash
this_dir=`pwd`

sudo mount -o loop ./disk.raw ./img
cd ../source/
sudo make modules_install INSTALL_MOD_PATH=../my_qemu32/img/

