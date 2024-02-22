#!/bin/bash
#################################
#     MIT gcm + bfm install     #
#################################


# Set arguments
# -------------

source parameters.sh
INST=$PWD
DIR=$LOC/$NAME
MITGCM_TAG=checkpoint66j


# Check for directory
# -------------------
if [ ! -d $LOC ];then
 echo 'Error : create directory '$LOC' first'
 exit
fi
cd $LOC



# Get MITgcm
# ----------
mkdir $NAME
git clone https://github.com/inogs/MITgcmBFM-build.git $NAME
cd $NAME
git checkout main



# Get bfm
# -------
#cp -r ~/MISC/bfmv5 bfm
#cp -r $BFMDIR/bfm .
cp -r $INST/bfm .


# Get coupler
# -----------
git clone https://github.com/gcossarini/BFMCOUPLER.git
cd BFMCOUPLER
git checkout bfmv5
cd ..

# Get MITgcm
# ----------
echo $PWD
git clone https://github.com/MITgcm/MITgcm.git
cd MITgcm
git checkout -b $MITGCM_TAG $MITGCM_TAG
cd ..



# Get custom files
# ----------------
cp $INST/misc/builder_MITgcm_bfm_atos.sh .
cp $INST/misc/atos.intel compilers/machine_modules/
cp $INST/misc/x86_64.LINUX.intel_atos.inc compilers
cp $INST/misc/x86_64.LINUX.intel_atos_bfm.inc bfm/compilers/x86_64.LINUX.intel_atos.inc

cat $INST/configure_MITgcm_bfm.sh | sed s/%%PRESET%%/$PRESET/ > configure_MITgcm_bfm.sh

# Copy preset
# -----------
cp -r $INST/presets/$PRESET $DIR/presets

# Check for SIZE.h file
# ---------------------
echo $PWD
ls
ln -sf presets/$PRESET/SIZE.h_${SIZE}p SIZE.h


# Load module
module load prgenv/intel intel-mpi



# Build
# -----
./builder_MITgcm_bfm_atos.sh -o bfm

./configure_MITgcm_bfm.sh

./builder_MITgcm_bfm_atos.sh -o MITgcm


cd MITGCM_BUILD
ln -sf mitgcmuv mitgcmuv_$SIZE



