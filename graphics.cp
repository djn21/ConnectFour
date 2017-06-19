#line 1 "C:/Users/Dejan/Documents/connectfour/graphics.c"
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
#line 3 "C:/Users/Dejan/Documents/connectfour/graphics.c"
extern unsigned char mat_red[];
extern unsigned char mat_green[];
#line 9 "C:/Users/Dejan/Documents/connectfour/graphics.c"
void set_pixel(unsigned short row, unsigned short column, Color color){
 switch(color){
 case BLACK:
 mat_red[row] = mat_red[row] & ~(1 << column);
 mat_green[row] = mat_green[row] & ~(1 << column);
 break;
 case RED:
 mat_red[row] = mat_red[row] | (1 << column);
 mat_green[row] = mat_green[row] & ~(1 << column);
 break;
 case GREEN:
 mat_red[row] = mat_red[row] & ~(1 << column);
 mat_green[row] = mat_green[row] | (1 << column);
 break;
 case YELLOW:
 mat_red[row] = mat_red[row] | (1 << column);
 mat_green[row] = mat_green[row] | (1 << column);
 break;
 }
}
#line 33 "C:/Users/Dejan/Documents/connectfour/graphics.c"
void hline(unsigned short row, unsigned short column_start, unsigned short column_end,
 Color color){
 unsigned short column;
 for(column = column_start; column <= column_end; column++){
 set_pixel(row, column, color);
 }
}
#line 44 "C:/Users/Dejan/Documents/connectfour/graphics.c"
void vline(unsigned short row_start, unsigned short row_end, unsigned short column,
 Color color){
 unsigned short row;
 for(row = row_start; row <= row_end; row++){
 set_pixel(row, column, color);
 }
}
