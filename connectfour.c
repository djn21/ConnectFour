#include <keypad.h>
#include <display.h>
#include <graphics.h>

void main() {
     char key;
     init_keypad();
     init_display();
     do{
          do{
               key = key_click_keypad();
          }while(key == '\0');
          if(key >= '0' && key <= '7'){
               unsigned short i;
               for(i = 0; i < 8; i++){
                     set_pixel(key - 48, i, GREEN);
                     if(i >= 1){
                          set_pixel(key - 48, i-1, BLACK);
                     }
               Delay_ms(100);
               }
          }else if(key == 'C'){
                // clear_display();
          }
     }while(1);
}