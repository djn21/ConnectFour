#line 1 "C:/Users/Dejan/Documents/connectfour/connectfour.c"
#line 1 "c:/users/dejan/documents/connectfour/display.h"
#line 7 "c:/users/dejan/documents/connectfour/display.h"
void init_display();
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
#line 4 "C:/Users/Dejan/Documents/connectfour/connectfour.c"
unsigned short i = 0;
unsigned short j = 0;

void main() {
 init_display();
 hline(0, 0, 7, GREEN);
 vline(1, 7, 6, GREEN);
 vline(0, 7, 7, RED);

 set_pixel(3, 5, RED);
 set_pixel(4, 5, GREEN);
}
