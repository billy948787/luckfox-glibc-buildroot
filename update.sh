#!/bin/bash
cd upgrade_tool
sudo ./upgrade_tool DB download.bin
sudo ./upgrade_tool WL 0x00190640 ~/coding/buildroot/output/images/rootfs.ext4
