// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include "system_config.h"
#include "system/rtcc/sys_rtcc_pic32m.h"
#include "peripheral/devcon/plib_devcon.h"

// *****************************************************************************
/* helper union for converting to and from BCD Date
  Each nibble:
    [year10][year1][mnth10][mnth1][day10][day1][DOTW] (Day Of The Week).

  Remarks:
    Fill this in manually: date.year10 = 1; or use helper function.
*/

union BCDDateConversion
{
    SYS_RTCC_BCD_DATE bcd;
    struct
    {
        uint32_t DOTW:8;
        uint32_t day1:4;
        uint32_t day10:4;
        uint32_t mnth1:4;
        uint32_t mnth10 :4;
        uint32_t year1:4;
        uint32_t year10:4;
    } parts;
};

// *****************************************************************************
/* helper union for converting to and from BCD time */
/* 4bits each: [hour10][hour1][mins10][mins1][secs10][secs1] */

union BCDConversion
{
    SYS_RTCC_BCD_TIME bcd;
    struct
    {
		uint32_t padding:8;
        uint32_t secs1 :4;
        uint32_t secs10:4;
        uint32_t mins1 :4;
        uint32_t mins10:4;
        uint32_t hour1 :4;
        uint32_t hour10:4;
    } parts;
};

// *****************************************************************************
/* Real Time Clock System Service Object
*/
static SYS_RTCC_OBJECT SysRtccObject;

// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_Start( void )

  Summary:
    Starts the Real Time Clock Calendar.

  Description:
    The function starts the RTCC.

  Precondition:
    None

  Parameters:
    None.

  Returns:
    SYS_RTCC_STATUS type (see above).

  Remarks:
     If the RTCC was running it continues.
*/

SYS_RTCC_STATUS SYS_RTCC_Start( void )
{
    PLIB_RTCC_Enable(RTCC_PLIB_ID);

    return SYS_RTCC_STATUS_OK;
}

// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_Stop( void )

  Summary:
    Stops the Real Time Clock Calendar.

  Description:
    The function stops the RTCC.

  Precondition:
    None.

  Parameters:
    None.

  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_Stop ( void )
{
    PLIB_RTCC_Disable(RTCC_PLIB_ID);

    return SYS_RTCC_STATUS_OK;
}

/*
void DRV_RTCC_ClockOutput ( void )
{
    PLIB_RTCC_ClockOutputEnable(RTCC_PLIB_ID);
}
*/

static __inline__ bool __attribute__((always_inline)) _SYS_RTCC_ObjectCheck ( SYS_MODULE_OBJ object )
{
    // basic sanity check we're the right object
    return (SYS_RTCC_OBJECT*)object == &SysRtccObject;
}


// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_TimeSet(SYS_RTCC_BCD_TIME  time, bool start)

  Summary:
    Sets the Real Time Clock Calendar time.

  Description:
    The function sets the time for the RTCC.

  Precondition:
    None.

  Parameters:
    time    time is in BCD format - see description of SYS_RTCC_BCD_TIME

    start   if true, the RTCC is also started

  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_TimeSet ( SYS_RTCC_BCD_TIME time, bool start )
{
    PLIB_RTCC_RTCTimeSet(RTCC_PLIB_ID, time);

    if (start)
    {
        SYS_RTCC_Start();
    }

    return SYS_RTCC_STATUS_OK;
}


// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_TimeGet(SYS_RTCC_BCD_TIME  *time)

  Summary:
    Gets the Real Time Clock Calendar time.

  Description:
    The function gets the time from the RTCC.

  Precondition:
    None.

  Parameters:
    *time    a pointer to a time type - see description of SYS_RTCC_BCD_TIME


  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_TimeGet ( SYS_RTCC_BCD_TIME *time )
{
    *time = (SYS_RTCC_BCD_TIME)PLIB_RTCC_RTCTimeGet(RTCC_PLIB_ID);

    return SYS_RTCC_STATUS_OK;
}



// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_DateSet(SYS_RTCC_BCD_DATE  date)

  Summary:
    Sets the Real Time Clock Calendar date.

  Description:
    The function sets the date for the RTCC in BCD format.

  Precondition:
    None.

  Parameters:
    date    date is in BCD format - see description of SYS_RTCC_BCD_DATE

  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_DateSet ( SYS_RTCC_BCD_DATE date )
{
    PLIB_RTCC_RTCDateSet(RTCC_PLIB_ID, date);

    return SYS_RTCC_STATUS_OK;
}


// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_DateGet(SYS_RTCC_BCD_DATE *date)

  Summary:
    Gets the Real Time Clock Calendar date.

  Description:
    The function gets the date from the RTCC in BCD format.

  Precondition:
    None.

  Parameters:
    *date    a pointer to a date type - see description of SYS_RTCC_BCD_DATE

  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_DateGet ( SYS_RTCC_BCD_DATE *date )
{
    *date = (SYS_RTCC_BCD_DATE)PLIB_RTCC_RTCDateGet(RTCC_PLIB_ID);

    return SYS_RTCC_STATUS_OK;
}


// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_AlarmEnable( void )

  Summary:
    Enables RTCC alarm.

  Description:
    The function enables the alarm in the RTCC.

  Precondition:
    None.

  Parameters:
    None.

  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_AlarmEnable ( void )
{
    PLIB_RTCC_AlarmEnable(RTCC_PLIB_ID);

    return SYS_RTCC_STATUS_OK;
}


// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_AlarmDisable( void )

  Summary:
    Disables the RTCC alarm.

  Description:
    The function disables the alarm in the RTCC.

  Precondition:
    None.

  Parameters:
    None.

  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_AlarmDisable ( void )
{
    PLIB_RTCC_AlarmDisable(RTCC_PLIB_ID);

    return SYS_RTCC_STATUS_OK;
}



// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_AlarmTimeSet(SYS_RTCC_BCD_TIME  time, bool enable)

  Summary:
    Sets the Real Time Clock Calendar alarm time.

  Description:
    The function sets the time for the RTCC alarm.

  Precondition:
    None.

  Parameters:
    time    time is in BCD format - see description of SYS_RTCC_BCD_TIME

    enable   if true, the alarm is enabled

  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_AlarmTimeSet ( SYS_RTCC_BCD_TIME time, bool enable )
{
    PLIB_RTCC_AlarmTimeSet(RTCC_PLIB_ID, time);

    if (enable)
    {
        SYS_RTCC_AlarmEnable();
    }

    return SYS_RTCC_STATUS_OK;
}



// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_AlarmTimeGet(SYS_RTCC_BCD_TIME *time)

  Summary:
    Gets the Real Time Clock Calendar alarm time.

  Description:
    The function gets the time from the RTCC alarm.

  Precondition:
    None.

  Parameters:
    *time    a pointer to the time type - see description of SYS_RTCC_BCD_TIME

  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_AlarmTimeGet(SYS_RTCC_BCD_TIME *time)
{
    *time = (SYS_RTCC_BCD_TIME)PLIB_RTCC_AlarmTimeGet(RTCC_PLIB_ID);

    return SYS_RTCC_STATUS_OK;
}



// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_AlarmDateSet(SYS_RTCC_BCD_DATE date)

  Summary:
    Sets the Real Time Clock Calendar alarm date.

  Description:
    The function sets the time for the RTCC alarm. The date for the alarm
    does not include the year. If the year is included it will be ignored.
  Precondition:
    None.

  Parameters:
    date    date is in BCD format - see description of SYS_RTCC_BCD_DATE

  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_AlarmDateSet ( SYS_RTCC_BCD_DATE date )
{
    PLIB_RTCC_AlarmDateSet(RTCC_PLIB_ID, date);
    return SYS_RTCC_STATUS_OK;
}



// *****************************************************************************
/* Function:
  SYS_RTCC_STATUS SYS_RTCC_AlarmDateGet(SYS_RTCC_BCD_DATE *date)

  Summary:
    Gets the Real Time Clock Calendar alarm date.

  Description:
    The function gets the time for the RTCC alarm.

  Precondition:
    None.

  Parameters:
    *date    pointer to date type - see description of SYS_RTCC_BCD_DATE

  Returns:
    SYS_RTCC_STATUS type (see above).
*/

SYS_RTCC_STATUS SYS_RTCC_AlarmDateGet ( SYS_RTCC_BCD_DATE *date )
{
    *date = (SYS_RTCC_BCD_DATE)(PLIB_RTCC_AlarmDateGet(RTCC_PLIB_ID));

    return SYS_RTCC_STATUS_OK;
}



// *****************************************************************************
/* Function:
  SYS_RTCC_ALARM_HANDLE SYS_RTCC_AlarmRegister(SYS_RTCC_ALARM_CALLBACK *callback,
    uintptr_t context );

  Summary:
    Sets the callback function for an alarm.

  Description:
    This function sets the callback function that will be called when the RTCC
    alarm is reached.

  Precondition:
    None.

  Parameters:
    *callback   - a pointer to the function to be called when alarm is reached.
                  Use NULL to Un Register the alarm callback

    context     - a pointer to user defined data to be used when the callback
                  function is called. NULL can be passed in if no data needed.

  Returns:
    SYS_RTCC_ALARM_HANDLE type.
*/

SYS_RTCC_ALARM_HANDLE SYS_RTCC_AlarmRegister ( SYS_RTCC_ALARM_CALLBACK callback, uintptr_t context )
{
    SYS_RTCC_ALARM_HANDLE funcReturn;

    /* - Un-register callback if NULL */
    if (callback == NULL)
    {
        SysRtccObject.callback = NULL;
        SysRtccObject.context = (uintptr_t) NULL;
        SysRtccObject.status = SYS_RTCC_STATUS_OK;
        funcReturn = SYS_RTCC_ALARM_HANDLE_INVALID;
    }
    /* - Save callback and context in local memory */
    SysRtccObject.callback = callback;
    SysRtccObject.context = context;
    SysRtccObject.status = SYS_RTCC_STATUS_OK;
    SysRtccObject.handle = (SYS_RTCC_ALARM_HANDLE)&SysRtccObject;
    funcReturn =  (SYS_RTCC_ALARM_HANDLE)&SysRtccObject;

    return funcReturn;
}

// *****************************************************************************
/* Function:
   SYS_MODULE_OBJ SYS_TMR_Initialize ( void )

  Summary:
    Initializes hardware and data for the instance of the RTCC module and opens
    the specific module instance.

  Description:
    This function initializes hardware for the instance of the RTCC module,
    using the specified hardware initialization data. It also initializes any
    internal data structures.

  Parameters:

    init    - Pointer to a data structure containing any data necessary
            to initialize the driver. This pointer may be null if no
            data is required because static overrides have been
            provided.

  Returns:
    void
*/

SYS_MODULE_OBJ SYS_RTCC_Initialize ( void )
{
    PLIB_DEVCON_SystemUnlock(DEVCON_ID_0); /* Unlock System */

    /* Initialize RTCC */
    PLIB_RTCC_WriteEnable(RTCC_PLIB_ID); /* Enable writes to RTCC */
    PLIB_RTCC_Disable(RTCC_PLIB_ID); /* Disable clock to RTCC */

    /* wait for clock to stop. Block too long? */
    while (PLIB_RTCC_ClockRunningStatus(RTCC_PLIB_ID)); /* clock disabled? */

    /* initialize the time, date and alarm */
    PLIB_RTCC_RTCTimeSet(RTCC_PLIB_ID, 0x23595000); /* Set RTCC time */
    PLIB_RTCC_RTCDateSet(RTCC_PLIB_ID, 0x15010100); /* Set RTCC date */

    PLIB_RTCC_AlarmDisable(RTCC_PLIB_ID); /* Disable alarm */
    while (PLIB_RTCC_AlarmSyncStatusGet(RTCC_PLIB_ID))  ; /* Wait for disable */
    PLIB_RTCC_AlarmTimeSet(RTCC_PLIB_ID, 0x00000500);
    PLIB_RTCC_AlarmDateSet(RTCC_PLIB_ID, 0x0001010);

    /* repeat forever or 0-255 times */
    PLIB_RTCC_AlarmChimeDisable(RTCC_PLIB_ID);
    PLIB_RTCC_AlarmRepeatCountSet(RTCC_PLIB_ID, 0);

    /* enum here to select the alarm mask */
    PLIB_RTCC_AlarmMaskModeSelect(RTCC_PLIB_ID, RTCC_ALARM_ONCE_A_DAY);

    /* Initialize the output */
    PLIB_RTCC_ClockOutputDisable(RTCC_PLIB_ID); /* Disable RTCC output */

    /* Set RTCC clock source (LPRC/SOSC) */

    /* Setup RTCC Interrupt */
    PLIB_INT_SourceEnable(INT_ID_0, INT_SOURCE_RTCC);
    PLIB_INT_VectorPrioritySet(INT_ID_0, _RTCC_VECTOR, INT_PRIORITY_LEVEL1);
    PLIB_INT_VectorSubPrioritySet(INT_ID_0,_RTCC_VECTOR, INT_SUBPRIORITY_LEVEL0);
    SysRtccObject.interruptSource = INT_SOURCE_RTCC;
    /* save for checking alarm state */

    SYS_RTCC_Start();

    return (SYS_MODULE_OBJ)&SysRtccObject;
}

// *****************************************************************************
/* Function:
   void SYS_RTCC_Tasks ( SYS_MODULE_OBJ object )

Summary:
Maintains the system RTCC state machine and implements its ISR.

Description:
This routine is used to maintain the system RTCC internal state machine and
implement its ISR for interrupt-driven implementations.

Precondition:
The SYS_RTCC_Initialize function must have been called.

Parameters:
object          - SYS RTCC object returned from SYS_RTCC_Initialize

Returns:
None.
*/

void SYS_RTCC_Tasks ( SYS_MODULE_OBJ object )
{
    SYS_RTCC_OBJECT *obj = (SYS_RTCC_OBJECT *)object;

    if (PLIB_INT_SourceFlagGet(INT_ID_0, obj->interruptSource))
    {
        PLIB_INT_SourceFlagClear(INT_ID_0, obj->interruptSource);

        /* is there a callback to be made? do it */
        if ((obj != NULL) && obj->callback)
        {
            /* must be non-blocking*/
            obj->callback(obj->handle, obj->context);
        }
    }
}


// *****************************************************************************
/* Function:
  uint32_t SYS_RTCC_TimeBCD2Seconds(SYS_RTCC_BCD_TIME time)

  Summary:
    Helper function for time.

  Description:
    This function returns the number of seconds when given a BCD encoded time
    value. (see SYS_RTCC_BCD_TIME typedef above).

  Precondition:
    None.

  Parameters:
    time    - a SYS_RTCC_BCD_TIME value.

  Returns:
    The number of seconds represented by the BCD value.
*/

uint32_t TimeBCD2Seconds ( SYS_RTCC_BCD_TIME TimeInBCD )
{
    /* use a union and make the compiler do the work */
    union BCDConversion conversion = {0};
    conversion.bcd = TimeInBCD;

    return conversion.parts.hour10 * 36000u + conversion.parts.hour1 * 3600 +
           conversion.parts.mins10 * 600 +    conversion.parts.mins1 * 60 +
           conversion.parts.secs10 * 10 +     conversion.parts.secs1;
}



// *****************************************************************************
/* Function:
  SYS_RTCC_BCD_TIME SYS_RTCC_TimeSeconds2BCD(uint32_t seconds)

  Summary:
    Helper function for time.

  Description:
    This function returns the BCD encoded time
    value for the given number of seconds.

  Precondition:
    None.

  Parameters:
    seconds    - number of seconds to convert.

  Returns:
    A SYS_RTCC_BCD_TIME type value in BCD of the number of seconds given.
*/

SYS_RTCC_BCD_TIME TimeSeconds2BCD ( uint32_t seconds )
{
    union BCDConversion conversion = {0};

    /* limit and decompose seconds to BCD */
    seconds %= 360000ul;
    conversion.parts.hour10 = seconds / 36000u;
    seconds %= 36000u;
    conversion.parts.hour1  = seconds / 3600;
    seconds %= 3600;
    conversion.parts.mins10 = seconds / 600;
    seconds %= 600;
    conversion.parts.mins1  = seconds / 60;
    seconds %= 60;
    conversion.parts.secs10 = seconds / 10;
    seconds %= 10;
    conversion.parts.secs1  = seconds;

    return conversion.bcd;
}

