/*************************************************************************************************
* MODULE:    GRAPHICS
* CONTAINS:  Functions for working with graphic elements
* COPYRIGHT: Faculty of Electrical Engineering - www.etf.unibl.org
* VERSION:   1.0, 09-AUG-17
*************************************************************************************************/

#include <graphics.h>

extern unsigned char gMatrixRed[];
extern unsigned char gMatrixGreen[];

/*************************************************************************************************
* DOES:     Sets the pixel of row and column to color specified
* GLOBALS:  Modify gMatrixRed, gMatrixGreen
* RETURNS:  This function does not return value
*************************************************************************************************/
void Graphics_SetPixel(unsigned char row, unsigned char column, Color color){
    switch(color){
        case COLOR_BLACK:
            gMatrixRed[column] = gMatrixRed[column] & ~(1 << row); // clear RED
            gMatrixGreen[column] = gMatrixGreen[column] & ~(1 << row); // clear GREEN
            break;
        case COLOR_RED:
            gMatrixRed[column] = gMatrixRed[column] | (1 << row); // set RED
            gMatrixGreen[column] = gMatrixGreen[column] & ~(1 << row); // clear GREEN
            break;
        case COLOR_GREEN:
            gMatrixRed[column] = gMatrixRed[column] & ~(1 << row); // clear RED
            gMatrixGreen[column] = gMatrixGreen[column] | (1 << row); // set GREEN
            break;
        case COLOR_YELLOW:
            gMatrixRed[column] = gMatrixRed[column] | (1 << column); // set RED
            gMatrixGreen[column] = gMatrixGreen[column] | (1 << column); // set GREEN
            break;
    }
}

/*************************************************************************************************
* DOES:     Draw a vertical line on a given column from row_start to row_end
* GLOBALS:  This function does not read or write global variables
* RETURNS:  This function does not return value
*************************************************************************************************/
void Graphics_VerticalLine(unsigned char column, unsigned char row_start,
        unsigned char row_end, Color color){
    unsigned char row;
    for(row = row_start; row <= row_end; row++){
        Graphics_SetPixel(row, column, color);
    }
}

/*************************************************************************************************
* DOES:     Draw a horizontal line on a given row form column_star to column_end
* GLOBALS:  This function does not read or write global variables
* RETURNS:  This function does not return value
*************************************************************************************************/
void Graphics_HorizontalLine(unsigned char row, unsigned char column_start, 
        unsigned char column_end, Color color){
    unsigned char column;
    for(column = column_start; column <= column_end; column++){
        Graphics_SetPixel(row, column, color);
    }
}

/*************************************************************************************************
* DOES:     Clear display
* GLOBALS:  gMatrixRed, gMatrixGreen
* RETURNS:  This function does not return value
*************************************************************************************************/
void Graphics_ClearDisplay(){
    unsigned char i;
    for(i = 0; i < 8; i++){
        gMatrixRed[i] = 0x00;
        gMatrixGreen[i] = 0x00;
    }
}