#!/bin/bash

#rm -rf .repo/local_manifests/



# repo init rom
#repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs
#repo init -u https://github.com/ProjectMatrixx/android.git -b 15.0 --git-lfs
#echo "=================="
#echo "Repo init success"
#echo "=================="


# Local manifests
#git clone https://github.com/786-shaaim10/local_manifests_Mi439 -b 15.0 .repo/local_manifests
#echo "============================"
#echo "Local manifest clone success"
#echo "============================"


# build
#/opt/crave/resync.sh
#echo "============="
#echo "Sync success"
#echo "============="

# remove face unlock 
#rm -rf packages/apps/FaceUnlock

# play vendor_infinity-priv_keys
#
# Export
export BUILD_USERNAME=shaaim
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export SELINUX_IGNORE_NEVERALLOWS=true
echo "======= Export Done ======"

# platform/external/chromium-webview
#rm -rf  external/chromium-webview 
#git clone https://github.com/Gtajisan/android_external_chromium-webview -b Custom external/chromium-webview


# Go to the root of your ROM source
#cd ~/android/lineage  # or wherever your ROM is

# these not need in crave 

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

. build/envsetup.sh
brunch Mi439_4_19 
