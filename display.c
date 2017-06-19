#include <display.h>

const unsigned char mat_row[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
unsigned char mat_red[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
unsigned char mat_green[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

/******************************************************************************
* Initialize display, set timer 0 to get interrupt at 2 ms (refresh rate)
******************************************************************************/
void init_display(){
    // set timer 0 (gate disable, interval timer, mode 1)
    TMOD = 0x01;
    // initial values to get interrupt at 2 ms
    TH0 = 0xF9;
    TL0 = 0x7D;
    // enable interrupts (sets EA and ET0)
    IE = 0x82;
    // run the timer
    TR0_bit = 1;
}
/******************************************************************************
* Set output pins P1, P2 and P3 with row, red and green values respectively
******************************************************************************/
void set_out(unsigned char row, unsigned char red, unsigned char green){
     // turn of colors to avoid ghosts
     P2 = 0x00;
     P3 = 0x00;
     // set row
     P1 = ~row;
     // set colors
     P2 = red;
     P3 = green;
}

/******************************************************************************
* Refreshing display, selecting different row each time and set color values
* depending on the selected row.
******************************************************************************/
void refresh_display() iv IVT_ADDR_ET0 {
     static unsigned short i = 0;
     // stop timer
     TR0_bit = 0;
     // reset timer values to get interrupt at 2 ms
     TH0 = 0xF9;
     TL0 = 0x7D;
     // set output ports
     set_out(mat_row[i], mat_red[i], mat_green[i]);
     i++;
     // reset row count
     if(i == 8)
          i = 0;
     // start timer
     TR0_bit = 1;
}