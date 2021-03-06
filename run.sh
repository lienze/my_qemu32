#!/bin/bash

debug=''
if [ x$2 == x"debug" ];then
	debug='-S'
fi

if [ x$1 == x"disk" ];then
	sudo umount img
	qemu-system-i386 \
		$debug \
		-s \
		-kernel ../source/arch/x86/boot/bzImage \
		-drive file=./disk.raw,format=raw,index=0,media=disk\
		-nographic \
		-cpu max \
		-smp 1 \
		-m 1024 \
		-drive file=./hd,format=raw,index=1,media=disk \
		-drive file=./floppy.raw,index=0,if=floppy \
		-append "console=ttyS0 init=/linuxrc root=/dev/sda rw"
elif [ x$1 == x"kdisk" ];then
	sudo umount img
	qemu-system-i386 \
		$debug \
		-s \
		-kernel ../kernel_src/arch/x86/boot/bzImage \
		-drive format=raw,file=./disk.raw \
		-nographic \
		-enable-kvm \
		-cpu max \
		-smp 1 \
		-m 1024 \
		-hdb ./hd \
		-append "console=ttyS0 init=/linuxrc root=/dev/sda rw"
else
	echo "use disk, kdisk para to start..."
fi

