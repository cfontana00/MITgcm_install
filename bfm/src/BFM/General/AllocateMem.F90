#include"cppdefs.h"
!-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
! MODEL
!	   BFM - Biogeochemical Flux Model
!
! SUBROUTINE
!   AllocateMem
!
! FILE
!   AllocateMem
!
! DESCRIPTION
!   Allocation of memory for Global State variables and other Variables
!  
!   This file is generated directly from OpenSesame model code, using a code 
!   generator which transposes from the sesame meta language into F90.
!   F90 code generator written by P. Ruardij.
!   structure of the code based on ideas of M. Vichi.
!
! AUTHORS
!   Piet Ruardij & Marcello Vichi
!
! CHANGE_LOG
!   ---
!
! COPYING
!   
!   Copyright (C) 2015 BFM System Team (bfm_st@lists.cmcc.it)
!   Copyright (C) 2004 P. Ruardij, M. Vichi
!   (rua@nioz.nl, vichi@bo.ingv.it)
!
!   This program is free software; you can redistribute it and/or modify
!   it under the terms of the GNU General Public License as published by
!   the Free Software Foundation;
!   This program is distributed in the hope that it will be useful,
!   but WITHOUT ANY WARRANTY; without even the implied warranty of
!   MERCHANTEABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!   GNU General Public License for more details.
!
!-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
!
!
  subroutine AllocateMem

  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  !  use (import) other modules
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  use global_mem
  use mem
  use mem_Param

  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Implicit typing is never allowed
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  IMPLICIT NONE
  integer:: status

  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  !Start the allocation of pelagic state global
  ! matrix and pointers
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  !LEVEL1 "#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-"
  LEVEL1 "# Allocating State Variables and Rates array ..."

#ifndef NOT_STANDALONE
    
   allocate(D3STATE(1:NO_D3_BOX_STATES,1:NO_BOXES),stat=status)
   if (status /= 0) call error_msg_prn(ALLOC,"AllocateMem", "D3STATE")
   D3STATE = ZERO
#ifndef EXPLICIT_SINK
     allocate(D3SOURCE(1:NO_D3_BOX_STATES,1:NO_BOXES),stat=status)
     if (status /= 0) call error_msg_prn(ALLOC,"AllocateMem", "D3SOURCE")
     D3SOURCE = ZERO
#else
     allocate(D3SOURCE(1:NO_D3_BOX_STATES,1:NO_D3_BOX_STATES,1:NO_BOXES),stat=status)
     if (status /= 0) call error_msg_prn(ALLOC,"AllocateMem", "D3SOURCE")
     D3SOURCE = ZERO
     allocate(D3SINK(1:NO_D3_BOX_STATES,1:NO_D3_BOX_STATES,1:NO_BOXES) ,stat=status)
     if (status /= 0) call error_msg_prn(ALLOC,"AllocateMem", "D3SINK")
     D3SINK = ZERO
#endif
   allocate(D3STATETYPE(1:NO_D3_BOX_STATES ),stat=status)
   if (status /= 0) call error_msg_prn(ALLOC,"AllocateMem","D3STATETYPE")
   D3STATETYPE = ZERO
#ifdef BFM_NEMO
     allocate(D3STATEOBC(1:NO_D3_BOX_STATES),stat=status)
     if (status /= 0) call error_msg_prn(ALLOC,"AllocateMem","D3STATEOBC")
     D3STATEOBC = ZERO
#endif

    
   allocate(D3DIAGNOS(1:NO_D3_BOX_DIAGNOSS,1:NO_BOXES),stat=status)
   if (status /= 0) call error_msg_prn(ALLOC,"AllocateMem", "D3DIAGNOS")
   D3DIAGNOS = ZERO

    
   allocate(D2DIAGNOS(1:NO_D2_BOX_DIAGNOSS,1:NO_BOXES_XY),stat=status)
   if (status /= 0) call error_msg_prn(ALLOC,"AllocateMem", "D2DIAGNOS")
   D2DIAGNOS = ZERO

#ifdef INCLUDE_SEAICE


#endif
#ifdef INCLUDE_BEN


#endif
#endif



#ifdef INCLUDE_SEAICE


#endif
#ifdef INCLUDE_BEN


#endif

  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Allocation of Pelagic variables
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

O2o => D3STATE(ppO2o,:); O2o=ZERO
N1p => D3STATE(ppN1p,:); N1p=ZERO
N3n => D3STATE(ppN3n,:); N3n=ZERO
N4n => D3STATE(ppN4n,:); N4n=ZERO
O4n => D3STATE(ppO4n,:); O4n=ZERO
N5s => D3STATE(ppN5s,:); N5s=ZERO
N6r => D3STATE(ppN6r,:); N6r=ZERO
B1c => D3STATE(ppB1c,:); B1c=ZERO
B1n => D3STATE(ppB1n,:); B1n=ZERO
B1p => D3STATE(ppB1p,:); B1p=ZERO
P1c => D3STATE(ppP1c,:); P1c=ZERO
P1n => D3STATE(ppP1n,:); P1n=ZERO
P1p => D3STATE(ppP1p,:); P1p=ZERO
P1l => D3STATE(ppP1l,:); P1l=ZERO
P1s => D3STATE(ppP1s,:); P1s=ZERO
P2c => D3STATE(ppP2c,:); P2c=ZERO
P2n => D3STATE(ppP2n,:); P2n=ZERO
P2p => D3STATE(ppP2p,:); P2p=ZERO
P2l => D3STATE(ppP2l,:); P2l=ZERO
P3c => D3STATE(ppP3c,:); P3c=ZERO
P3n => D3STATE(ppP3n,:); P3n=ZERO
P3p => D3STATE(ppP3p,:); P3p=ZERO
P3l => D3STATE(ppP3l,:); P3l=ZERO
P4c => D3STATE(ppP4c,:); P4c=ZERO
P4n => D3STATE(ppP4n,:); P4n=ZERO
P4p => D3STATE(ppP4p,:); P4p=ZERO
P4l => D3STATE(ppP4l,:); P4l=ZERO
Z3c => D3STATE(ppZ3c,:); Z3c=ZERO
Z3n => D3STATE(ppZ3n,:); Z3n=ZERO
Z3p => D3STATE(ppZ3p,:); Z3p=ZERO
Z4c => D3STATE(ppZ4c,:); Z4c=ZERO
Z4n => D3STATE(ppZ4n,:); Z4n=ZERO
Z4p => D3STATE(ppZ4p,:); Z4p=ZERO
Z5c => D3STATE(ppZ5c,:); Z5c=ZERO
Z5n => D3STATE(ppZ5n,:); Z5n=ZERO
Z5p => D3STATE(ppZ5p,:); Z5p=ZERO
Z6c => D3STATE(ppZ6c,:); Z6c=ZERO
Z6n => D3STATE(ppZ6n,:); Z6n=ZERO
Z6p => D3STATE(ppZ6p,:); Z6p=ZERO
R1c => D3STATE(ppR1c,:); R1c=ZERO
R1n => D3STATE(ppR1n,:); R1n=ZERO
R1p => D3STATE(ppR1p,:); R1p=ZERO
R2c => D3STATE(ppR2c,:); R2c=ZERO
R3c => D3STATE(ppR3c,:); R3c=ZERO
R6c => D3STATE(ppR6c,:); R6c=ZERO
R6n => D3STATE(ppR6n,:); R6n=ZERO
R6p => D3STATE(ppR6p,:); R6p=ZERO
R6s => D3STATE(ppR6s,:); R6s=ZERO
O3c => D3STATE(ppO3c,:); O3c=ZERO
O3h => D3STATE(ppO3h,:); O3h=ZERO
O5c => D3STATE(ppO5c,:); O5c=ZERO


#ifdef INCLUDE_SEAICE
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Allocation of SeaIce variables
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


#endif

#ifdef INCLUDE_BEN
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Allocation of Benthic variables
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=


#endif

  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Start the allocation of other pelagic variables which can be outputted
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  !LEVEL1 "#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-"
  LEVEL1 "# Allocating Other Global Variables .."

ppqpcPPY(iiP1)=35
ppqpcPPY(iiP2)=36
ppqpcPPY(iiP3)=37
ppqpcPPY(iiP4)=38
ppqncPPY(iiP1)=39
ppqncPPY(iiP2)=40
ppqncPPY(iiP3)=41
ppqncPPY(iiP4)=42
ppqscPPY(iiP1)=43
ppqscPPY(iiP2)=44
ppqscPPY(iiP3)=45
ppqscPPY(iiP4)=46
ppqlcPPY(iiP1)=47
ppqlcPPY(iiP2)=48
ppqlcPPY(iiP3)=49
ppqlcPPY(iiP4)=50
ppqccPPY(iiP1)=51
ppqccPPY(iiP2)=52
ppqccPPY(iiP3)=53
ppqccPPY(iiP4)=54
ppBFM1D_exR2ac(iiP1)=55
ppBFM1D_exR2ac(iiP2)=56
ppBFM1D_exR2ac(iiP3)=57
ppBFM1D_exR2ac(iiP4)=58
ppqpcMEZ(iiZ3)=59
ppqpcMEZ(iiZ4)=60
ppqncMEZ(iiZ3)=61
ppqncMEZ(iiZ4)=62
ppqpcMIZ(iiZ5)=63
ppqpcMIZ(iiZ6)=64
ppqncMIZ(iiZ5)=65
ppqncMIZ(iiZ6)=66
ppqpcOMT(iiR1)=67
ppqpcOMT(iiR2)=68
ppqpcOMT(iiR3)=69
ppqpcOMT(iiR6)=70
ppqncOMT(iiR1)=71
ppqncOMT(iiR2)=72
ppqncOMT(iiR3)=73
ppqncOMT(iiR6)=74
ppqscOMT(iiR1)=75
ppqscOMT(iiR2)=76
ppqscOMT(iiR3)=77
ppqscOMT(iiR6)=78
ppqpcPBA(iiB1)=79
ppqncPBA(iiB1)=80
ppsediPPY(iiP1)=81
ppsediPPY(iiP2)=82
ppsediPPY(iiP3)=83
ppsediPPY(iiP4)=84
ppsediMIZ(iiZ5)=85
ppsediMIZ(iiZ6)=86
ppsediMEZ(iiZ3)=87
ppsediMEZ(iiZ4)=88
ppsunPPY(iiP1)=89
ppsunPPY(iiP2)=90
ppsunPPY(iiP3)=91
ppsunPPY(iiP4)=92
ppeiPPY(iiP1)=93
ppeiPPY(iiP2)=94
ppeiPPY(iiP3)=95
ppeiPPY(iiP4)=96
ppELiPPY(iiP1)=97
ppELiPPY(iiP2)=98
ppELiPPY(iiP3)=99
ppELiPPY(iiP4)=100

ETW => D3DIAGNOS(ppETW,:); ETW=ZERO
ESW => D3DIAGNOS(ppESW,:); ESW=ZERO
ERHO => D3DIAGNOS(ppERHO,:); ERHO=ZERO
EIR => D3DIAGNOS(ppEIR,:); EIR=ZERO
ESS => D3DIAGNOS(ppESS,:); ESS=ZERO
EPR => D3DIAGNOS(ppEPR,:); EPR=ZERO
Depth => D3DIAGNOS(ppDepth,:); Depth=ZERO
Volume => D3DIAGNOS(ppVolume,:); Volume=ZERO
Area => D3DIAGNOS(ppArea,:); Area=ZERO
DIC => D3DIAGNOS(ppDIC,:); DIC=ZERO
CO2 => D3DIAGNOS(ppCO2,:); CO2=ZERO
pCO2 => D3DIAGNOS(pppCO2,:); pCO2=ZERO
HCO3 => D3DIAGNOS(ppHCO3,:); HCO3=ZERO
CO3 => D3DIAGNOS(ppCO3,:); CO3=ZERO
ALK => D3DIAGNOS(ppALK,:); ALK=ZERO
pH => D3DIAGNOS(pppH,:); pH=ZERO
OCalc => D3DIAGNOS(ppOCalc,:); OCalc=ZERO
OArag => D3DIAGNOS(ppOArag,:); OArag=ZERO
totpelc => D3DIAGNOS(pptotpelc,:); totpelc=ZERO
totpeln => D3DIAGNOS(pptotpeln,:); totpeln=ZERO
totpelp => D3DIAGNOS(pptotpelp,:); totpelp=ZERO
totpels => D3DIAGNOS(pptotpels,:); totpels=ZERO
cxoO2 => D3DIAGNOS(ppcxoO2,:); cxoO2=ZERO
eO2mO2 => D3DIAGNOS(ppeO2mO2,:); eO2mO2=ZERO
Chla => D3DIAGNOS(ppChla,:); Chla=ZERO
ffCO2 => D3DIAGNOS(ppffCO2,:); ffCO2=ZERO
flPTN6r => D3DIAGNOS(ppflPTN6r,:); flPTN6r=ZERO
flN3O4n => D3DIAGNOS(ppflN3O4n,:); flN3O4n=ZERO
flN4N3n => D3DIAGNOS(ppflN4N3n,:); flN4N3n=ZERO
sediR2 => D3DIAGNOS(ppsediR2,:); sediR2=ZERO
sediR6 => D3DIAGNOS(ppsediR6,:); sediR6=ZERO
sediO5 => D3DIAGNOS(ppsediO5,:); sediO5=ZERO
xEPS => D3DIAGNOS(ppxEPS,:); xEPS=ZERO
ABIO_eps => D3DIAGNOS(ppABIO_eps,:); ABIO_eps=ZERO

qpcPPY => D3DIAGNOS(ppqpcPPY(iiP1): ppqpcPPY(iiP4),:)
qpcPPY=ZERO
qncPPY => D3DIAGNOS(ppqncPPY(iiP1): ppqncPPY(iiP4),:)
qncPPY=ZERO
qscPPY => D3DIAGNOS(ppqscPPY(iiP1): ppqscPPY(iiP4),:)
qscPPY=ZERO
qlcPPY => D3DIAGNOS(ppqlcPPY(iiP1): ppqlcPPY(iiP4),:)
qlcPPY=ZERO
qccPPY => D3DIAGNOS(ppqccPPY(iiP1): ppqccPPY(iiP4),:)
qccPPY=ZERO
BFM1D_exR2ac => D3DIAGNOS(ppBFM1D_exR2ac(iiP1): ppBFM1D_exR2ac(iiP4),:)
BFM1D_exR2ac=ZERO
qpcMEZ => D3DIAGNOS(ppqpcMEZ(iiZ3): ppqpcMEZ(iiZ4),:)
qpcMEZ=ZERO
qncMEZ => D3DIAGNOS(ppqncMEZ(iiZ3): ppqncMEZ(iiZ4),:)
qncMEZ=ZERO
qpcMIZ => D3DIAGNOS(ppqpcMIZ(iiZ5): ppqpcMIZ(iiZ6),:)
qpcMIZ=ZERO
qncMIZ => D3DIAGNOS(ppqncMIZ(iiZ5): ppqncMIZ(iiZ6),:)
qncMIZ=ZERO
qpcOMT => D3DIAGNOS(ppqpcOMT(iiR1): ppqpcOMT(iiR6),:)
qpcOMT=ZERO
qncOMT => D3DIAGNOS(ppqncOMT(iiR1): ppqncOMT(iiR6),:)
qncOMT=ZERO
qscOMT => D3DIAGNOS(ppqscOMT(iiR1): ppqscOMT(iiR6),:)
qscOMT=ZERO
qpcPBA => D3DIAGNOS(ppqpcPBA(iiB1): ppqpcPBA(iiB1),:)
qpcPBA=ZERO
qncPBA => D3DIAGNOS(ppqncPBA(iiB1): ppqncPBA(iiB1),:)
qncPBA=ZERO
sediPPY => D3DIAGNOS(ppsediPPY(iiP1): ppsediPPY(iiP4),:)
sediPPY=ZERO
sediMIZ => D3DIAGNOS(ppsediMIZ(iiZ5): ppsediMIZ(iiZ6),:)
sediMIZ=ZERO
sediMEZ => D3DIAGNOS(ppsediMEZ(iiZ3): ppsediMEZ(iiZ4),:)
sediMEZ=ZERO
sunPPY => D3DIAGNOS(ppsunPPY(iiP1): ppsunPPY(iiP4),:)
sunPPY=ZERO
eiPPY => D3DIAGNOS(ppeiPPY(iiP1): ppeiPPY(iiP4),:)
eiPPY=ZERO
ELiPPY => D3DIAGNOS(ppELiPPY(iiP1): ppELiPPY(iiP4),:)
ELiPPY=ZERO


EPCO2air => D2DIAGNOS(ppEPCO2air,:); EPCO2air=ZERO
CO2airflux => D2DIAGNOS(ppCO2airflux,:); CO2airflux=ZERO
Area2d => D2DIAGNOS(ppArea2d,:); Area2d=ZERO
ThereIsLight => D2DIAGNOS(ppThereIsLight,:); ThereIsLight=ZERO
SUNQ => D2DIAGNOS(ppSUNQ,:); SUNQ=ZERO
EWIND => D2DIAGNOS(ppEWIND,:); EWIND=ZERO
totsysc => D2DIAGNOS(pptotsysc,:); totsysc=ZERO
totsysn => D2DIAGNOS(pptotsysn,:); totsysn=ZERO
totsysp => D2DIAGNOS(pptotsysp,:); totsysp=ZERO
totsyss => D2DIAGNOS(pptotsyss,:); totsyss=ZERO
EICE => D2DIAGNOS(ppEICE,:); EICE=ZERO


   PELSURFACE => D2DIAGNOS(11+1:11+51,:); PELSURFACE=ZERO
   jsurO2o => D2DIAGNOS(11+ppO2o,:); jsurO2o=ZERO
   jsurN1p => D2DIAGNOS(11+ppN1p,:); jsurN1p=ZERO
   jsurN3n => D2DIAGNOS(11+ppN3n,:); jsurN3n=ZERO
   jsurN4n => D2DIAGNOS(11+ppN4n,:); jsurN4n=ZERO
   jsurO4n => D2DIAGNOS(11+ppO4n,:); jsurO4n=ZERO
   jsurN5s => D2DIAGNOS(11+ppN5s,:); jsurN5s=ZERO
   jsurN6r => D2DIAGNOS(11+ppN6r,:); jsurN6r=ZERO
   jsurB1c => D2DIAGNOS(11+ppB1c,:); jsurB1c=ZERO
   jsurB1n => D2DIAGNOS(11+ppB1n,:); jsurB1n=ZERO
   jsurB1p => D2DIAGNOS(11+ppB1p,:); jsurB1p=ZERO
   jsurP1c => D2DIAGNOS(11+ppP1c,:); jsurP1c=ZERO
   jsurP1n => D2DIAGNOS(11+ppP1n,:); jsurP1n=ZERO
   jsurP1p => D2DIAGNOS(11+ppP1p,:); jsurP1p=ZERO
   jsurP1l => D2DIAGNOS(11+ppP1l,:); jsurP1l=ZERO
   jsurP1s => D2DIAGNOS(11+ppP1s,:); jsurP1s=ZERO
   jsurP2c => D2DIAGNOS(11+ppP2c,:); jsurP2c=ZERO
   jsurP2n => D2DIAGNOS(11+ppP2n,:); jsurP2n=ZERO
   jsurP2p => D2DIAGNOS(11+ppP2p,:); jsurP2p=ZERO
   jsurP2l => D2DIAGNOS(11+ppP2l,:); jsurP2l=ZERO
   jsurP3c => D2DIAGNOS(11+ppP3c,:); jsurP3c=ZERO
   jsurP3n => D2DIAGNOS(11+ppP3n,:); jsurP3n=ZERO
   jsurP3p => D2DIAGNOS(11+ppP3p,:); jsurP3p=ZERO
   jsurP3l => D2DIAGNOS(11+ppP3l,:); jsurP3l=ZERO
   jsurP4c => D2DIAGNOS(11+ppP4c,:); jsurP4c=ZERO
   jsurP4n => D2DIAGNOS(11+ppP4n,:); jsurP4n=ZERO
   jsurP4p => D2DIAGNOS(11+ppP4p,:); jsurP4p=ZERO
   jsurP4l => D2DIAGNOS(11+ppP4l,:); jsurP4l=ZERO
   jsurZ3c => D2DIAGNOS(11+ppZ3c,:); jsurZ3c=ZERO
   jsurZ3n => D2DIAGNOS(11+ppZ3n,:); jsurZ3n=ZERO
   jsurZ3p => D2DIAGNOS(11+ppZ3p,:); jsurZ3p=ZERO
   jsurZ4c => D2DIAGNOS(11+ppZ4c,:); jsurZ4c=ZERO
   jsurZ4n => D2DIAGNOS(11+ppZ4n,:); jsurZ4n=ZERO
   jsurZ4p => D2DIAGNOS(11+ppZ4p,:); jsurZ4p=ZERO
   jsurZ5c => D2DIAGNOS(11+ppZ5c,:); jsurZ5c=ZERO
   jsurZ5n => D2DIAGNOS(11+ppZ5n,:); jsurZ5n=ZERO
   jsurZ5p => D2DIAGNOS(11+ppZ5p,:); jsurZ5p=ZERO
   jsurZ6c => D2DIAGNOS(11+ppZ6c,:); jsurZ6c=ZERO
   jsurZ6n => D2DIAGNOS(11+ppZ6n,:); jsurZ6n=ZERO
   jsurZ6p => D2DIAGNOS(11+ppZ6p,:); jsurZ6p=ZERO
   jsurR1c => D2DIAGNOS(11+ppR1c,:); jsurR1c=ZERO
   jsurR1n => D2DIAGNOS(11+ppR1n,:); jsurR1n=ZERO
   jsurR1p => D2DIAGNOS(11+ppR1p,:); jsurR1p=ZERO
   jsurR2c => D2DIAGNOS(11+ppR2c,:); jsurR2c=ZERO
   jsurR3c => D2DIAGNOS(11+ppR3c,:); jsurR3c=ZERO
   jsurR6c => D2DIAGNOS(11+ppR6c,:); jsurR6c=ZERO
   jsurR6n => D2DIAGNOS(11+ppR6n,:); jsurR6n=ZERO
   jsurR6p => D2DIAGNOS(11+ppR6p,:); jsurR6p=ZERO
   jsurR6s => D2DIAGNOS(11+ppR6s,:); jsurR6s=ZERO
   jsurO3c => D2DIAGNOS(11+ppO3c,:); jsurO3c=ZERO
   jsurO3h => D2DIAGNOS(11+ppO3h,:); jsurO3h=ZERO
   jsurO5c => D2DIAGNOS(11+ppO5c,:); jsurO5c=ZERO

   PELBOTTOM => D2DIAGNOS(62+1:62+51,:); PELBOTTOM=ZERO
   jbotO2o => D2DIAGNOS(62+ppO2o,:); jbotO2o=ZERO
   jbotN1p => D2DIAGNOS(62+ppN1p,:); jbotN1p=ZERO
   jbotN3n => D2DIAGNOS(62+ppN3n,:); jbotN3n=ZERO
   jbotN4n => D2DIAGNOS(62+ppN4n,:); jbotN4n=ZERO
   jbotO4n => D2DIAGNOS(62+ppO4n,:); jbotO4n=ZERO
   jbotN5s => D2DIAGNOS(62+ppN5s,:); jbotN5s=ZERO
   jbotN6r => D2DIAGNOS(62+ppN6r,:); jbotN6r=ZERO
   jbotB1c => D2DIAGNOS(62+ppB1c,:); jbotB1c=ZERO
   jbotB1n => D2DIAGNOS(62+ppB1n,:); jbotB1n=ZERO
   jbotB1p => D2DIAGNOS(62+ppB1p,:); jbotB1p=ZERO
   jbotP1c => D2DIAGNOS(62+ppP1c,:); jbotP1c=ZERO
   jbotP1n => D2DIAGNOS(62+ppP1n,:); jbotP1n=ZERO
   jbotP1p => D2DIAGNOS(62+ppP1p,:); jbotP1p=ZERO
   jbotP1l => D2DIAGNOS(62+ppP1l,:); jbotP1l=ZERO
   jbotP1s => D2DIAGNOS(62+ppP1s,:); jbotP1s=ZERO
   jbotP2c => D2DIAGNOS(62+ppP2c,:); jbotP2c=ZERO
   jbotP2n => D2DIAGNOS(62+ppP2n,:); jbotP2n=ZERO
   jbotP2p => D2DIAGNOS(62+ppP2p,:); jbotP2p=ZERO
   jbotP2l => D2DIAGNOS(62+ppP2l,:); jbotP2l=ZERO
   jbotP3c => D2DIAGNOS(62+ppP3c,:); jbotP3c=ZERO
   jbotP3n => D2DIAGNOS(62+ppP3n,:); jbotP3n=ZERO
   jbotP3p => D2DIAGNOS(62+ppP3p,:); jbotP3p=ZERO
   jbotP3l => D2DIAGNOS(62+ppP3l,:); jbotP3l=ZERO
   jbotP4c => D2DIAGNOS(62+ppP4c,:); jbotP4c=ZERO
   jbotP4n => D2DIAGNOS(62+ppP4n,:); jbotP4n=ZERO
   jbotP4p => D2DIAGNOS(62+ppP4p,:); jbotP4p=ZERO
   jbotP4l => D2DIAGNOS(62+ppP4l,:); jbotP4l=ZERO
   jbotZ3c => D2DIAGNOS(62+ppZ3c,:); jbotZ3c=ZERO
   jbotZ3n => D2DIAGNOS(62+ppZ3n,:); jbotZ3n=ZERO
   jbotZ3p => D2DIAGNOS(62+ppZ3p,:); jbotZ3p=ZERO
   jbotZ4c => D2DIAGNOS(62+ppZ4c,:); jbotZ4c=ZERO
   jbotZ4n => D2DIAGNOS(62+ppZ4n,:); jbotZ4n=ZERO
   jbotZ4p => D2DIAGNOS(62+ppZ4p,:); jbotZ4p=ZERO
   jbotZ5c => D2DIAGNOS(62+ppZ5c,:); jbotZ5c=ZERO
   jbotZ5n => D2DIAGNOS(62+ppZ5n,:); jbotZ5n=ZERO
   jbotZ5p => D2DIAGNOS(62+ppZ5p,:); jbotZ5p=ZERO
   jbotZ6c => D2DIAGNOS(62+ppZ6c,:); jbotZ6c=ZERO
   jbotZ6n => D2DIAGNOS(62+ppZ6n,:); jbotZ6n=ZERO
   jbotZ6p => D2DIAGNOS(62+ppZ6p,:); jbotZ6p=ZERO
   jbotR1c => D2DIAGNOS(62+ppR1c,:); jbotR1c=ZERO
   jbotR1n => D2DIAGNOS(62+ppR1n,:); jbotR1n=ZERO
   jbotR1p => D2DIAGNOS(62+ppR1p,:); jbotR1p=ZERO
   jbotR2c => D2DIAGNOS(62+ppR2c,:); jbotR2c=ZERO
   jbotR3c => D2DIAGNOS(62+ppR3c,:); jbotR3c=ZERO
   jbotR6c => D2DIAGNOS(62+ppR6c,:); jbotR6c=ZERO
   jbotR6n => D2DIAGNOS(62+ppR6n,:); jbotR6n=ZERO
   jbotR6p => D2DIAGNOS(62+ppR6p,:); jbotR6p=ZERO
   jbotR6s => D2DIAGNOS(62+ppR6s,:); jbotR6s=ZERO
   jbotO3c => D2DIAGNOS(62+ppO3c,:); jbotO3c=ZERO
   jbotO3h => D2DIAGNOS(62+ppO3h,:); jbotO3h=ZERO
   jbotO5c => D2DIAGNOS(62+ppO5c,:); jbotO5c=ZERO

   PELRIVER => D2DIAGNOS(113+1:113+51,:); PELRIVER=ZERO
   jrivO2o => D2DIAGNOS(113+ppO2o,:); jrivO2o=ZERO
   jrivN1p => D2DIAGNOS(113+ppN1p,:); jrivN1p=ZERO
   jrivN3n => D2DIAGNOS(113+ppN3n,:); jrivN3n=ZERO
   jrivN4n => D2DIAGNOS(113+ppN4n,:); jrivN4n=ZERO
   jrivO4n => D2DIAGNOS(113+ppO4n,:); jrivO4n=ZERO
   jrivN5s => D2DIAGNOS(113+ppN5s,:); jrivN5s=ZERO
   jrivN6r => D2DIAGNOS(113+ppN6r,:); jrivN6r=ZERO
   jrivB1c => D2DIAGNOS(113+ppB1c,:); jrivB1c=ZERO
   jrivB1n => D2DIAGNOS(113+ppB1n,:); jrivB1n=ZERO
   jrivB1p => D2DIAGNOS(113+ppB1p,:); jrivB1p=ZERO
   jrivP1c => D2DIAGNOS(113+ppP1c,:); jrivP1c=ZERO
   jrivP1n => D2DIAGNOS(113+ppP1n,:); jrivP1n=ZERO
   jrivP1p => D2DIAGNOS(113+ppP1p,:); jrivP1p=ZERO
   jrivP1l => D2DIAGNOS(113+ppP1l,:); jrivP1l=ZERO
   jrivP1s => D2DIAGNOS(113+ppP1s,:); jrivP1s=ZERO
   jrivP2c => D2DIAGNOS(113+ppP2c,:); jrivP2c=ZERO
   jrivP2n => D2DIAGNOS(113+ppP2n,:); jrivP2n=ZERO
   jrivP2p => D2DIAGNOS(113+ppP2p,:); jrivP2p=ZERO
   jrivP2l => D2DIAGNOS(113+ppP2l,:); jrivP2l=ZERO
   jrivP3c => D2DIAGNOS(113+ppP3c,:); jrivP3c=ZERO
   jrivP3n => D2DIAGNOS(113+ppP3n,:); jrivP3n=ZERO
   jrivP3p => D2DIAGNOS(113+ppP3p,:); jrivP3p=ZERO
   jrivP3l => D2DIAGNOS(113+ppP3l,:); jrivP3l=ZERO
   jrivP4c => D2DIAGNOS(113+ppP4c,:); jrivP4c=ZERO
   jrivP4n => D2DIAGNOS(113+ppP4n,:); jrivP4n=ZERO
   jrivP4p => D2DIAGNOS(113+ppP4p,:); jrivP4p=ZERO
   jrivP4l => D2DIAGNOS(113+ppP4l,:); jrivP4l=ZERO
   jrivZ3c => D2DIAGNOS(113+ppZ3c,:); jrivZ3c=ZERO
   jrivZ3n => D2DIAGNOS(113+ppZ3n,:); jrivZ3n=ZERO
   jrivZ3p => D2DIAGNOS(113+ppZ3p,:); jrivZ3p=ZERO
   jrivZ4c => D2DIAGNOS(113+ppZ4c,:); jrivZ4c=ZERO
   jrivZ4n => D2DIAGNOS(113+ppZ4n,:); jrivZ4n=ZERO
   jrivZ4p => D2DIAGNOS(113+ppZ4p,:); jrivZ4p=ZERO
   jrivZ5c => D2DIAGNOS(113+ppZ5c,:); jrivZ5c=ZERO
   jrivZ5n => D2DIAGNOS(113+ppZ5n,:); jrivZ5n=ZERO
   jrivZ5p => D2DIAGNOS(113+ppZ5p,:); jrivZ5p=ZERO
   jrivZ6c => D2DIAGNOS(113+ppZ6c,:); jrivZ6c=ZERO
   jrivZ6n => D2DIAGNOS(113+ppZ6n,:); jrivZ6n=ZERO
   jrivZ6p => D2DIAGNOS(113+ppZ6p,:); jrivZ6p=ZERO
   jrivR1c => D2DIAGNOS(113+ppR1c,:); jrivR1c=ZERO
   jrivR1n => D2DIAGNOS(113+ppR1n,:); jrivR1n=ZERO
   jrivR1p => D2DIAGNOS(113+ppR1p,:); jrivR1p=ZERO
   jrivR2c => D2DIAGNOS(113+ppR2c,:); jrivR2c=ZERO
   jrivR3c => D2DIAGNOS(113+ppR3c,:); jrivR3c=ZERO
   jrivR6c => D2DIAGNOS(113+ppR6c,:); jrivR6c=ZERO
   jrivR6n => D2DIAGNOS(113+ppR6n,:); jrivR6n=ZERO
   jrivR6p => D2DIAGNOS(113+ppR6p,:); jrivR6p=ZERO
   jrivR6s => D2DIAGNOS(113+ppR6s,:); jrivR6s=ZERO
   jrivO3c => D2DIAGNOS(113+ppO3c,:); jrivO3c=ZERO
   jrivO3h => D2DIAGNOS(113+ppO3h,:); jrivO3h=ZERO
   jrivO5c => D2DIAGNOS(113+ppO5c,:); jrivO5c=ZERO


   allocate(BAC_ACT_FACT(1:NO_BOXES),stat=status); BAC_ACT_FACT = ZERO






#ifdef INCLUDE_SEAICE
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Start the allocation of other seaIce vairables which can be outputted 
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=







#endif

#ifdef INCLUDE_BEN
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Start the allocation of other benthic vairables which can be outputted 
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=







#endif

  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Start the allocation of Pelagic vars for calculation of combined fluxes for output
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

  !LEVEL1 "#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-==-"
  LEVEL1 "# Allocating Fluxes .."

  allocate( D3FLUX_MATRIX(1:NO_D3_BOX_STATES, 1:NO_D3_BOX_STATES),stat=status )
  allocate( D3FLUX_FUNC(1:NO_D3_BOX_FLUX, 1:NO_BOXES),stat=status )
  D3FLUX_FUNC = 0

  allocate( D3FLUX_MATRIX(ppP2c, ppO3c)%p( 1:1 ) )
  allocate( D3FLUX_MATRIX(ppO3c, ppP1c)%p( 1:1 ) )
  allocate( D3FLUX_MATRIX(ppO3c, ppP3c)%p( 1:1 ) )
  allocate( D3FLUX_MATRIX(ppP4c, ppO3c)%p( 1:1 ) )
  allocate( D3FLUX_MATRIX(ppP3c, ppO3c)%p( 1:1 ) )
  allocate( D3FLUX_MATRIX(ppP1c, ppO3c)%p( 1:1 ) )
  allocate( D3FLUX_MATRIX(ppO3c, ppP4c)%p( 1:1 ) )
  allocate( D3FLUX_MATRIX(ppO3c, ppP2c)%p( 1:1 ) )


  ! ruPPYc = P.c  <- O3c
  D3FLUX_MATRIX(ppO3c, ppP2c)%p(1)=+1
  D3FLUX_MATRIX(ppO3c, ppP4c)%p(1)=+1
  D3FLUX_MATRIX(ppO3c, ppP3c)%p(1)=+1
  D3FLUX_MATRIX(ppO3c, ppP1c)%p(1)=+1
  
  ! resPPYc = P.c -> O3c
  D3FLUX_MATRIX(ppP3c, ppO3c)%p(1)=+2
  D3FLUX_MATRIX(ppP1c, ppO3c)%p(1)=+2
  D3FLUX_MATRIX(ppP4c, ppO3c)%p(1)=+2
  D3FLUX_MATRIX(ppP2c, ppO3c)%p(1)=+2
  


#ifdef INCLUDE_SEAICE
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Start the allocation of Seaice vars for calculation of combined fluxes for output
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=



#endif

#ifdef INCLUDE_BEN
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Start the allocation of Benthic vars for calculation of combined fluxes for output
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=



#endif


  end subroutine AllocateMem

