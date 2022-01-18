#make object dir
mkdir -p objects

#assemble kboot.s
as --32 kboot.s -o objects/kboot.o

#compile kernel core files (*.c)
cd objects/
gcc -m32 -c ../*.c -O2 -std=gnu99 -ffreestanding -fno-stack-protector -Wall -Wextra
cd ..

#link kernel with objectfiles
ld -m elf_i386 -T linker.ld objects/*.o -o tinykernel.bin -nostdlib

#check tinykernel.bin file is x86 multiboot file
grub-file --is-x86-multiboot tinykernel.bin

#build the iso file
mkdir -p isodir/boot/grub
cp tinykernel.bin isodir/boot/tinykernel.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o tinykernel.iso isodir

#run system in qemu
qemu-system-x86_64 -cdrom tinykernel.iso
