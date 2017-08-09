/******************************************************************************
* MODULE:    TIMER
* CONTAINS:  Functions for working with time
* COPYRIGHT: Faculty of Electrical Engineering - www.etf.unibl.org
* VERSION:   1.0 09-AUG-17
******************************************************************************/

#ifndef _TIMER_H_
#define _TIMER_H_

/******************************************************************************
* DOES: Initialize and start timer
* GLOBALS: This function does not read or write global variables
* RETURNS: This function does not return value
******************************************************************************/
void Timer_Init();

/******************************************************************************
* DOES: Returns current miliseconds from start of timer
* GLOBALS: Reads mMiliseconds. Does not modify mMiliseconds
* RETURNS: Curent miliseconds form start of timer
******************************************************************************/
unsigned long Timer_Miliseconds();

#endif