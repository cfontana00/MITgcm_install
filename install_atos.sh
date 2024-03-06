#!/bin/bash 

source ~/.bashrc
source parameters.sh
INST=$PWD
cd $LOC

# Check requirements
# ------------------
if [ ' '$CMEMS_USER == ' ' -o ' '$CMEMS_PSWD == ' ' ];then
  echo "ERROR => set CMEMS_USER and CMEMS_PSWD in your ~/.bashrc"
  exit
fi


source $ENV/bin/activate
copernicusmarine --version
if [ $? -ne 0 ];then
  echo "ERROR => install copernicusmarine and change MIT_VENV_1 accordingly in $CUSTOM/bin/src/mit_profile.src_inc"
  echo "Try something like :
        cd ~
        ml python3
        mkdir -p ~/venvs/
        python3 -m venv ~/venvs/copernicusmarine
        source ~/venvs/copernicusmarine/bin/activate
        pip install copernicusmarine
        copernicusmarine --version"
  exit
fi



for mod in "scipy" "openpyxl" ;do
  python -c "import "$mod 
  if [ $? -ne 0 ];then
    echo "ERROR => install python "$mod
    exit
  fi
done


# ------------- #
# Start install #
# ------------- #


#git clone git@github.com:alessioinnocenti/NWMed.git
git clone git@github.com:cfontana00/NWMed.git
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
#cp $INST/chain/mit_profile__atos.src_inc .
#cp $INST/chain/mit-compiler.ksh CONFIG
#cp $INST/chain/Makefile .


for file in `ls *src_ksh`;do
  cat $file | sed -e s/itfc/$user/g > tmp
  mv tmp $file
done

make
make install

cd ..
./mit_setup_directories.ksh

cd ..


for file in `ls *.sh`;do
  cat $file | sed -e s/itfc/$user/g > tmp
  mv tmp $file
  chmod u+x $file
done


# Edit executable
# ---------------
cd HOST/atos/bin

ln -sf $LOC/$NAME/MITGCM_BUILD/mitgcmuv mitgcmuv_$SIZE


echo "IMPORANT !! => set alias python='/usr/bin/python3' in your ~/.bashrc"
echo "IMPORANT !! => set Python env MIT_VENV_1 accordingly in $CUSTOM/bin/src/mit_profile.src_inc "
