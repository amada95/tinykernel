#!/bin/bash
#
# build.sh
# Automated build script
#

echo ""
echo "*"
echo "* tinykernel build script"
echo "*"

# ./build.sh build
if [ "$1" == "build" ]; then
	mkdir build
	mkdir build/objects/
	mkdir build/target/
	
	echo ""	
	echo "Assembling kernel loader..."
	nasm -f elf32 kernel.asm -o build/objects/kasm.o

	echo "Compiling core kernel components..."
	echo "---"
	ls *.c
	echo "---"
	echo ""
	cd build/objects
	gcc -m32 -c ../../*.c
	cd ../../	

	echo "Linking kernel objectfiles..."
	echo "---"
	ls build/objects/*.o
	echo "---"
	echo ""
	ld -m elf_i386 -T link.ld -o build/target/kernel build/objects/*.o

	echo "Build complete"
	echo ""
	exit 0
fi

#./build.sh clean
if [ "$1" == "clean" ]; then
	echo ""
	echo "Cleaning kernel objectfiles and executables..."
	echo "---"
        ls build/objects/
        echo "---"
	echo ""

	echo "Cleaning kernel build files..."
        echo "---"
        ls build/target/
        echo "---"
        echo ""

	rm -rf build/
	echo "Clean complete"	
	echo ""

	exit 0
fi 

#./build.sh * (improper usage)
echo "Usage: ./build.sh [build | clean]"
exit 1
