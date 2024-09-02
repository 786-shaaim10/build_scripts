#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --depth=1 --no-repo-verify -u https://github.com/AfterLifePrjkt13/android_manifest.git -b 4.0 -g default,-mips,-darwin,-notdefault
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b Afterlife .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# build
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

#  remove error 
rm -rf external/chromium-webview  
echo "======= remove Done ======"

#  fix error 
rm -rf packages/apps/ParanoidSense
echo "=======  Done ======"

# Export
export BUILD_USERNAME=FARHAN•XD
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# lunch 
. build/envsetup.sh
lunch afterlife_mi439-userdebug
make installclean
m afterlife 
# maybe 
mka bacon
