#ifndef _KEYPAD_H_
#define _KEYPAD_H_

/******************************************************************************
* Initializes port for working with keypad.
******************************************************************************/
void init_keypad();

/******************************************************************************
* Function waits until some key is pressed and released. When released, the 
* function returns char, depending on the key.
******************************************************************************/
char key_click_keypad();

/******************************************************************************
* Returns number from char digit
******************************************************************************/
unsigned char get_number_keypad(char key);

#endif