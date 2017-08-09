#line 1 "D:/Workspaces/MikroC/connectfour/graphics.c"
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
#line 10 "D:/Workspaces/MikroC/connectfour/graphics.c"
extern unsigned char gMatrixRed[];
extern unsigned char gMatrixGreen[];
#line 18 "D:/Workspaces/MikroC/connectfour/graphics.c"
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
#line 44 "D:/Workspaces/MikroC/connectfour/graphics.c"
void Graphics_VerticalLine(unsigned char column, unsigned char row_start,
 unsigned char row_end, Color color){
 unsigned char row;
 for(row = row_start; row <= row_end; row++){
 Graphics_SetPixel(row, column, color);
 }
}
#line 57 "D:/Workspaces/MikroC/connectfour/graphics.c"
void Graphics_HorizontalLine(unsigned char row, unsigned char column_start,
 unsigned char column_end, Color color){
 unsigned char column;
 for(column = column_start; column <= column_end; column++){
 Graphics_SetPixel(row, column, color);
 }
}
#line 70 "D:/Workspaces/MikroC/connectfour/graphics.c"
void Graphics_ClearDisplay(){
 unsigned char i;
 for(i = 0; i < 8; i++){
 gMatrixRed[i] = 0x00;
 gMatrixGreen[i] = 0x00;
 }
}
