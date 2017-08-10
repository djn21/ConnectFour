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
* LIMITS:   Parameters row and column must be between 0 and 7
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
* DOES:     Draw a vertical line on a given column from rowStart to rowEnd
* GLOBALS:  This function does not read or write global variables
* LIMITS:   Parameters column, rowStart and rowEnd must be between 0 and 7
* RETURNS:  This function does not return value
*************************************************************************************************/
void Graphics_VerticalLine(unsigned char column, unsigned char rowStart,
        unsigned char rowEnd, Color color){
    unsigned char row;
    for(row = rowStart; row <= rowEnd; row++){
        Graphics_SetPixel(row, column, color);
    }
}

/*************************************************************************************************
* DOES:     Draw a horizontal line on a given row form columnStar to columnEnd
* GLOBALS:  This function does not read or write global variables
* LIMITS:   Parameters row, columnStart and columnEnd must be between 0 and 7
* RETURNS:  This function does not return value
*************************************************************************************************/
void Graphics_HorizontalLine(unsigned char row, unsigned char columnStart, 
        unsigned char columnEnd, Color color){
    unsigned char column;
    for(column = columnStart; column <= columnEnd; column++){
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
