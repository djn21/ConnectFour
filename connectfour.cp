#line 1 "D:/Workspaces/MikroC/connectfour/connectfour.c"
#line 1 "d:/workspaces/mikroc/connectfour/keypad.h"
#line 7 "d:/workspaces/mikroc/connectfour/keypad.h"
void init_keypad();
#line 13 "d:/workspaces/mikroc/connectfour/keypad.h"
char key_click_keypad();
#line 1 "c:/users/dejan/documents/connectfour/display.h"
#line 7 "c:/users/dejan/documents/connectfour/display.h"
void init_display();
#line 1 "c:/users/dejan/documents/connectfour/graphics.h"



typedef enum Color{
 BLACK,
 RED,
 GREEN,
 YELLOW
} Color;
#line 14 "c:/users/dejan/documents/connectfour/graphics.h"
void set_pixel(unsigned short row, unsigned short column, Color color);
#line 19 "c:/users/dejan/documents/connectfour/graphics.h"
void hline(unsigned short row, unsigned short column_start, unsigned short column_end,
 Color color);
#line 25 "c:/users/dejan/documents/connectfour/graphics.h"
void vline(unsigned short row_start, unsigned short row_end, unsigned short column,
 Color color);
#line 5 "D:/Workspaces/MikroC/connectfour/connectfour.c"
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

 }
 }while(1);
}
