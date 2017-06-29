#line 1 "D:/Workspaces/MikroC/connectfour/main.c"
#line 1 "d:/workspaces/mikroc/connectfour/keypad.h"
#line 7 "d:/workspaces/mikroc/connectfour/keypad.h"
void init_keypad();
#line 13 "d:/workspaces/mikroc/connectfour/keypad.h"
char key_click_keypad();
#line 1 "c:/users/dejan/documents/connectfour/display.h"
#line 7 "c:/users/dejan/documents/connectfour/display.h"
void init_display();
#line 1 "d:/workspaces/mikroc/connectfour/connectfour.h"
#line 7 "d:/workspaces/mikroc/connectfour/connectfour.h"
void init_connectfour();
#line 12 "d:/workspaces/mikroc/connectfour/connectfour.h"
void switch_player();
#line 17 "d:/workspaces/mikroc/connectfour/connectfour.h"
void insert_disc(unsigned short position);
#line 5 "D:/Workspaces/MikroC/connectfour/main.c"
void init(){
 init_keypad();
 init_display();
 init_connectfour();
}

void main() {
 char key;

 init();


 do{

 do{
 key = key_click_keypad();
 }while(key < '1' || key > '7');

 insert_disc(key - 48);

 switch_player();

 } while(1);

}
