#!/bin/bash -x

source parameters.sh
INST=$PWD
cd $LOC


git clone git@github.com:alessioinnocenti/NWMed.git
cd NWMed
git checkout atos



user=`whoami`
mkdir -p /ec/res4/scratch/$user/MITgcm_BFM/
mkdir -p /ec/res4/scratch/$user/MITgcm_BFM/WORK_benchmark

pwd
cd NWMed

cat $INST/chain/chain_env.sh | sed -e s_%%PATH%%_${CUSTOM}_g \
            | sed -e s_%%USER%%_${user}_g > chain_env.sh
source chain_env.sh


# Edit files
# ----------
cd bin/src
cp $INST/chain/mit_profile__atos.src_inc .
cp $INST/chain/mit-compiler.ksh CONFIG
cp $INST/chain/Makefile .


for file in `ls *src_ksh`;do
  cat $file | sed -e s/itai/$user/g > tmp
  mv tmp $file
done

make
make install

cd ..
./mit_setup_directories.ksh

cd ..


for file in `ls *.sh`;do
  cat $file | sed -e s/itai/$user/g > tmp
  mv tmp $file
  chmod u+x $file
done


# Edit executable
# ---------------
cd HOST/atos/bin


ln -sf $LOC/$NAME/MITGCM_BUILD/mitgcmuv mitgcmuv_$SIZE

