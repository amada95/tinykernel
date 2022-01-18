# tinykernel is a work in progress!

### instructions for running
1. clone this repository: `git clone https://github.com/rosewritescode/tinykernel/`
1. change directory to the repository `cd tinykernel`
2. run `./build.sh build` to build the kernel (the compiled kernel binary will be located in `build/target/`)
3. use qemu to boot the kernel: `qemu-system-i386 -kernel build/target/kernel`

DISCLAIMER/NOTES: 
  1. do not try to run this on actual hardware! I use qemu for development not only for convenience but also safety!
  2. this is a rough WIP, and as such there is no dependency list as of yet for this project's build script! (but do note you should be fine as long as you have `nasm`, `gcc`, `ld`, and are running a \*nix-based system

### contributing
please feel free to send over pull requests if you have a neat idea, or just fork this repo as I continue development and play around! this is just a little project I'll be working on in my spare time, however, so please bear with me!

### license
GNU GPLv3 (see LICENSE file)
