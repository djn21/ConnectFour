#line 1 "D:/Workspaces/MikroC/connectfour/main.c"
#line 1 "d:/workspaces/mikroc/connectfour/timer.h"
#line 16 "d:/workspaces/mikroc/connectfour/timer.h"
void Timer_Init();
#line 23 "d:/workspaces/mikroc/connectfour/timer.h"
unsigned long Timer_Miliseconds();
#line 1 "d:/workspaces/mikroc/connectfour/display.h"
#line 16 "d:/workspaces/mikroc/connectfour/display.h"
void Display_Init();
#line 1 "d:/workspaces/mikroc/connectfour/graphics.h"
#line 11 "d:/workspaces/mikroc/connectfour/graphics.h"
typedef enum Color{
 COLOR_BLACK,
 COLOR_RED,
 COLOR_GREEN,
 COLOR_YELLOW
} Color;
#line 23 "d:/workspaces/mikroc/connectfour/graphics.h"
void Graphics_SetPixel(unsigned char row, unsigned char column, Color color);
#line 30 "d:/workspaces/mikroc/connectfour/graphics.h"
void Graphics_VerticalLine(unsigned char column, unsigned char row_start,
 unsigned char row_end, Color color);
#line 38 "d:/workspaces/mikroc/connectfour/graphics.h"
void Graphics_HorizontalLine(unsigned char row, unsigned char column_start,
 unsigned char column_end, Color color);
#line 46 "d:/workspaces/mikroc/connectfour/graphics.h"
void Graphics_ClearDisplay();
#line 1 "d:/workspaces/mikroc/connectfour/connectfour.h"
#line 16 "d:/workspaces/mikroc/connectfour/connectfour.h"
void ConnectFour_Init();
#line 23 "d:/workspaces/mikroc/connectfour/connectfour.h"
void ConnectFour_SwitchPlayer();
#line 30 "d:/workspaces/mikroc/connectfour/connectfour.h"
unsigned char ConnectFour_InsertDisc(unsigned char column);
#line 37 "d:/workspaces/mikroc/connectfour/connectfour.h"
unsigned char ConnectFour_CheckWinner();
#line 44 "d:/workspaces/mikroc/connectfour/connectfour.h"
void ConnectForur_TurnWinnersDiscs(unsigned char onOff);
#line 51 "d:/workspaces/mikroc/connectfour/connectfour.h"
void ConnectFour_NewGame();
#line 6 "D:/Workspaces/MikroC/connectfour/main.c"
char keypadPort at P0;

const char keys[17] = {'\0', '1', '2', '3', 'A', '4', '5', '6', 'B',
 '7', '8', '9', 'C' ,'*', '0', '#', 'D'};

void Init(){
 Timer_Init();
 Keypad_Init();
 Display_Init();
 ConnectFour_Init();
}

void main() {

 char key;
 unsigned char keyIndex;

 unsigned char discInserted;
 unsigned char hasWinner;

 unsigned long startTime;
 unsigned long stopTime;

 Init();


 do{
 do{

 do{
 keyIndex = Keypad_Key_Click();
 key = keys[keyIndex];
 }while(key < '1' || key > '7');

 discInserted = ConnectFour_InsertDisc(key - 48);
 } while(discInserted == 0);

 hasWinner = ConnectFour_CheckWinner();
#line 70 "D:/Workspaces/MikroC/connectfour/main.c"
 if(hasWinner == 0){

 ConnectFour_SwitchPlayer();
 }else{
 break;
 }
 } while(1);
}
