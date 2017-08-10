/******************************************************************************
* MODULE:    TIMER
* CONTAINS:  Functions for working with time
* COPYRIGHT: Faculty of Electrical Engineering - www.etf.unibl.org
* VERSION:   1.0, 09-AUG-17
******************************************************************************/

#include <timer.h>

static unsigned long mMiliseconds;

/******************************************************************************
* DOES:     Initialize and start timer
* GLOBALS:  Modify mMiliseconds
* RETURNS:  This function does not return value
******************************************************************************/
void Timer_Init(){
    mMiliseconds = 0;
    // set timer 1 (gate disable, interval timer, mode 1)
    TMOD |= 0x10;
    // initial values to get interrupt at 1 ms
    TH1 = 0xFC;
    TL1 = 0xBE;
    // enable interrupts (sets EA and ET1)
    IE |= 0x88;
    // run the timer
    TR1_bit = 1;
}

/******************************************************************************
* DOES:     Returns current miliseconds from start of timer
* GLOBALS:  Reads mMiliseconds. Does not modify mMiliseconds
* RETURNS:  Curent miliseconds form start of timer
******************************************************************************/
unsigned long Timer_Miliseconds(){
    return mMiliseconds;
}

/******************************************************************************
* DOES:     Increment current time every milisecond
* GLOBALS:  Modify mMiliseconds
* RETURNS:  This function does not return value
******************************************************************************/
void Timer_Tick() iv IVT_ADDR_ET1 {
    // stop timer
    TR1_bit = 0;
    // reset timer values to get interrupt at 1 ms
    TH1 = 0xFC;
    TL1 = 0xBE;
    // set count
    mMiliseconds++;
    // start timer
    TR1_bit = 1;
}
