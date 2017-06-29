#include <keypad.h>
#include <display.h>
#include <connectfour.h>

void init(){
     init_keypad();
     init_display();
     init_connectfour();
}

void main() {
     char key;
     
     init();
     
     // repeat until die
     do{
          // wait until 1...7  is pressed
          do{
               key = key_click_keypad();
          }while(key < '1' || key > '7');
          // insert disc
          insert_disc(key - 48);
          // switch player
          switch_player();
          
     } while(1);
     
}