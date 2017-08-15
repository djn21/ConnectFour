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
#line 24 "d:/workspaces/mikroc/connectfour/graphics.h"
void Graphics_SetPixel(unsigned char row, unsigned char column, Color color);
#line 32 "d:/workspaces/mikroc/connectfour/graphics.h"
void Graphics_VerticalLine(unsigned char column, unsigned char rowStart,
 unsigned char rowEnd, Color color);
#line 41 "d:/workspaces/mikroc/connectfour/graphics.h"
void Graphics_HorizontalLine(unsigned char row, unsigned char columnStart,
 unsigned char columnEnd, Color color);
#line 49 "d:/workspaces/mikroc/connectfour/graphics.h"
void Graphics_ClearDisplay();
#line 1 "d:/workspaces/mikroc/connectfour/connectfour.h"
#line 16 "d:/workspaces/mikroc/connectfour/connectfour.h"
void ConnectFour_Init();
#line 23 "d:/workspaces/mikroc/connectfour/connectfour.h"
void ConnectFour_SwitchPlayer();
#line 31 "d:/workspaces/mikroc/connectfour/connectfour.h"
unsigned char ConnectFour_InsertDisc(unsigned char column);
#line 38 "d:/workspaces/mikroc/connectfour/connectfour.h"
unsigned char ConnectFour_CheckWinner();
#line 46 "d:/workspaces/mikroc/connectfour/connectfour.h"
void ConnectFour_TurnWinnersDiscs(unsigned char onOff);
#line 53 "d:/workspaces/mikroc/connectfour/connectfour.h"
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
 } else {
 break;
 }
 } while(1);

}
