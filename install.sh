#!/bin/bash 
#################################
#     MIT gcm + bfm install     #
#################################


# Set arguments
# -------------

LOC=$HOME/MODEL
NAME=MITGCM

INST=$PWD
DIR=$LOC/$NAME
PRESET=NORTH_ADRIATIC
MITGCM_TAG=checkpoint66j


# Check for directory
# -------------------
if [ ! -d `dirname $LOC` ];then
 echo "Error : create directory "`dirname $LOC`' first'
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

# Check for SIZE.h file
# ---------------------
#if [ ! -f presest/$PRESET/SIZE.h ];then
#  lst=`ls presets/$PRESET/SIZE.h*`
#  echo $file
#fi


# Load module
module load prgenv/intel intel-mpi


# Copy preset
# -----------
cp -r $INST/presets/$PRESET $DIR/presets

# Build
# -----
./builder_MITgcm_bfm_atos.sh -o bfm

./configure_MITgcm_bfm.sh

./builder_MITgcm_bfm_atos.sh -o MITgcm


