/* ************************************************************************** */
/** Descriptive File Name

  @Company
    ETML-ES

  @File Name
    sd_fat_gest.c

  @Summary
    SD card fat system management

  @Description
    SD card fat system management
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

#include "sd_fat_gest.h"
#include "app.h"

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

APP_FAT_DATA COHERENT_ALIGNED appFatData;

/* ************************************************************************** */
/** Descriptive Data Item Name

  @Summary
    Brief one-line summary of the data item.
    
  @Description
    Full description, explaining the purpose and usage of data item.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.
    
  @Remarks
    Any additional remarks
 */


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

/* ************************************************************************** */



/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

void sd_fat_task ( void )
{
    /* The application task state machine */
    switch(appFatData.state)
    {
        case APP_MOUNT_DISK:
            if(SYS_FS_Mount("/dev/mmcblka1", "/mnt/myDrive", FAT, 0, NULL) != 0)
            {
                /* The disk could not be mounted. Try
                 * mounting again untill success. */

                appFatData.state = APP_MOUNT_DISK;
            }
            else
            {
                /* Mount was successful. Unmount the disk, for testing. */

                appFatData.state = APP_SET_CURRENT_DRIVE;
            }
            break;

        case APP_UNMOUNT_DISK:
            if(SYS_FS_Unmount("/mnt/myDrive") != 0)
            {
                /* The disk could not be un mounted. Try
                 * un mounting again untill success. */

                appFatData.state = APP_UNMOUNT_DISK;
            }
            else
            {
                /* UnMount was successful. Mount the disk again */

                appFatData.state = APP_MOUNT_DISK_AGAIN;
            }
            break;

        case APP_MOUNT_DISK_AGAIN:
            if(SYS_FS_Mount("/dev/mmcblka1", "/mnt/myDrive", FAT, 0, NULL) != 0)
            {
                /* The disk could not be mounted. Try
                 * mounting again untill success. */

                appFatData.state = APP_MOUNT_DISK_AGAIN;
            }
            else
            {
                /* Mount was successful. Set current drive so that we do not have to use absolute path. */

                appFatData.state = APP_SET_CURRENT_DRIVE;
            }
            break;

        case APP_SET_CURRENT_DRIVE:
            if(SYS_FS_CurrentDriveSet("/mnt/myDrive") == SYS_FS_RES_FAILURE)
            {
                /* Error while setting current drive */
                appFatData.state = APP_ERROR;
            }
            else
            {
                /* Open a file for reading. */
                appFatData.state = APP_OPEN_FIRST_FILE;
            }

        case APP_OPEN_FIRST_FILE:
            appFatData.fileHandle = SYS_FS_FileOpen("FILE_TOO_LONG_NAME_EXAMPLE_123.JPG",
                    (SYS_FS_FILE_OPEN_READ));
            if(appFatData.fileHandle == SYS_FS_HANDLE_INVALID)
            {
                /* Could not open the file. Error out*/
                appFatData.state = APP_ERROR;
            }
            else
            {
                /* Create a directory. */
                appFatData.state = APP_CREATE_DIRECTORY;
            }
            break;

        case APP_CREATE_DIRECTORY:
            if(SYS_FS_DirectoryMake("Dir1") == SYS_FS_RES_FAILURE)
            {
                /* Error while setting current drive */
                appFatData.state = APP_ERROR;
            }
            else
            {
                /* Open a second file for writing. */
                appFatData.state = APP_OPEN_SECOND_FILE;
            }
            break;

        case APP_OPEN_SECOND_FILE:
            /* Open a second file inside "Dir1" */
            appFatData.fileHandle1 = SYS_FS_FileOpen("Dir1/FILE_TOO_LONG_NAME_EXAMPLE_123_1.JPG",
                    (SYS_FS_FILE_OPEN_WRITE));

            if(appFatData.fileHandle1 == SYS_FS_HANDLE_INVALID)
            {
                /* Could not open the file. Error out*/
                appFatData.state = APP_ERROR;
            }
            else
            {
                /* Read from one file and write to another file */
                appFatData.state = APP_READ_WRITE_TO_FILE;
            }

        case APP_READ_WRITE_TO_FILE:

            if(SYS_FS_FileRead(appFatData.fileHandle, (void *)appFatData.data, 512) == -1)
            {
                /* There was an error while reading the file.
                 * Close the file and error out. */

                SYS_FS_FileClose(appFatData.fileHandle);
                appFatData.state = APP_ERROR;
            }
            else
            {
                /* If read was success, try writing to the new file */
                if(SYS_FS_FileWrite(appFatData.fileHandle1, (const void *)appFatData.data, 512) == -1)
                {
                    /* Write was not successful. Close the file
                     * and error out.*/
                    SYS_FS_FileClose(appFatData.fileHandle1);
                    appFatData.state = APP_ERROR;
                }
                else if(SYS_FS_FileEOF(appFatData.fileHandle) == 1)    /* Test for end of file */
                {
                    /* Continue the read and write process, untill the end of file is reached */

                    appFatData.state = APP_CLOSE_FILE;
                }
            }
            break;

        case APP_CLOSE_FILE:
            /* Close both files */
            SYS_FS_FileClose(appFatData.fileHandle);
            SYS_FS_FileClose(appFatData.fileHandle1);
             /* The test was successful. Lets idle. */
            appFatData.state = APP_IDLE;
            break;

        case APP_IDLE:
            /* The appliction comes here when the demo
             * has completed successfully. Switch on
             * green LED. */
            //BSP_LEDOn(APP_SUCCESS_LED);
            break;
        case APP_ERROR:
            /* The appliction comes here when the demo
             * has failed. Switch on the red LED.*/
            //BSP_LEDOn(APP_FAILURE_LED);
            break;
        default:
            break;

    }

//    SYS_FS_Tasks();
} //End of APP_Tasks

/*int ExampleInterfaceFunction(int param1, int param2) {
    return 0;
}*/


/* *****************************************************************************
 End of File
 */
