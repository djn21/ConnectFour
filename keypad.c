#include <keypad.h>

volatile char keypadPort at P0;

const char keys[17] = {'\0', '1', '2', '3', 'A', '4', '5', '6', 'B',
                 '7', '8', '9', 'C' ,'*', '0', '#', 'D'};

/******************************************************************************
* Initializes port for working with keypad.
******************************************************************************/
void init_keypad(){
    Keypad_Init();
}

/******************************************************************************
* Function waits until some key is pressed and released. When released, the
* function returns char, depending on the key.
******************************************************************************/
char key_click_keypad(){
    return keys[Keypad_Key_Click()];
}

/******************************************************************************
* Returns number from char digit
******************************************************************************/
unsigned char get_number_keypad(char key){
    return key - 48;
}