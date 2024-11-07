#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init --depth=1 -u https://github.com/AfterlifeOS/android_manifest.git -b 14 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests -b 14/Afterlife .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh && repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
echo "============================"

# Export
export BUILD_USERNAME=FARHAN 
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
echo "======= Export Done ======"


# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

#  remove to fix build error 
rm -rf external/chromium-webview
echo "============="
echo "Removing Done"
echo "============="

# Lunch
. build/envsetup.sh
goafterlife Mi439_4_19
goafterlife Mi439_4_19 userdebug
