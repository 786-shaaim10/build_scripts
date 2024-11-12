#!/bin/bash

rm -rf .repo/local_manifests/


# Initialize local repository
repo init -u https://github.com/BlissRoms/stable_releases.git -b refs/tags/v18.0-beta.5-voyager --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/786-shaaim10/local_manifests_clo -b Alpha/14 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=shaaimgazi10
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
#lunch lineage_mi439-userdebug || lunch lineage_mi439-ap3a-userdebug || lunch lineage_mi439-ap2a-userdebug
#echo "============="

# Lunch  
 . build/envsetup.sh
 blissify deviceCodename
