
#!/bin/bash

rm -rf .repo/local_manifests/

repo init --depth=1 -u https://gitea.com/AfterLifePrjkt/manifest.git -b 14.2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b Afterlife .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=chaaim
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
echo "======= Export Done ======"

# build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

# lunch fumking
lunch afterlife_mi439-userdebug
make installclean 
goafterlife mi439



