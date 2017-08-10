/*************************************************************************************************
* MODULE:    GRAPHICS
* CONTAINS:  Functions for working with graphic elements
* COPYRIGHT: Faculty of Electrical Engineering - www.etf.unibl.org
* VERSION:   1.0, 09-AUG-17
*************************************************************************************************/

#ifndef _GRAPHICS_H_
#define _GRAPHICS_H_

typedef enum Color{
     COLOR_BLACK,
     COLOR_RED,
     COLOR_GREEN,
     COLOR_YELLOW
} Color;

/*************************************************************************************************
* DOES:     Sets the pixel of row and column to color specified
* GLOBALS:  Modify gMatrixRed, gMatrixGreen
* LIMITS:   Parameters row and column must be between 0 and 7
* RETURNS:  This function does not return value
*************************************************************************************************/
void Graphics_SetPixel(unsigned char row, unsigned char column, Color color);

/*************************************************************************************************
* DOES:     Draw a vertical line on a given column from rowStart to rowEnd
* GLOBALS:  This function does not read or write global variables
* LIMITS:   Parameters column, rowStart and rowEnd must be between 0 and 7
* RETURNS:  This function does not return value
*************************************************************************************************/
void Graphics_VerticalLine(unsigned char column, unsigned char rowStart,  
        unsigned char rowEnd, Color color);

/*************************************************************************************************
* DOES:     Draw a horizontal line on a given row form columnStar to columnEnd
* GLOBALS:  This function does not read or write global variables
* LIMITS:   Parameters row, columnStart and columnEnd must be between 0 and 7
* RETURNS:  This function does not return value
*************************************************************************************************/
void Graphics_HorizontalLine(unsigned char row, unsigned char columnStart, 
        unsigned char columnEnd, Color color);

/*************************************************************************************************
* DOES:     Clear display. Set all pixels to black color
* GLOBALS:  gMatrixRed, gMatrixGreen
* RETURNS:  This function does not return value
*************************************************************************************************/
void Graphics_ClearDisplay();

#endif
