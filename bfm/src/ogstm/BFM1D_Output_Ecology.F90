#include "cppdefs.h"
!-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
! MODEL
!	   BFM - Biogeochemical Flux Model verion 5.1
!
! SUBROUTINE
!   Ecology
!
! FILE
!   Ecology
!
! DESCRIPTION
!   %single%
!	This submodel calls all other submodels
!
!
!  
!   This file is generated directly from OpenSesame model code, using a code 
!   generator which transposes from the sesame meta language into F90.
!   F90 code generator written by P. Ruardij
!   structure of the code based on ideas of M. Vichi.
!
! AUTHORS
!   ERSEM team	
!
!
!
! CHANGE_LOG
!   !
!
! COPYING
!   Copyright (C) 2015 BFM System Team (bfm_st@lists.cmcc.it)
!   Copyright (C) 2004 P. Ruardij, the mfstep group, the ERSEM team 
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
subroutine BFM1D_Output_EcologyDynamics(BFM1D_tra, BFM1D_sed, local_BFM1D_dia,local_BFM0D_dia2D)

  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! The following global constants are used: RLEN

  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Modules (use of ONLY is strongly encouraged!)
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  use global_mem, ONLY:RLEN
  use mem

  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Implicit typing is never allowed
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  IMPLICIT NONE
  real(RLEN), intent(out) :: BFM1D_sed( iiPhytoPlankton , NO_BOXES )
  real(RLEN), intent(out) :: BFM1D_tra( NO_D3_BOX_STATES, NO_BOXES )
  INTEGER, parameter :: jptra_var = 100

  INTEGER, parameter :: jptra_flux = 2

      
  INTEGER, parameter :: jptra_dia = jptra_var + jptra_flux
  INTEGER, parameter :: jptra_dia_2d =  11

  real(RLEN), intent(out) :: local_BFM1D_dia(jptra_dia, NO_BOXES)
  real(RLEN), intent(out) :: local_BFM0D_dia2D(jptra_dia_2d) 

  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  ! Local Variables
  !-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  integer i
  integer ib

  DO ib=1,NO_BOXES
  DO i=1,NO_D3_BOX_STATES
     BFM1D_tra(i,ib) = D3SOURCE(i,ib)
!    LEVEL1 'BFM1D_Output_EcologyDynamics:D3SOURCE(',i,')', D3SOURCE(i,ib)
  END DO
  END DO

  ! Sinking Velocity for Phytoplankton
  DO ib=1,NO_BOXES
  BFM1D_sed(:, ib) = sediPPY(:,ib)
!    LEVEL1 'BFM1D_Output_EcologyDynamics:BFM1D_sed', sediPPY(:,ib)
  END DO

  local_BFM1D_dia = 0;

  local_BFM1D_dia(1,:) = D3DIAGNOS(ppETW,:)
  local_BFM1D_dia(2,:) = D3DIAGNOS(ppESW,:)
  local_BFM1D_dia(3,:) = D3DIAGNOS(ppERHO,:)
  local_BFM1D_dia(4,:) = D3DIAGNOS(ppEIR,:)
  local_BFM1D_dia(5,:) = D3DIAGNOS(ppESS,:)
  local_BFM1D_dia(6,:) = D3DIAGNOS(ppEPR,:)
  local_BFM1D_dia(7,:) = D3DIAGNOS(ppDepth,:)
  local_BFM1D_dia(8,:) = D3DIAGNOS(ppVolume,:)
  local_BFM1D_dia(9,:) = D3DIAGNOS(ppArea,:)
  local_BFM1D_dia(10,:) = D3DIAGNOS(ppDIC,:)
  local_BFM1D_dia(11,:) = D3DIAGNOS(ppCO2,:)
  local_BFM1D_dia(12,:) = D3DIAGNOS(pppCO2,:)
  local_BFM1D_dia(13,:) = D3DIAGNOS(ppHCO3,:)
  local_BFM1D_dia(14,:) = D3DIAGNOS(ppCO3,:)
  local_BFM1D_dia(15,:) = D3DIAGNOS(ppALK,:)
  local_BFM1D_dia(16,:) = D3DIAGNOS(pppH,:)
  local_BFM1D_dia(17,:) = D3DIAGNOS(ppOCalc,:)
  local_BFM1D_dia(18,:) = D3DIAGNOS(ppOArag,:)
  local_BFM1D_dia(19,:) = D3DIAGNOS(pptotpelc,:)
  local_BFM1D_dia(20,:) = D3DIAGNOS(pptotpeln,:)
  local_BFM1D_dia(21,:) = D3DIAGNOS(pptotpelp,:)
  local_BFM1D_dia(22,:) = D3DIAGNOS(pptotpels,:)
  local_BFM1D_dia(23,:) = D3DIAGNOS(ppcxoO2,:)
  local_BFM1D_dia(24,:) = D3DIAGNOS(ppeO2mO2,:)
  local_BFM1D_dia(25,:) = D3DIAGNOS(ppChla,:)
  local_BFM1D_dia(26,:) = D3DIAGNOS(ppffCO2,:)
  local_BFM1D_dia(27,:) = D3DIAGNOS(ppflPTN6r,:)
  local_BFM1D_dia(28,:) = D3DIAGNOS(ppflN3O4n,:)
  local_BFM1D_dia(29,:) = D3DIAGNOS(ppflN4N3n,:)
  local_BFM1D_dia(30,:) = D3DIAGNOS(ppsediR2,:)
  local_BFM1D_dia(31,:) = D3DIAGNOS(ppsediR6,:)
  local_BFM1D_dia(32,:) = D3DIAGNOS(ppsediO5,:)
  local_BFM1D_dia(33,:) = D3DIAGNOS(ppxEPS,:)
  local_BFM1D_dia(34,:) = D3DIAGNOS(ppABIO_eps,:)
! ***********************************  First Group Done 
  local_BFM1D_dia(35,:) = D3DIAGNOS(ppqpcPPY(iiP1),:)
  local_BFM1D_dia(36,:) = D3DIAGNOS(ppqpcPPY(iiP2),:)
  local_BFM1D_dia(37,:) = D3DIAGNOS(ppqpcPPY(iiP3),:)
  local_BFM1D_dia(38,:) = D3DIAGNOS(ppqpcPPY(iiP4),:)
  local_BFM1D_dia(39,:) = D3DIAGNOS(ppqncPPY(iiP1),:)
  local_BFM1D_dia(40,:) = D3DIAGNOS(ppqncPPY(iiP2),:)
  local_BFM1D_dia(41,:) = D3DIAGNOS(ppqncPPY(iiP3),:)
  local_BFM1D_dia(42,:) = D3DIAGNOS(ppqncPPY(iiP4),:)
  local_BFM1D_dia(43,:) = D3DIAGNOS(ppqscPPY(iiP1),:)
  local_BFM1D_dia(44,:) = D3DIAGNOS(ppqscPPY(iiP2),:)
  local_BFM1D_dia(45,:) = D3DIAGNOS(ppqscPPY(iiP3),:)
  local_BFM1D_dia(46,:) = D3DIAGNOS(ppqscPPY(iiP4),:)
  local_BFM1D_dia(47,:) = D3DIAGNOS(ppqlcPPY(iiP1),:)
  local_BFM1D_dia(48,:) = D3DIAGNOS(ppqlcPPY(iiP2),:)
  local_BFM1D_dia(49,:) = D3DIAGNOS(ppqlcPPY(iiP3),:)
  local_BFM1D_dia(50,:) = D3DIAGNOS(ppqlcPPY(iiP4),:)
  local_BFM1D_dia(51,:) = D3DIAGNOS(ppqccPPY(iiP1),:)
  local_BFM1D_dia(52,:) = D3DIAGNOS(ppqccPPY(iiP2),:)
  local_BFM1D_dia(53,:) = D3DIAGNOS(ppqccPPY(iiP3),:)
  local_BFM1D_dia(54,:) = D3DIAGNOS(ppqccPPY(iiP4),:)
  local_BFM1D_dia(55,:) = D3DIAGNOS(ppBFM1D_exR2ac(iiP1),:)
  local_BFM1D_dia(56,:) = D3DIAGNOS(ppBFM1D_exR2ac(iiP2),:)
  local_BFM1D_dia(57,:) = D3DIAGNOS(ppBFM1D_exR2ac(iiP3),:)
  local_BFM1D_dia(58,:) = D3DIAGNOS(ppBFM1D_exR2ac(iiP4),:)
  local_BFM1D_dia(59,:) = D3DIAGNOS(ppqpcMEZ(iiZ3),:)
  local_BFM1D_dia(60,:) = D3DIAGNOS(ppqpcMEZ(iiZ4),:)
  local_BFM1D_dia(61,:) = D3DIAGNOS(ppqncMEZ(iiZ3),:)
  local_BFM1D_dia(62,:) = D3DIAGNOS(ppqncMEZ(iiZ4),:)
  local_BFM1D_dia(63,:) = D3DIAGNOS(ppqpcMIZ(iiZ5),:)
  local_BFM1D_dia(64,:) = D3DIAGNOS(ppqpcMIZ(iiZ6),:)
  local_BFM1D_dia(65,:) = D3DIAGNOS(ppqncMIZ(iiZ5),:)
  local_BFM1D_dia(66,:) = D3DIAGNOS(ppqncMIZ(iiZ6),:)
  local_BFM1D_dia(67,:) = D3DIAGNOS(ppqpcOMT(iiR1),:)
  local_BFM1D_dia(68,:) = D3DIAGNOS(ppqpcOMT(iiR2),:)
  local_BFM1D_dia(69,:) = D3DIAGNOS(ppqpcOMT(iiR3),:)
  local_BFM1D_dia(70,:) = D3DIAGNOS(ppqpcOMT(iiR6),:)
  local_BFM1D_dia(71,:) = D3DIAGNOS(ppqncOMT(iiR1),:)
  local_BFM1D_dia(72,:) = D3DIAGNOS(ppqncOMT(iiR2),:)
  local_BFM1D_dia(73,:) = D3DIAGNOS(ppqncOMT(iiR3),:)
  local_BFM1D_dia(74,:) = D3DIAGNOS(ppqncOMT(iiR6),:)
  local_BFM1D_dia(75,:) = D3DIAGNOS(ppqscOMT(iiR1),:)
  local_BFM1D_dia(76,:) = D3DIAGNOS(ppqscOMT(iiR2),:)
  local_BFM1D_dia(77,:) = D3DIAGNOS(ppqscOMT(iiR3),:)
  local_BFM1D_dia(78,:) = D3DIAGNOS(ppqscOMT(iiR6),:)
  local_BFM1D_dia(79,:) = D3DIAGNOS(ppqpcPBA(iiB1),:)
  local_BFM1D_dia(80,:) = D3DIAGNOS(ppqncPBA(iiB1),:)
  local_BFM1D_dia(81,:) = D3DIAGNOS(ppsediPPY(iiP1),:)
  local_BFM1D_dia(82,:) = D3DIAGNOS(ppsediPPY(iiP2),:)
  local_BFM1D_dia(83,:) = D3DIAGNOS(ppsediPPY(iiP3),:)
  local_BFM1D_dia(84,:) = D3DIAGNOS(ppsediPPY(iiP4),:)
  local_BFM1D_dia(85,:) = D3DIAGNOS(ppsediMIZ(iiZ5),:)
  local_BFM1D_dia(86,:) = D3DIAGNOS(ppsediMIZ(iiZ6),:)
  local_BFM1D_dia(87,:) = D3DIAGNOS(ppsediMEZ(iiZ3),:)
  local_BFM1D_dia(88,:) = D3DIAGNOS(ppsediMEZ(iiZ4),:)
  local_BFM1D_dia(89,:) = D3DIAGNOS(ppsunPPY(iiP1),:)
  local_BFM1D_dia(90,:) = D3DIAGNOS(ppsunPPY(iiP2),:)
  local_BFM1D_dia(91,:) = D3DIAGNOS(ppsunPPY(iiP3),:)
  local_BFM1D_dia(92,:) = D3DIAGNOS(ppsunPPY(iiP4),:)
  local_BFM1D_dia(93,:) = D3DIAGNOS(ppeiPPY(iiP1),:)
  local_BFM1D_dia(94,:) = D3DIAGNOS(ppeiPPY(iiP2),:)
  local_BFM1D_dia(95,:) = D3DIAGNOS(ppeiPPY(iiP3),:)
  local_BFM1D_dia(96,:) = D3DIAGNOS(ppeiPPY(iiP4),:)
  local_BFM1D_dia(97,:) = D3DIAGNOS(ppELiPPY(iiP1),:)
  local_BFM1D_dia(98,:) = D3DIAGNOS(ppELiPPY(iiP2),:)
  local_BFM1D_dia(99,:) = D3DIAGNOS(ppELiPPY(iiP3),:)
  local_BFM1D_dia(100,:) = D3DIAGNOS(ppELiPPY(iiP4),:)
! ***********************************  2nd Group Done
  local_BFM1D_dia(101,:) = D3FLUX_FUNC(ppruPPYc,:)
  local_BFM1D_dia(102,:) = D3FLUX_FUNC(ppresPPYc,:)
! ***********************************  3rd Group Done

  local_BFM0D_dia2d = 0;

  local_BFM0D_dia2d(1) = D2DIAGNOS(ppEPCO2air,1)
  local_BFM0D_dia2d(2) = D2DIAGNOS(ppCO2airflux,1)
  local_BFM0D_dia2d(3) = D2DIAGNOS(ppArea2d,1)
  local_BFM0D_dia2d(4) = D2DIAGNOS(ppThereIsLight,1)
  local_BFM0D_dia2d(5) = D2DIAGNOS(ppSUNQ,1)
  local_BFM0D_dia2d(6) = D2DIAGNOS(ppEWIND,1)
  local_BFM0D_dia2d(7) = D2DIAGNOS(pptotsysc,1)
  local_BFM0D_dia2d(8) = D2DIAGNOS(pptotsysn,1)
  local_BFM0D_dia2d(9) = D2DIAGNOS(pptotsysp,1)
  local_BFM0D_dia2d(10) = D2DIAGNOS(pptotsyss,1)
  local_BFM0D_dia2d(11) = D2DIAGNOS(ppEICE,1)
! ***********************************  First Group Done 
! ***********************************  2nd Group Done
! ***********************************  3rd Group Done



end subroutine BFM1D_Output_EcologyDynamics


