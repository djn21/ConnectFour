#line 1 "D:/Workspaces/MikroC/connectfour/graphics.c"
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
#line 10 "D:/Workspaces/MikroC/connectfour/graphics.c"
extern unsigned char gMatrixRed[];
extern unsigned char gMatrixGreen[];
#line 19 "D:/Workspaces/MikroC/connectfour/graphics.c"
void Graphics_SetPixel(unsigned char row, unsigned char column, Color color){
 switch(color){
 case COLOR_BLACK:
 gMatrixRed[column] = gMatrixRed[column] & ~(1 << row);
 gMatrixGreen[column] = gMatrixGreen[column] & ~(1 << row);
 break;
 case COLOR_RED:
 gMatrixRed[column] = gMatrixRed[column] | (1 << row);
 gMatrixGreen[column] = gMatrixGreen[column] & ~(1 << row);
 break;
 case COLOR_GREEN:
 gMatrixRed[column] = gMatrixRed[column] & ~(1 << row);
 gMatrixGreen[column] = gMatrixGreen[column] | (1 << row);
 break;
 case COLOR_YELLOW:
 gMatrixRed[column] = gMatrixRed[column] | (1 << column);
 gMatrixGreen[column] = gMatrixGreen[column] | (1 << column);
 break;
 }
}
#line 46 "D:/Workspaces/MikroC/connectfour/graphics.c"
void Graphics_VerticalLine(unsigned char column, unsigned char rowStart,
 unsigned char rowEnd, Color color){
 unsigned char row;
 for(row = rowStart; row <= rowEnd; row++){
 Graphics_SetPixel(row, column, color);
 }
}
#line 60 "D:/Workspaces/MikroC/connectfour/graphics.c"
void Graphics_HorizontalLine(unsigned char row, unsigned char columnStart,
 unsigned char columnEnd, Color color){
 unsigned char column;
 for(column = columnStart; column <= columnEnd; column++){
 Graphics_SetPixel(row, column, color);
 }
}
#line 73 "D:/Workspaces/MikroC/connectfour/graphics.c"
void Graphics_ClearDisplay(){
 unsigned char i;
 for(i = 0; i < 8; i++){
 gMatrixRed[i] = 0x00;
 gMatrixGreen[i] = 0x00;
 }
}
