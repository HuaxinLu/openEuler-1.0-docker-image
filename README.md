# openEuler-1.0-docker-image-from-iso
This is the first project of [**openEuler hackathon game**](https://openeuler.org/zh/events/2020hdc.html#section5). This project helps you to build a small docker image from openEuler-1.0-1205-aarch64.iso.

## Prerequisites
The build environment is the Kunpeng cloud server applied in [**this website**](dw.pcl.ac.cn/cloud/order). The OS is openEuler-1.0-1205-aarch64. In addition, two iso files are required: [**openEuler-1.0-1205-aarch64-dvd.iso**](http://openeuler-os-image.obs.cn-north-4.myhuaweicloud.com/openEuler-1.0-1205-aarch64-dvd.iso) and [**openEuler-1.0-aarch64-dvd.iso**](https://openeuler.obs.cn-south-1.myhuaweicloud.com/release/openEuler-1.0-aarch64-dvd.iso). The reason for using the second iso file is that the yum rpm in openEuler-1.0 rely on less software than openEuler-1.0-1205. So the docker image can be smaller.

## How to use
1. Root permission is required for this work. Firstly, create a folder containing the **createroot.sh** and **the two iso files**. Then run the script: `sh createroot.sh`.
2. Copy **clean.sh** in /openEuler-1.0-1205-root, run `chroot /openEuler-1.0-1205-root` and `sh cleanrpm.sh`.
3. Run `sh cleanfile.sh` as step 2.
4. Exit from the chroot mode and run `sh package.sh`. The tarfile of openEuler-1.0-1205-root will be generated in the build folder. (The default path is /root/openeuler-build. If you want to change the path, you can set in package.sh.)
5. Copy the Dockerfile in the build folder and run docker build command.
