/*************************************************************************************************
* MODULE:    DISPLAY
* CONTAINS:  Functions for working with display
* COPYRIGHT: Faculty of Electrical Engineering - www.etf.unibl.org
* VERSION:   1.0, 09-AUG-17
*************************************************************************************************/

#include <display.h>

static char mRowOutputPort at P1;
static char mRedOutputPort at P2;
static char mGreenOutputPort at P3;


const unsigned char gMatrixRow[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
unsigned char gMatrixRed[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
unsigned char gMatrixGreen[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

/*************************************************************************************************
* DOES:     Initialize display
* GLOBALS:  This function does not read or write global variables
* RETURNS:  This function does not return value
*************************************************************************************************/
void Display_Init(){
    // set timer 0 (gate disable, interval timer, mode 1)
    TMOD |= 0x01;
    // initial values to get interrupt at 2 ms
    TH0 = 0xF9;
    TL0 = 0x7D;
    // enable interrupts (sets EA and ET0)
    IE |= 0x82;
    // run the timer
    TR0_bit = 1;
}

/*************************************************************************************************
* DOES:     Set display rows and colors matrix
* GLOBALS:  Modify gMatrixRow, gMatrixRed, gMatrixGreen
* RETURNS:  This function does not return value
*************************************************************************************************/
void Display_SetOutput(unsigned char row, unsigned char red, unsigned char green){
    // turn of row to avoid ghosts
    mRowOutputPort = 0x00;
    // set colors
    mRedOutputPort = red;
    mGreenOutputPort = green;
    // set row
    mRowOutputPort = row;
}

/*************************************************************************************************
* DOES:     Refresh display
* GLOBALS:  Reads gMatrixRow, gMatrixRed, gMatrixGreen
* RETURNS:  This function does not return value
*************************************************************************************************/
void Display_Refresh() iv IVT_ADDR_ET0 {
    static unsigned char i = 0;
    // stop timer
    TR0_bit = 0;
    // reset timer values to get interrupt at 1 ms
    TH0 = 0xF9;
    TL0 = 0x7D;
    // set output ports
    Display_SetOutput(gMatrixRow[i], gMatrixRed[i], gMatrixGreen[i]);
    i++;
    // reset row count
    if(i == 8){
        i = 0;
    }
    // start timer
    TR0_bit = 1;
}
