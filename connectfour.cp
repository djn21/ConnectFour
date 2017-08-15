#line 1 "D:/Workspaces/MikroC/connectfour/connectfour.c"
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
#line 11 "D:/Workspaces/MikroC/connectfour/connectfour.c"
static unsigned char mGameMatrix[6][7] = {{0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0}};

static unsigned char mWinnersDiscsPosition[4][2] = {{0, 0}, {0, 0}, {0, 0}, {0, 0}};

static unsigned char mCurrentPlayerColor;

static unsigned char mDiscXPostition, mDiscYPosition;
#line 29 "D:/Workspaces/MikroC/connectfour/connectfour.c"
void ConnectFour_Init(){

 mCurrentPlayerColor = COLOR_RED;
 Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
}
#line 40 "D:/Workspaces/MikroC/connectfour/connectfour.c"
void ConnectFour_SwitchPlayer(){
 if(mCurrentPlayerColor == COLOR_RED){
 mCurrentPlayerColor = COLOR_GREEN;
 Graphics_HorizontalLine(7, 0, 7, COLOR_GREEN);
 }else if(mCurrentPlayerColor == COLOR_GREEN){
 mCurrentPlayerColor = COLOR_RED;
 Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
 }
}
#line 56 "D:/Workspaces/MikroC/connectfour/connectfour.c"
unsigned char ConnectFour_InsertDisc(unsigned char column){
 signed char i;
 signed char j;

 for(i = 5; i >= 0; i--){
 if(mGameMatrix[i][column - 1] == COLOR_BLACK){
 mGameMatrix[i][column - 1] = mCurrentPlayerColor;
 mDiscXPostition = i;
 mDiscYPosition = column - 1;
 break;
 }
 }

 for(j = 0; j < i; j++){
 Graphics_SetPixel(j, column, mCurrentPlayerColor);
 Delay_ms(100);
 Graphics_SetPixel(j, column, COLOR_BLACK);
 }

 if(i >= 0){
 Graphics_SetPixel(i, column, mCurrentPlayerColor);
 return 1;
 }else{
 return 0;
 }
}
#line 88 "D:/Workspaces/MikroC/connectfour/connectfour.c"
unsigned char ConnectFour_CheckWinner(){
 unsigned char i;
 unsigned char j;
 unsigned char hits = 0;

 for(j = mDiscYPosition; j >= 0; j--){
 if(mGameMatrix[mDiscXPostition][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = mDiscXPostition;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 for(j = mDiscYPosition + 1; j < 7; j++){
 if(mGameMatrix[mDiscXPostition][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = mDiscXPostition;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 hits = 0;

 for(i = mDiscXPostition, j = mDiscYPosition; i < 6 && j >= 0; i++, j--){
 if(mGameMatrix[i][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = i;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 for(i = mDiscXPostition - 1, j = mDiscYPosition + 1; i >= 0 && j < 7; i--, j++){
 if(mGameMatrix[i][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = i;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 hits = 0;

 for(i = mDiscXPostition, j = mDiscYPosition; i >= 0 && j >= 0; i--, j--){
 if(mGameMatrix[i][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = i;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 for(i = mDiscXPostition + 1, j = mDiscYPosition + 1; i < 6 && j < 7; i++, j++){
 if(mGameMatrix[i][j] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = i;
 mWinnersDiscsPosition[hits][1] = j;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }

 hits = 0;

 for(i = mDiscXPostition; i < 6; i++){
 if(mGameMatrix[i][mDiscYPosition] == mCurrentPlayerColor){
 mWinnersDiscsPosition[hits][0] = i;
 mWinnersDiscsPosition[hits][1] = mDiscYPosition;
 if(++hits == 4){
 return 1;
 }
 }else{
 break;
 }
 }
 return 0;
}
#line 191 "D:/Workspaces/MikroC/connectfour/connectfour.c"
void ConnectFour_TurnWinnersDiscs(unsigned char onOff){
 unsigned char i;

 if(onOff){
 for(i = 0; i < 4; i++){
 Graphics_SetPixel(mWinnersDiscsPosition[i][0], mWinnersDiscsPosition[i][1] + 1,
 mCurrentPlayerColor);
 }
 }

 else{
 for(i = 0; i < 4; i++){
 Graphics_SetPixel(mWinnersDiscsPosition[i][0], mWinnersDiscsPosition[i][1] + 1,
 COLOR_BLACK);
 }
 }
}
#line 214 "D:/Workspaces/MikroC/connectfour/connectfour.c"
void ConnectFour_NewGame(){
 unsigned char i;
 unsigned char j;

 for(i = 0; i < 6; i++){
 for(j = 0; j < 7; j++){
 mGameMatrix[i][j] == 0;
 }
 }

 for(i = 0; i < 4; i++){
 for(j = 0; j < 2; j++){
 mWinnersDiscsPosition[i][j] == 0;
 }
 }

 Graphics_ClearDisplay();

 ConnectFour_Init();
}
