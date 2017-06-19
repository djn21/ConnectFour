#include <graphics.h>

extern unsigned char mat_red[];
extern unsigned char mat_green[];

/******************************************************************************
*  Sets the pixel of row and column to color specified
******************************************************************************/
void set_pixel(unsigned short row, unsigned short column, Color color){
     switch(color){
          case BLACK:
               mat_red[row] = mat_red[row] & ~(1 << column); // clear RED
               mat_green[row] = mat_green[row] & ~(1 << column); // clear GREEN
               break;
          case RED:
               mat_red[row] = mat_red[row] | (1 << column); // set RED
               mat_green[row] = mat_green[row] & ~(1 << column); // clear GREEN
               break;
          case GREEN:
               mat_red[row] = mat_red[row] & ~(1 << column); // clear RED
               mat_green[row] = mat_green[row] | (1 << column); // set GREEN
               break;
          case YELLOW:
               mat_red[row] = mat_red[row] | (1 << column); // set RED
               mat_green[row] = mat_green[row] | (1 << column); // set GREEN
               break;
     }
}

/******************************************************************************
* Draw a horizontal line on a given row from column_start to column_end
******************************************************************************/
void hline(unsigned short row, unsigned short column_start, unsigned short column_end,
     Color color){
     unsigned short column;
     for(column = column_start; column <= column_end; column++){
          set_pixel(row, column, color);
     }
}

/******************************************************************************
* Draw a vertical line on a given column form row_star to row_end
******************************************************************************/
void vline(unsigned short row_start, unsigned short row_end, unsigned short column,
     Color color){
     unsigned short row;
     for(row = row_start; row <= row_end; row++){
          set_pixel(row, column, color);
     }
}