#include <display.h>
#include <graphics.h>

void main() {
     init_display();
     hline(0, 0, 7, GREEN);
     vline(1, 7, 6, GREEN);
     vline(0, 7, 7, RED);
     // test
     set_pixel(3, 5, RED);
     set_pixel(4, 5, GREEN);
}