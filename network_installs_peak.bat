:: *************** artis-machinae.github.io *****************************
:: *************** written in 2002, updated and used 2019 *****************************************************************************************************
::
:: *************** note: This was custom written for a very specific setup and requirements,
:: ***************       for use with department employee supervision.
:: ***************       Network locations, directories, etc. have been anonymized.
:: ***************       mileage may vary. no guarantees, warranties, support, etc. use at your own risk. *****************************************************
:: ************************************************************************************************************************************************************
:: BSD 3-Clause License
:: 
:: Copyright (c) 2019, artis-machinae
:: 
:: Redistribution and use in source and binary forms, with or without
:: modification, are permitted provided that the following conditions are met:
:: 
:: 1. Redistributions of source code must retain the above copyright notice, this
::    list of conditions and the following disclaimer.
:: 
:: 2. Redistributions in binary form must reproduce the above copyright notice,
::    this list of conditions and the following disclaimer in the documentation
::    and/or other materials provided with the distribution.
:: 
:: 3. Neither the name of the copyright holder nor the names of its
::    contributors may be used to endorse or promote products derived from
::    this software without specific prior written permission.
:: 
:: THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
:: AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
:: IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
:: DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
:: FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
:: DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
:: SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
:: CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
:: OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
:: OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

@ECHO OFF
ECHO Installing additional applications. Please wait .................................
ECHO.
ECHO ..................................

net config server /autodisconnect:180

:MAPDRIVE1:

IF NOT EXIST "P:\*" ping 10.xxx.xxx.48 | net use p: \\network\apps\SI_Apps

IF ERRORLEVEL 1 GOTO MAPDRIVE1

:MAPDRIVE2:
IF NOT EXIST "Q:\*" ping 10.xxx.xxx.125 | net use q: \\us_network\software\Corp_Apps

IF ERRORLEVEL 1 GOTO MAPDRIVE2

:MAPDRIVE3:
IF NOT EXIST "Y:\*" ping 10.xxx.xxx.114 | net use y: \\local_net\appsInstall$

IF ERRORLEVEL 1 GOTO MAPDRIVE3

IF ERRORLEVEL 0 ECHO Network connections established

ECHO Please wait ..........


:: *******************************
START "" /d "P:\Peak309" /wait "Peak309.exe"


:: **************** Fonts package for Peak ************
START "" /d "P:\PeakFonts" /wait "PeakFonts.msi"


:: **************** Sapphire Install ******************
:: (previous location)IF NOT EXIST "C:\Program Files (x86)\Peak\Global Sapphire\" START "" /d "Q:\GlobalSapphire" /wait "GlbSph1555.EXE"
IF NOT EXIST "C:\Program Files (x86)\Peak\Global Sapphire\" START "" /d "Y:\" /wait "GlobalSapphire.application"


:: **************** PAS ***********************

IF NOT EXIST "C:\Program Files (x86)\PAS GUI*" START "" /d "Q:\The_PAS\App_Pkgs\PAS_LITE\PASGUI_Installer_ALL\MSI_ONLY" /wait "PASGUI LITE v7.40_P10.msi"


:: **************** PAS update *********************
IF EXIST C:\Program Files (x86)\PAS GUI*" START "" /d "Q:\The_PAS\App_Pkgs\PAS_LITE\PASGUI_Installer_ALL\MSI_ONLY\Config_updater" /wait "config_files_updater.EXE"


:: **************** KAP Agent ********************
IF NOT EXIST "C:\Program Files (x86)\KAP\KAPAgent" START "" /d "Q:\The_PAS\KAP_Agent\71145" /wait "peak_KAP_Agent_72p26_PAS_MyQuote_Desktop_Prod_71145.msi"

IF EXIST "P:\*" net use p: /delete /y
IF EXIST "Q:\*" net use q: /delete /y
IF EXIST "Y:\*" net use q: /delete /y

:: **************** end *******************************
cls


:: **************** Sapphire update for SMB *******************
Dism /online /Enable-Feature /FeatureName:"SMB1Protocol" -All

cls

ECHO ..............
ECHO.
ECHO Programs have been successfully installed.
ECHO.
ECHO.
ECHO Press any key to exit.
PAUSE >nul
