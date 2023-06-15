#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/LocalisationSousMarine.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/LocalisationSousMarine.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/framework/system/rtcc/sys_rtcc.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_exceptions.c ../src/system_config/default/system_tasks.c ../src/app.c ../src/main.c ../src/bno055.c ../src/Mc32_I2cUtilCCS.c ../src/bno055_support.c ../src/Mc32_sdFatGest.c ../src/Mc32_serComm.c ../src/Mc32_PressAdc.c ../src/Mc32Debounce.c ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c ../../../../../framework/driver/spi/src/dynamic/drv_spi.c ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c ../../../../../framework/system/fs/src/dynamic/sys_fs.c ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c ../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../framework/system/tmr/src/sys_tmr.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/476726740/sys_rtcc.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/bno055.o ${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o ${OBJECTDIR}/_ext/1360937237/bno055_support.o ${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o ${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o ${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o ${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o ${OBJECTDIR}/_ext/1324760662/drv_spi.o ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o ${OBJECTDIR}/_ext/1750042194/sys_fs.o ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o ${OBJECTDIR}/_ext/1964723635/ff.o ${OBJECTDIR}/_ext/732200470/diskio.o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d ${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o.d ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d ${OBJECTDIR}/_ext/476726740/sys_rtcc.o.d ${OBJECTDIR}/_ext/1688732426/system_init.o.d ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/bno055.o.d ${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o.d ${OBJECTDIR}/_ext/1360937237/bno055_support.o.d ${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o.d ${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o.d ${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o.d ${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o.d ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d ${OBJECTDIR}/_ext/1324760662/drv_spi.o.d ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d ${OBJECTDIR}/_ext/1750042194/sys_fs.o.d ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d ${OBJECTDIR}/_ext/1964723635/ff.o.d ${OBJECTDIR}/_ext/732200470/diskio.o.d ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/476726740/sys_rtcc.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/bno055.o ${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o ${OBJECTDIR}/_ext/1360937237/bno055_support.o ${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o ${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o ${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o ${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o ${OBJECTDIR}/_ext/1324760662/drv_spi.o ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o ${OBJECTDIR}/_ext/1750042194/sys_fs.o ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o ${OBJECTDIR}/_ext/1964723635/ff.o ${OBJECTDIR}/_ext/732200470/diskio.o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o

# Source Files
SOURCEFILES=../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/framework/system/rtcc/sys_rtcc.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_exceptions.c ../src/system_config/default/system_tasks.c ../src/app.c ../src/main.c ../src/bno055.c ../src/Mc32_I2cUtilCCS.c ../src/bno055_support.c ../src/Mc32_sdFatGest.c ../src/Mc32_serComm.c ../src/Mc32_PressAdc.c ../src/Mc32Debounce.c ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c ../../../../../framework/driver/spi/src/dynamic/drv_spi.c ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c ../../../../../framework/system/fs/src/dynamic/sys_fs.c ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c ../../../../../framework/system/int/src/sys_int_pic32.c ../../../../../framework/system/tmr/src/sys_tmr.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/LocalisationSousMarine.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX130F256D
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c  .generated_files/bad091fc564f5da2225c0965f55e42183b4b2e11.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/977502197/drv_spi_api.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c  .generated_files/6eda96a4598bf6505fd09bda52950284fdd91247.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c  .generated_files/2dbed076cc1a6fce78cc9384d8ff7545991a952b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/eb81e3cfce656c708f48799ea6254d6063a986cf.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/8ea1cee86068ac34241447676324b2930e5890da.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/36ba12251112dfdbc0db346218e7edd0ac70969a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_static.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c  .generated_files/a77ac6331eb1a81e9a9a2c679e57fea551041f37.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/aef37e7a9816f4375149965498f676848318009d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/643f89f11ae5c3e4daaebff28a47602924f361e9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  .generated_files/acb16ea80b5d2e4af6c064b3de6e767c491c97cc.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/b129f7be6ad9b85b15116f4c071cd5bf065229d4.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  .generated_files/2e683cc5570c18319093e05d56e98205c7ec7b1c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/476726740/sys_rtcc.o: ../src/system_config/default/framework/system/rtcc/sys_rtcc.c  .generated_files/bd3b0f45902c1691e02820ba891719a42806c3ff.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/476726740" 
	@${RM} ${OBJECTDIR}/_ext/476726740/sys_rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/476726740/sys_rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/476726740/sys_rtcc.o.d" -o ${OBJECTDIR}/_ext/476726740/sys_rtcc.o ../src/system_config/default/framework/system/rtcc/sys_rtcc.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  .generated_files/a245b9700b4b400bdfc6d9b32f0fc6867242f52.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  .generated_files/5547975651963d012bb8cb7d4277c68c159f34c6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_exceptions.o: ../src/system_config/default/system_exceptions.c  .generated_files/7bee1a128e1d3653e4cb216c2366bb2066efc85b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ../src/system_config/default/system_exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  .generated_files/2b4142db74a663829f620cce57390a79f6029e0f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/7ab08201389889496f584cb98d1f14a45be86bc8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/273d35902d87d1e960f8759f514f8675ed49711a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/bno055.o: ../src/bno055.c  .generated_files/cc29ac4537cbad5a8102be3b1fdbf1a7fe6d6aa3.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bno055.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bno055.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/bno055.o.d" -o ${OBJECTDIR}/_ext/1360937237/bno055.o ../src/bno055.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o: ../src/Mc32_I2cUtilCCS.c  .generated_files/de7bbc13063cdf95ffa38d86a5b6217e5ae5d55d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o ../src/Mc32_I2cUtilCCS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/bno055_support.o: ../src/bno055_support.c  .generated_files/924b6e518d79ae6daf7e7b02245aa6c2df1ea8df.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bno055_support.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bno055_support.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/bno055_support.o.d" -o ${OBJECTDIR}/_ext/1360937237/bno055_support.o ../src/bno055_support.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o: ../src/Mc32_sdFatGest.c  .generated_files/ca9b6a0876e8c812a5d326eeb92b5df6d611ecc9.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o ../src/Mc32_sdFatGest.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o: ../src/Mc32_serComm.c  .generated_files/5516a69e9d3fd09062770d6edc1878bcbf530d84.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o ../src/Mc32_serComm.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o: ../src/Mc32_PressAdc.c  .generated_files/44c555591c3eea3b2316a49d9b2706fbcce09d10.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o ../src/Mc32_PressAdc.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o: ../src/Mc32Debounce.c  .generated_files/e01448629b7383403fc926bbf6ccc5aaf766869d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o ../src/Mc32Debounce.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1789358541/drv_sdcard.o: ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c  .generated_files/fc682f00f74234139c9808e464b1eab62d159187.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1789358541" 
	@${RM} ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d" -o ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1324760662/drv_spi.o: ../../../../../framework/driver/spi/src/dynamic/drv_spi.c  .generated_files/9abf0044dcd4f2da30ba91db73f16e5aecac3776.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1324760662" 
	@${RM} ${OBJECTDIR}/_ext/1324760662/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1324760662/drv_spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1324760662/drv_spi.o.d" -o ${OBJECTDIR}/_ext/1324760662/drv_spi.o ../../../../../framework/driver/spi/src/dynamic/drv_spi.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o: ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c  .generated_files/2de02c305d573570d2eb6bd8d33737dfc8d3bc4f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1385053818" 
	@${RM} ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d" -o ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1750042194/sys_fs.o: ../../../../../framework/system/fs/src/dynamic/sys_fs.c  .generated_files/f9d5dfb0fa6f43cf111a8dd9f848953256bc6073.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1750042194" 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1750042194/sys_fs.o.d" -o ${OBJECTDIR}/_ext/1750042194/sys_fs.o ../../../../../framework/system/fs/src/dynamic/sys_fs.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o: ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c  .generated_files/51bc5cc7e2e17834bcb2e9b20aa1b250d673ca24.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1750042194" 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d" -o ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1964723635/ff.o: ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c  .generated_files/a0959b2e385739565cf5bb213db735a3870a3f67.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1964723635" 
	@${RM} ${OBJECTDIR}/_ext/1964723635/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/1964723635/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1964723635/ff.o.d" -o ${OBJECTDIR}/_ext/1964723635/ff.o ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/732200470/diskio.o: ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c  .generated_files/5af2d522530a385b10ba178d9f29f37bfebb2c2f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/732200470" 
	@${RM} ${OBJECTDIR}/_ext/732200470/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/732200470/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/732200470/diskio.o.d" -o ${OBJECTDIR}/_ext/732200470/diskio.o ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o: ../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/23166953c57dd0da71a7109035e7ec9c4e117c95.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1042686532" 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2110151058/sys_tmr.o: ../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/ccbdde5cf876d7cc219c4f92019ce8961fe06164.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2110151058" 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o ../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c  .generated_files/b5c7e06b986dd4bd0ec35c99ac10aa820eee81b4.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/977502197/drv_spi_api.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c  .generated_files/e324358da0c402a774acc51e9629083975d179be.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c  .generated_files/57660de881a3960e401040251a0945758eeedad5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c  .generated_files/8527ef7d34d7a7421f0a2dec3e022cea4eed7d21.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_static.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o: ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c  .generated_files/b458f31d6c858de52d990e864d26533102f23ef1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1407244131" 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o.d" -o ${OBJECTDIR}/_ext/1407244131/drv_tmr_mapping.o ../src/system_config/default/framework/driver/tmr/src/drv_tmr_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/2353d65121236b3a4b2afd56e1e6c58174547634.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_static.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c  .generated_files/fd519571bdfc8f38610b74231122b80b107110af.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c  .generated_files/647128762bb6f2b75669a87dfaf50dc78c4e5cc1.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static_byte_model.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static_byte_model.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/1a074f6585d91105626e5017521f2d6e0a81aef8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  .generated_files/cc3acc05acb664709cddbcbcc5677e2fb3367451.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/d22f8b22b82966d00699f291e9445cd245fdced0.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  .generated_files/3e66599e2cdb32efae3b78b8a33fbf6d4a2575bd.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/476726740/sys_rtcc.o: ../src/system_config/default/framework/system/rtcc/sys_rtcc.c  .generated_files/9180b6443cc188b7eb05b931cd4623e243444a24.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/476726740" 
	@${RM} ${OBJECTDIR}/_ext/476726740/sys_rtcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/476726740/sys_rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/476726740/sys_rtcc.o.d" -o ${OBJECTDIR}/_ext/476726740/sys_rtcc.o ../src/system_config/default/framework/system/rtcc/sys_rtcc.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  .generated_files/291311204f8cefdccc4ea03ec4b82cf6f90f457a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  .generated_files/32a19aa4a82a53738114c60827104bf2f78a1f0f.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_exceptions.o: ../src/system_config/default/system_exceptions.c  .generated_files/d87e549717d619ddb6270d91b22d31144448a7ab.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_exceptions.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_exceptions.o ../src/system_config/default/system_exceptions.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  .generated_files/de0617659f5ef8bb58fc12c7aa128c743883be51.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/54dd5de33c6d08f7b39093786955a5de211cbf9d.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/103c966ad9ee8d8d2bcf75d9face3611e1c7aa5c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/bno055.o: ../src/bno055.c  .generated_files/be9595270312f1e422b88a4ffacfbb5231f7769e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bno055.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bno055.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/bno055.o.d" -o ${OBJECTDIR}/_ext/1360937237/bno055.o ../src/bno055.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o: ../src/Mc32_I2cUtilCCS.c  .generated_files/1b55c31196e0cd0f57c00e2e97cc7314e25ccd44.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32_I2cUtilCCS.o ../src/Mc32_I2cUtilCCS.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/bno055_support.o: ../src/bno055_support.c  .generated_files/ffe34f90f9a4e9775d0b7e4367065a14127e94b5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bno055_support.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/bno055_support.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/bno055_support.o.d" -o ${OBJECTDIR}/_ext/1360937237/bno055_support.o ../src/bno055_support.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o: ../src/Mc32_sdFatGest.c  .generated_files/cbedebde06147d7eec9bfcf1eef4ec3686c8248b.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32_sdFatGest.o ../src/Mc32_sdFatGest.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o: ../src/Mc32_serComm.c  .generated_files/4fc2893e9b2a63d45639e0b1021a7867ba2d62a6.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32_serComm.o ../src/Mc32_serComm.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o: ../src/Mc32_PressAdc.c  .generated_files/66095a4dec04f4c0b5a8de7e3ae1349ed1753684.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32_PressAdc.o ../src/Mc32_PressAdc.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o: ../src/Mc32Debounce.c  .generated_files/783659156f234934d5c7925f6ddbd8f3de8e987a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o.d" -o ${OBJECTDIR}/_ext/1360937237/Mc32Debounce.o ../src/Mc32Debounce.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1789358541/drv_sdcard.o: ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c  .generated_files/248460d94ed8a2eae71773d4c5ada23d6f30c325.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1789358541" 
	@${RM} ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1789358541/drv_sdcard.o.d" -o ${OBJECTDIR}/_ext/1789358541/drv_sdcard.o ../../../../../framework/driver/sdcard/src/dynamic/drv_sdcard.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1324760662/drv_spi.o: ../../../../../framework/driver/spi/src/dynamic/drv_spi.c  .generated_files/68c68f0c768ce31018a243641a1e8930df04045a.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1324760662" 
	@${RM} ${OBJECTDIR}/_ext/1324760662/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/1324760662/drv_spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1324760662/drv_spi.o.d" -o ${OBJECTDIR}/_ext/1324760662/drv_spi.o ../../../../../framework/driver/spi/src/dynamic/drv_spi.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o: ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c  .generated_files/b565a23647a9485d137cb2a65e5202449a0e8678.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1385053818" 
	@${RM} ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o.d" -o ${OBJECTDIR}/_ext/1385053818/drv_spi_sys_queue_fifo.o ../../../../../framework/driver/spi/src/drv_spi_sys_queue_fifo.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1750042194/sys_fs.o: ../../../../../framework/system/fs/src/dynamic/sys_fs.c  .generated_files/9eff0481408ab6b49da9981b847c96f867bb8f4c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1750042194" 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs.o.d 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1750042194/sys_fs.o.d" -o ${OBJECTDIR}/_ext/1750042194/sys_fs.o ../../../../../framework/system/fs/src/dynamic/sys_fs.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o: ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c  .generated_files/c85e0fabfdabca7a5a6a22c9525d2b2234fcf85e.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1750042194" 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o.d" -o ${OBJECTDIR}/_ext/1750042194/sys_fs_media_manager.o ../../../../../framework/system/fs/src/dynamic/sys_fs_media_manager.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1964723635/ff.o: ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c  .generated_files/39aefdb4977bd90d421d8ed981a1e5bd0105f6e5.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1964723635" 
	@${RM} ${OBJECTDIR}/_ext/1964723635/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/1964723635/ff.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1964723635/ff.o.d" -o ${OBJECTDIR}/_ext/1964723635/ff.o ../../../../../framework/system/fs/fat_fs/src/file_system/ff.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/732200470/diskio.o: ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c  .generated_files/bd157aa21a67b2a07f7256d281cf3b0c494523a8.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/732200470" 
	@${RM} ${OBJECTDIR}/_ext/732200470/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/732200470/diskio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/732200470/diskio.o.d" -o ${OBJECTDIR}/_ext/732200470/diskio.o ../../../../../framework/system/fs/fat_fs/src/hardware_access/diskio.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o: ../../../../../framework/system/int/src/sys_int_pic32.c  .generated_files/e07376490499629647ef592160ac555ea5f54423.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1042686532" 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1042686532/sys_int_pic32.o ../../../../../framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2110151058/sys_tmr.o: ../../../../../framework/system/tmr/src/sys_tmr.c  .generated_files/964990c00bd055283d0913391281f5372f69686c.flag .generated_files/9c38dd73fa47c8727ca672a3ac38932765b77050.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2110151058" 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/2110151058/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -I"../../../../framework" -I"../../../../../../../../../../microchip/harmony/v2_06/framework" -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../../../../../framework" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2110151058/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/2110151058/sys_tmr.o ../../../../../framework/system/tmr/src/sys_tmr.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/LocalisationSousMarine.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../bin/framework/peripheral/PIC32MX130F256D_peripherals.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/LocalisationSousMarine.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\bin\framework\peripheral\PIC32MX130F256D_peripherals.a      -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/LocalisationSousMarine.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../../bin/framework/peripheral/PIC32MX130F256D_peripherals.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/LocalisationSousMarine.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\..\bin\framework\peripheral\PIC32MX130F256D_peripherals.a      -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=0,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/LocalisationSousMarine.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
