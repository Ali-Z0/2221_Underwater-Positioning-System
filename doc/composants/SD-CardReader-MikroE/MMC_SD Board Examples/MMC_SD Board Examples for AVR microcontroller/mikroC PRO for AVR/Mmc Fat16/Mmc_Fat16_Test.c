/*
 * Project name:
     Mmc_Fat16_Test (Demonstration on usage of Mmc_Fat16 library)
 * Copyright:
     (c) Mikroelektronika, 2005-2010.
 * Revision History:
     20100610:
       - initial release;
 * Description:
     This project consists of several blocks that demonstrate various aspects of
     usage of the Mmc_Fat16 library. These are:
     - Creation of new file and writing down to it;
     - Opening existing file and re-writing it (writing from start-of-file);
     - Opening existing file and appending data to it (writing from end-of-file);
     - Opening a file and reading data from it (sending it to USART terminal);
     - Creating and modifying several files at once;
     - Reading file contents;
     - Deleting file(s);
     - Creating the swap file (see Help for details);
 * Test configuration:
     MCU:             ATxmega128A1
                      http://www.atmel.com/dyn/resources/prod_documents/doc8067.pdf
     Dev.Board:       XMEGA-Ready board,
                      http://www.mikroe.com/eng/products/view/579/xmega-ready-board/
     Oscillator:      Internal Clock 32.0000 MHz
     Ext. Modules:    ac:MMC-SD_Board on PORTB
     SW:              mikroC PRO for AVR
                      http://www.mikroe.com/en/compilers/mikroc/avr/
 * NOTES:
     - Make sure that MMC card is properly formatted (to FAT16 or just FAT)
       before testing it on this example.
     - This example expects MMC card to be inserted before reset, otherwise,
       the FAT_ERROR message is displayed.
 */

// MMC module connections
sbit Mmc_Chip_Select at PORTC_OUT.B0;
sbit Mmc_Chip_Select_Direction at PORTC_DIR.B0;
// eof MMC module connections

const LINE_LEN = 43;
char err_txt[20]       = "FAT16 not found";
char file_contents[LINE_LEN] = "XX MMC/SD FAT16 library by Anton Rieckert\n";
char           filename[14] = "MIKRO00x.TXT";          // File names
unsigned short loop, loop2;
unsigned long  i, size;
char           Buffer[512];

// UART1 write text and new line (carriage return + line feed)
void UARTC0_Write_Line(char *uart_text) {
  UARTC0_Write_Text(uart_text);
  UARTC0_Write(13);
  UARTC0_Write(10);
}

// Creates new file and writes some data to it
void M_Create_New_File() {
  filename[7] = 'A';
  Mmc_Fat_Set_File_Date(2005,6,21,10,35,0); // Set file date & time info
  Mmc_Fat_Assign(&filename, 0xA0);      // Find existing file or create a new one
  Mmc_Fat_Rewrite();                    // To clear file and start with new data
  for(loop = 1; loop <= 99; loop++) {
    UARTC0_Write('.');
    file_contents[0] = loop / 10 + 48;
    file_contents[1] = loop % 10 + 48;
    Mmc_Fat_Write(file_contents, LINE_LEN-1);   // write data to the assigned file
  }
}

// Creates many new files and writes data to them
void M_Create_Multiple_Files() {
  for(loop2 = 'B'; loop2 <= 'Z'; loop2++) {
    UARTC0_Write(loop2);                  // signal the progress
    filename[7] = loop2;                 // set filename
    Mmc_Fat_Set_File_Date(2005,6,21,10,35,0); // Set file date & time info
    Mmc_Fat_Assign(&filename, 0xA0);     // find existing file or create a new one
    Mmc_Fat_Rewrite();                   // To clear file and start with new data
    for(loop = 1; loop <= 44; loop++) {
      file_contents[0] = loop / 10 + 48;
      file_contents[1] = loop % 10 + 48;
      Mmc_Fat_Write(file_contents, LINE_LEN-1);  // write data to the assigned file
    }
  }
}

// Opens an existing file and rewrites it
void M_Open_File_Rewrite() {
  filename[7] = 'C';
  Mmc_Fat_Assign(&filename, 0);
  Mmc_Fat_Rewrite();
  for(loop = 1; loop <= 55; loop++) {
    file_contents[0] = loop / 10 + 65;
    file_contents[1] = loop % 10 + 65;
    Mmc_Fat_Write(file_contents, LINE_LEN-1);    // write data to the assigned file
  }
}

// Opens an existing file and appends data to it
//               (and alters the date/time stamp)
void M_Open_File_Append() {
   filename[7] = 'B';
   Mmc_Fat_Assign(&filename, 0);
   Mmc_Fat_Set_File_Date(2009, 1, 23, 17, 22, 0);
   Mmc_Fat_Append();                                    // Prepare file for append
   Mmc_Fat_Write(" for mikroElektronika 2005\n", 27);   // Write data to assigned file
}

// Opens an existing file, reads data from it and puts it to UART
void M_Open_File_Read() {
  char character;
  
  filename[7] = 'B';
  Mmc_Fat_Assign(&filename, 0);
  Mmc_Fat_Reset(&size);            // To read file, procedure returns size of file
  for (i = 1; i <= size; i++) {
    Mmc_Fat_Read(&character);
    UARTC0_Write(character);        // Write data to UART
  }
}

// Deletes a file. If file doesn't exist, it will first be created
// and then deleted.
void M_Delete_File() {
  filename[7] = 'F';
  Mmc_Fat_Assign(filename, 0);
  Mmc_Fat_Delete();
}

// Tests whether file exists, and if so sends its creation date
// and file size via UART
void M_Test_File_Exist() {
  unsigned long  fsize;
  unsigned int   year;
  unsigned short month, day, hour, minute;
  unsigned char  outstr[12];

  filename[7] = 'B';       //uncomment this line to search for file that DOES exists
//  filename[7] = 'F';       //uncomment this line to search for file that DOES NOT exist
  if (Mmc_Fat_Assign(filename, 0)) {
    //--- file has been found - get its create date
    Mmc_Fat_Get_File_Date(&year, &month, &day, &hour, &minute);
    UARTC0_Write_Text(" created: ");
    WordToStr(year, outstr);
    UARTC0_Write_Text(outstr);
    ByteToStr(month, outstr);
    UARTC0_Write_Text(outstr);
    WordToStr(day, outstr);
    UARTC0_Write_Text(outstr);
    WordToStr(hour, outstr);
    UARTC0_Write_Text(outstr);
    WordToStr(minute, outstr);
    UARTC0_Write_Text(outstr);
    
    //--- file has been found - get its modified date
    Mmc_Fat_Get_File_Date_Modified(&year, &month, &day, &hour, &minute);
    UARTC0_Write_Text(" modified: ");
    WordToStr(year, outstr);
    UARTC0_Write_Text(outstr);
    ByteToStr(month, outstr);
    UARTC0_Write_Text(outstr);
    WordToStr(day, outstr);
    UARTC0_Write_Text(outstr);
    WordToStr(hour, outstr);
    UARTC0_Write_Text(outstr);
    WordToStr(minute, outstr);
    UARTC0_Write_Text(outstr);
    
    //--- get file size
    fsize = Mmc_Fat_Get_File_Size();
    LongToStr((signed long)fsize, outstr);
    UARTC0_Write_Line(outstr);
  }
  else {
    //--- file was not found - signal it
    UARTC0_Write(0x55);
    Delay_ms(1000);
    UARTC0_Write(0x55);
  }
}


// Tries to create a swap file, whose size will be at least 100
// sectors (see Help for details)
void M_Create_Swap_File() {
  unsigned int i;

  for(i=0; i<512; i++)
    Buffer[i] = i;

  size = Mmc_Fat_Get_Swap_File(5000, "mikroE.txt", 0x20);   // see help on this function for details

  if (size) {
    LongToStr((signed long)size, err_txt);
    UARTC0_Write_Line(err_txt);

    for(i=0; i<5000; i++) {
      Mmc_Write_Sector(size++, Buffer);
      UARTC0_Write('.');
    }
  }
}

void SetInternalOsc(){
  OSC_CTRL = 0x02;          // 32MHz internal RC oscillator

  while(RC32MRDY_bit == 0)
    ;

  CPU_CCP = 0xD8;
  CLK_CTRL = 1;             // set system clock to 32MHz internal RC oscillator
}

// Main. Uncomment the function(s) to test the desired operation(s)
void main() {

  SetInternalOsc();   // Set internal oscillator

  // Initialize UART1 module
  UARTC0_Init(19200);
  Delay_ms(10);

  UARTC0_Write_Line("MCU-Started"); // MCU present report

  // Initialize SPI1 module
  SPIC_Init_Advanced(_SPI_MASTER, _SPI_FCY_DIV128, _SPI_CLK_LO_LEADING);

  // use fat16 quick format instead of init routine if a formatting is needed
  if (Mmc_Fat_Init() == 0) {
    // reinitialize spi at higher speed
    SPIC_Init_Advanced(_SPI_MASTER, _SPI_FCY_DIV2, _SPI_CLK_LO_LEADING);
    //--- Test start
    UARTC0_Write_Line("Test Start.");
    //--- Test routines. Uncomment them one-by-one to test certain features
    M_Create_New_File();
    M_Create_Multiple_Files();
    M_Open_File_Rewrite();
    M_Open_File_Append();
    M_Open_File_Read();
    M_Delete_File();
    M_Test_File_Exist();
    M_Create_Swap_File();
    UARTC0_Write_Line("Test End.");
  }
  else {
    UARTC0_Write_Line(err_txt); // Note: Mmc_Fat_Init tries to initialize a card more than once.
                               //       If card is not present, initialization may last longer (depending on clock speed)
  }
}