#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/TenX-OS/manifest.git -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b 10X-OS .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Git cherry-pick
cd vendor/lineage
git remote add los https://github.com/LineageOS/android_vendor_lineage
git fetch los
git cherry-pick 198966577ace63573e5be49e03a2e59e32997054
cd ../..
echo "===== Cherry-picking Success ====="

# Export
export BUILD_USERNAME=FARHAN_UN
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch  
brunch mi439 userdebug



