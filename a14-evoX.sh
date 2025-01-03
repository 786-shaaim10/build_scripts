#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/EverestOS-AOSP/manifest -b 15 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/786-shaaim10/local_manifests_clo -b EverestOS/15 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="

# keys
# mkdir vendor/lineage-priv
# cp build-keys/* vendor/lineage-priv
# echo "============="
# echo "Keys copied"
# echo "============="

# Export
export BUILD_USERNAME=786-shaaim10 
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
#lunch everest_mi439-userdebug || lunch everest_mi439-ap3a-userdebug || lunch everest_mi439-ap2a-userdebug
#echo "============="

# one more 
lunch lineage_mi439-userdebug || lunch lineage_mi439-ap4a-userdebug|| lunch lineage_mi439-ap2a-userdebug

# Make cleaninstall
make installclean
echo "============="

# Build rom
make everest
