/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "app.h"
#include "bno055.h"
#include "bno055_support.h"
#include "Mc32_I2cUtilCCS.h"
#include "Mc32_serComm.h"
#include "Mc32_sdFatGest.h"
#include "Mc32_PressAdc.h"
#include "Mc32Debounce.h"
#include <stdio.h>

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************
/* Switch descriptor */
S_SwitchDescriptor switchDescr;
// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/

APP_DATA appData;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************
void MainTimer_callback(){
    /* Increment delay timer */
    appData.TmrCnt ++;
}

void DisplayTimer_callback()
{
    /* Increment utility timers */
    appData.TmrDisplay ++;
    appData.TmrMeas ++;
    appData.TmrTickFlag = true;
    /* If button is pressed, count pressed time */
    if(appData.flagCountBtnPressed){
        appData.TmrBtnPressed++;
    }
     /* Do debounce every 10 ms */
     DoDebounce(&switchDescr, ButtonMFStateGet());
    /* Start a measure set each 90ms */        
    if ( ( appData.TmrMeas % 9 ) == 0)
        appData.measTodoFlag = true;
}
/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************


/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;
    /* Init all counters and flags */
    appData.mainTmrCnt = 0;
    appData.TmrCnt = 0;
    appData.TmrTickFlag = false; 
    appData.TmrDisplay = 0;
    appData.measTodoFlag = false;
    appData.flagCountBtnPressed = false;
    appData.TmrBtnPressed = 0;
        
    /* Hold the device on */
    PwrHoldOn();
    /* Peripherals init */
    DRV_TMR0_Start();
    DRV_TMR1_Start();
    i2c_init(1);
    Press_InitADC();
    
    /* System ON display */
    LED_BOn();
    BNO055_delay_msek(500);
    LED_BOff();
    
    /* Reset IMU */
    RstImuOff();
    BNO055_delay_msek(100);
    RstImuOn();
    BNO055_delay_msek(100);
    
    /* Demuliplexer config */
    DemulCBOff();
    DemulCCOn();
    
    /* Enable 5V regulator */
    EN_5VOn();
    
    
}


/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
    /* Local bno055 data */
    s_bno055_data bno055_local_data;  
    static bool Hold = false;
     /* Check the application's current state. */
    switch ( appData.state )
    {
        /* Application's initial state. */
        case APP_STATE_INIT:
        {
            // Init delay
            BNO055_delay_msek(500);
            // Init and Measure set
            bno055_init_readout();
            /* go to service task */
            appData.state = APP_STATE_LOGGING;
            /* Init ltime counter */
            appData.ltime = 0;
            break;
        }

        case APP_STATE_LOGGING:
        {    
            /* Display period */
            if(appData.TmrDisplay >= 320)
                appData.TmrDisplay = 0;
            // --- Display LED ---
            if((appData.TmrDisplay <= 1))
                LED_GOn();
            else
                LED_GOff();

            if((appData.measTodoFlag == true )&&(sd_getState() == APP_IDLE))
            {
                /* BNO055 Read all important info routine */
                bno055_local_data.comres = bno055_read_routine(&bno055_local_data);
                /* Delta time */
                bno055_local_data.d_time = appData.TmrMeas - appData.ltime;
                /* Pressure measure */
                bno055_local_data.pressure = Press_readPressure();
                /* Display value via UART */
                //serDisplayValues(&bno055_local_data);
                /* Write value to sdCard */
                sd_BNO_scheduleWrite(&bno055_local_data);
                /* Reset measure flag */
                if(bno055_local_data.flagImportantMeas == FLAG_MEAS_ON){
                    /* Rest important measure flag */
                    bno055_local_data.flagImportantMeas = FLAG_MEAS_OFF;
                    LED_BOff();
                }
                /* Reset measure flag */
                appData.measTodoFlag = false;
                /* Update last time counter */
                appData.ltime = appData.TmrMeas;
            }
            else
            {
                /* No comm, so no error */
                bno055_local_data.comres = 0;
            }
            
            /* If error detected : error LED */
            if((bno055_local_data.comres != 0)||(sd_getState() == APP_MOUNT_DISK))
                LED_ROn();
            else
                LED_ROff();
            
            /* --- SD FAT routine --- */
            sd_fat_task();
               
            /* Button management : if rising edge detected */
            if(((ButtonMFStateGet()))||(Hold == true))
            {
                /* Hold until falling edge */
                Hold = true;
                /* Start counting pressed time */
                appData.flagCountBtnPressed = true;
                /* If falling edge detected */
                if (ButtonMFStateGet() == 0)
                {
                    /* Reset flag and switchdescr */
                    appData.flagCountBtnPressed = false;
                    DebounceClearReleased(&switchDescr);
                    /* If pressed time less than power off time */
                    if(appData.TmrBtnPressed <= TIME_POWER_OFF){
                        bno055_local_data.flagImportantMeas = FLAG_MEAS_ON;
                        LED_BOn();
                    }
                    else{
                        /* Power off the system */
                        appData.state = APP_STATE_SHUTDOWN;
                    }
                    appData.TmrBtnPressed = 0;
                    Hold = false;
                }
            }
            
           break;
        }
        case APP_STATE_SHUTDOWN:
        {
            /* Display shutting off mode */
            LED_BOff();
            LED_GOff();
            LED_ROn();
            
            /* Wait until SD availaible */
            while(sd_getState() != APP_IDLE){
                /* SD FAT routine */
                sd_fat_task();
            }
            /* Unmount disk */
            sd_setState(APP_UNMOUNT_DISK);
            /* Wait until unmounted*/
            while(sd_getState() != APP_IDLE){
                sd_fat_task();
            }
            
            /* turn off the device */
            PwrHoldOff();
            
            break;
        }
        
        /* TODO: implement your application state machine.*/
        

        /* The default state should never be executed. */
        default:
        {
            /* TODO: Handle error in application's state machine. */
            break;
        }
    }
}

void App_resetMeasFlag( void )
{
    appData.measTodoFlag = false;
}
 

/*******************************************************************************
 End of File
 */
