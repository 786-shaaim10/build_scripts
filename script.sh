#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/786-shaaim10/local_manifests_clo -b PixelOS/15 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=786-shaaim10
export BUILD_HOSTNAME=crave 
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "============="

# Lunch
lunch aosp_mi439-userdebug || lunch aosp_mi439-ap2a-userdebug || lunch aosp_mi439-ap4a-userdebug

# Build
mka bacon
