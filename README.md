This project is based on Buildroot and luckfox-SDK
https://github.com/LuckfoxTECH/luckfox-pico
https://github.com/buildroot/buildroot

The project has tested on Luckfox-pico-zero.

The project fix the "bluez" problem on uClibc buildroot system, which is used by luckfox-SDK. But also keep the npu available.

### How to use the project
1) Download the Luckfox-SDK from https://github.com/LuckfoxTECH/luckfox-pico.
2) Build the whole SDK and flash it to the board.
3) Then find the mmc part on board. You can use an USB to TTL cable connect to the board's UART. Then use the u-boot (mmc part) command to get the partition info.
4) Then build this project.
5) Use the ./update.sh shell script to upload the rootfs.ext4 to the board. You will need to set the board into maskrom mode by holding the boot button and the reset button on Luckfox-pico-zero.
6) done
