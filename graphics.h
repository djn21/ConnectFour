#ifndef _GRAPHICS_H_
#define _GRAPHICS_H_

typedef enum Color{
     BLACK,
     RED,
     GREEN,
     YELLOW
} Color;

/******************************************************************************
*  Sets the pixel of row and column to color specified
******************************************************************************/
void set_pixel(unsigned short row, unsigned short column, Color color);

/******************************************************************************
* Draw a horizontal line on a given row from column_start to column_end
******************************************************************************/
void hline(unsigned short row, unsigned short column_start, unsigned short column_end,
     Color color);

/******************************************************************************
* Draw a vertical line on a given column form row_star to row_end
******************************************************************************/
void vline(unsigned short row_start, unsigned short row_end, unsigned short column,
     Color color);

/******************************************************************************
* Clear display. Sets all pixels to BLACK.
******************************************************************************/
void clear_display();

#endif