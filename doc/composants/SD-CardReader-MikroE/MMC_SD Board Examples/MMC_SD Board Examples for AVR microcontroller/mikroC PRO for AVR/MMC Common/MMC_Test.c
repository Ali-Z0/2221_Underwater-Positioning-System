/*
 * Project name:
     Mmc_Test (MMC Library Example)
 * Copyright:
     (c) MikroElektronika, 2005-2010.
 * Revision History:
     20081016:
       - initial release;
 * Description:
     MMC library test. Upon flashing, insert a MMC/SD card into the
     module, when you should receive
     the "Init-OK" message. Then, you can experiment with MMC read and write
     functions, and observe the results through the Usart Terminal.
 * Test configuration:
     MCU:             ATmega16
                      http://www.atmel.com/dyn/resources/prod_documents/doc2466.pdf
     Dev.Board:       EasyAVR6
                      http://www.mikroe.com/eng/products/view/321/easyavr6-development-system/
     Oscillator:      External Clock 08.0000 MHz
     Ext. Modules:    ac:MMC-SD_Board on PORTB
     SW:              mikroC PRO for AVR
                      http://www.mikroe.com/eng/products/view/228/mikroc-pro-for-avr/
 * NOTES:
     - Be sure to connect the RS232 cable and set the jumpers properly!
     - This is NOT an example for working with FILES on a MMC/SD memory module!
     - This example should work both for MMC and SD media types!
 */

// if defined, we have a debug messages on PC terminal
#define RS232_debug 1

sbit Mmc_Chip_Select at PORTB0_bit;
sbit Mmc_Chip_Select_Direction at DDB0_bit;

// universal variables
unsigned int  px, k; // universal for loops and other stuff

// Variables for MMC routines
unsigned char dData[512]; // Buffer for MMC sector reading/writing
unsigned char data_for_registers[16]; // buffer for CID and CSD registers

// RS232 communication variables
unsigned char received_character;
unsigned long sector_address;
unsigned char first_byte, second_byte, third_byte, fourth_byte;
unsigned char serial_buffer[2];
unsigned char serial_pointer;


// Display byte in hex
void printhex(unsigned char i) {
  unsigned char hi,lo;
  hi = i & 0xF0;               // High nibble
  hi = hi >> 4;
  hi = hi + '0';
  if (hi>'9') hi = hi + 7;
  lo = (i & 0x0F) + '0';       // Low nibble
  if (lo>'9') lo=lo+7;
  UART1_Write(hi);
  UART1_Write(lo);

}

void main()
{
  unsigned int i;

  PORTC = 0;
  #ifdef RS232_debug
    UART1_Init(19200);
  #endif

  Delay_ms(10);

  #ifdef RS232_debug
    UART1_Write_Text("PIC-Started"); // If PIC present report
    UART1_Write(13);
    UART1_Write(10);
  #endif

  // Beffore all, we must initialise a MMC card
  SPI1_Init_Advanced(_SPI_MASTER, _SPI_FCY_DIV2, _SPI_CLK_LO_LEADING);
  Spi_Rd_Ptr = SPI1_Read;
  i = Mmc_Init();
  #ifdef RS232_debug
    if(i == 0)
    {
      UART1_Write_Text("MMC Init-OK"); // If MMC present report
      UART1_Write(13);
      UART1_Write(10);
    }
    if(i)
    {
      UART1_Write_Text("MMC Init-error"); // If error report
      UART1_Write(13);
      UART1_Write(10);
    }
  #endif

  for(i=0; i<=511; i++) 
    dData[i] = 'E'; // Fill MMC buffer with same characters
  i = Mmc_Write_Sector(55, dData);

  #ifdef RS232_debug
    if(i == 0)
    {
      UART1_Write_Text("Write-OK");
    }
    else  // if there are errors.....
    {
      UART1_Write_Text("Write-Error");
    }
    UART1_Write(13);
    UART1_Write(10);
  #endif

  // Reading of CID and CSD register on MMC card.....
  #ifdef RS232_debug
    i = Mmc_Read_Cid(data_for_registers);
    if(i == 0)
    {
      for(k=0; k<=15; k++)
      {
        printhex(data_for_registers[k]);
        if(k!=15) UART1_Write('-');
      }
      UART1_Write(13);
    }
    else
    {
      UART1_Write_Text("CID-error");
    }
    i == Mmc_Read_Csd(data_for_registers);
    if(i == 0)
    {
      for(k=0; k<=15; k++)
      {
        printhex(data_for_registers[k]);
        if(k!=15) UART1_Write('-');
      }
      UART1_Write(13);
      UART1_Write(10);
    }
    else
    {
      UART1_Write_Text("CSD-error");
    }
  #endif

  // Variables initialisation
  serial_pointer = 0;

  // MAIN loop
  while(1)
  {
    if (UART1_Data_Ready())
    {
      serial_buffer[serial_pointer] = UART1_Read();    // Get the received character
      serial_pointer++;
      if(serial_pointer>1)
      {
        serial_pointer = 0;
        // Collecting four bytes of the address!
        if(serial_buffer[0] == 'S') first_byte  = serial_buffer[1];
        if(serial_buffer[0] == 's') second_byte = serial_buffer[1];
        if(serial_buffer[0] == 'E') third_byte  = serial_buffer[1];
        if(serial_buffer[0] == 'e') fourth_byte = serial_buffer[1];
        if(serial_buffer[0] == 'R') // Command: Read memmory
        {
          if(serial_buffer[1] == 'r')
          {
            sector_address = ((long)first_byte << 24) + ((long)second_byte << 16) +
                             ((long)third_byte << 8)  + ((long)fourth_byte);
            i = Mmc_Read_Sector(sector_address, dData);
            //UART1_Write(0x30 + i);  //
            if(i == 0)
            {
              for(k=0; k<512; k++)
              { //UART1_Write(dData[k]); // send 512 bytes from MMC card via usart
                printhex(dData[k]);
                UART1_Write(' ');
                if(((k+1) % 16)==0)
                {
                  UART1_Write(' ');
                  //printhex(k);
                  for(px=(k-15); px<=k; px++)
                  {
                    if((dData[px]>33) && (dData[px]<126))
                    {
                      UART1_Write(dData[px]);
                    }
                    else
                    {
                      UART1_Write('.');
                    }
                  }
                  UART1_Write(13);
                }
              }
              UART1_Write(13);
              UART1_Write(10);
            }
            else
            {
              UART1_Write_Text("Read-error");
              UART1_Write(13);
              UART1_Write(10);
            }
          }
        }
        if(serial_buffer[0] == 'W') // Command: Write
        {
          if(serial_buffer[1] == 'w')
          {
            // Generating 32-bit address of the sector out of four received bytes
            sector_address = ((long)first_byte << 24) + ((long)second_byte << 16) +
                             ((long)third_byte << 8)  + ((long)fourth_byte);
            for(k=0; k<512; k++) 
              dData[k] = received_character;// fill RAM baffer
            i = Mmc_Write_Sector(sector_address, dData); // write buffer tou MMC
            if(i != 0)
            {
              UART1_Write_Text("Write-error");
              UART1_Write(13);
              UART1_Write(10);
            }
            else
            {
              UART1_Write_Text("Write-Ok");
              UART1_Write(13);
              UART1_Write(10);
            }
          }
        }
        if(serial_buffer[0] == 'C')
        {
          received_character = serial_buffer[1];
        }
      }
    }
  }
}