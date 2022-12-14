/*
 * Project name:
     Mmc_Test (MMC Library Example)
 * Copyright:
     (c) MikroElektronika, 2005-2010
 * Revision History:
     20081218:
       - initial release;
     20101102:  
       - added active comments;
 * Description:
     MMC library test. Upon flashing, insert a MMC/SD card into the
     module, when you should receive the "Init-OK" message.
     Then, you can experiment with MMC read and write functions,
     and observe the results through the Usart Terminal.
 * Test configuration:
     MCU:             PIC18F4520
                      http://ww1.microchip.com/downloads/en/DeviceDoc/39631E.pdf
     Dev.Board:       EasyPIC6
                      http://www.mikroe.com/eng/products/view/297/easypic6-development-system/
     Oscillator:      HS-PLL, 32.00000 MHz
     Ext. Modules:    ac:MMC-SD_Board on PORTC
     SW:              mikroC PRO for PIC
                      http://www.mikroe.com/eng/products/view/7/mikroc-pro-for-pic/
 * NOTES:
     - Connect RS232 cable and turn on RS232 switches SW7.1 and SW8.1 (board specific).
     - This is NOT an example for working with FILES on a MMC/SD memory module.
     - This example should work both for MMC and SD media types.
 */

// MMC module connections
sbit Mmc_Chip_Select           at LATC0_bit;  // for writing to output pin always use latch (PIC18 family)
sbit Mmc_Chip_Select_Direction at TRISC0_bit;
// eof MMC module connections

// Variables for MMC routines
unsigned char SectorData[512];        // Buffer for MMC sector reading/writing
unsigned char data_for_registers[16]; // buffer for CID and CSD registers

// UART1 write text and new line (carriage return + line feed)
void UART1_Write_Line(char *uart_text) {
  UART1_Write_Text(uart_text);
  UART1_Write(13);
  UART1_Write(10);
}

// Display byte in hex
void PrintHex(unsigned char i) {
  unsigned char hi,lo;
  
  hi = i & 0xF0;               // High nibble
  hi = hi >> 4;
  hi = hi + '0';
  if (hi>'9') hi=hi+7;
  lo = (i & 0x0F) + '0';       // Low nibble
  if (lo>'9') lo=lo+7;
  
  UART1_Write(hi);
  UART1_Write(lo);
}

void main() {

  const char   FILL_CHAR = 'm';
  unsigned int i, SectorNo;
  char         mmc_error;
  bit          data_ok;

  ADCON1 |= 0x0F;                  // Configure AN pins as digital
  CMCON  |= 7;                     // Turn off comparators
  Delay_ms(500);
  
  // Initialize UART1 module
  UART1_Init(19200);
  Delay_ms(10);

  UART1_Write_Line("PIC-Started"); // PIC present report

  // Initialize SPI1 module
  SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV64, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);

  // initialise a MMC card
  mmc_error = Mmc_Init();
  if(mmc_error == 0)
    UART1_Write_Line("MMC Init-OK"); // If MMC present report
  else
    UART1_Write_Line("MMC Init-error"); // If error report

  // Fill MMC buffer with same characters
  for(i=0; i<=511; i++)
    SectorData[i] = FILL_CHAR;

  // Choose sector
  SectorNo = 590;

  // Write sector
  mmc_error = Mmc_Write_Sector(SectorNo, SectorData);
  if(mmc_error == 0)
    UART1_Write_Line("Write-OK");
  else  // if there are errors.....
    UART1_Write_Line("Write-Error");

  // Reading of CID register
  mmc_error = Mmc_Read_Cid(data_for_registers);
  if(mmc_error == 0) {
    UART1_Write_Text("CID : ");
    for(i=0; i<=15; i++)
      PrintHex(data_for_registers[i]);
    UART1_Write_Line("");
  }
  else
    UART1_Write_Line("CID-error");

  // Reading of CSD register
  mmc_error = Mmc_Read_Csd(data_for_registers);
  if(mmc_error == 0) {
    UART1_Write_Text("CSD : ");
    for(i=0; i<=15; i++)
      PrintHex(data_for_registers[i]);
    UART1_Write_Line("");
  }
  else
    UART1_Write_Line("CSD-error");

  // Read sector
  mmc_error = Mmc_Read_Sector(SectorNo, SectorData);
  if(mmc_error == 0) {
    UART1_Write_Line("Read-OK");
    // Chech data match
    data_ok = 1;
    for(i=0; i<=511; i++) {
      UART1_Write(SectorData[i]);
      if (SectorData[i] != FILL_CHAR) {
        data_ok = 0;
        break;
      }
    }
    UART1_Write_Line("");
    if (data_ok)
      UART1_Write_Line("Content-OK");
    else
      UART1_Write_Line("Content-Error");
  }
  else  // if there are errors.....
    UART1_Write_Line("Read-Error");

  // Signal test end
  UART1_Write_Line("Test End.");
}