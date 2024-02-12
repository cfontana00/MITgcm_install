#!/bin/bash
#################################
#     MIT gcm + bfm install     #
#################################


# Set arguments
# -------------
DIR=$HOME/OGS2
PRESET=NORTH_ADRIATIC
MITGCM_TAG=checkpoint66j
MISC=/home/itfc/MISC
BFMDIR=/home/itai/MITgcm_BFM/ModelBuild


# Get MITgcm
# ----------


mkdir $DIR
git clone https://github.com/inogs/MITgcmBFM-build.git $DIR
cd $DIR

git checkout main

# Get bfm
# -------
#cp -r ~/MISC/bfmv5 bfm
cp -r $BFMDIR/bfm .

# Get coupler
# -----------
git clone https://github.com/gcossarini/BFMCOUPLER.git
cd BFMCOUPLER
git checkout bfmv5
cd ..

# Get MITgcm
# ----------
git clone https://github.com/MITgcm/MITgcm.git
cd MITgcm
git checkout -b $MITGCM_TAG $MITGCM_TAG
cd ..

# Get custom files
# ----------------
cp ~/MISC/builder_MITgcm_bfm_atos.sh .
cp ~/MISC/atos.intel ~/$DIR/compilers/machine_modules/
cp ~/MISC/x86_64.LINUX.intel_atos.inc ~/$DIR/compilers
cp ~/MISC/x86_64.LINUX.intel_atos_bfm.inc ~/$DIR/bfm/compilers/x86_64.LINUX.intel_atos.inc

# Load module
module load prgenv/intel intel-mpi

# Build
# -----
cp presets/$PRESET/SIZE.h_095p presets/$PRESET/SIZE.h

./builder_MITgcm_bfm_atos.sh -o bfm

./configure_MITgcm_bfm.sh

./builder_MITgcm_bfm_atos.sh -o MITgcm



