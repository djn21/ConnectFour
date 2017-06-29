#line 1 "D:/Workspaces/MikroC/connectfour/display.c"
#line 1 "c:/users/dejan/documents/connectfour/display.h"
#line 7 "c:/users/dejan/documents/connectfour/display.h"
void init_display();
#line 3 "D:/Workspaces/MikroC/connectfour/display.c"
const unsigned char mat_row[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
unsigned char mat_red[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
unsigned char mat_green[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
#line 10 "D:/Workspaces/MikroC/connectfour/display.c"
void init_display(){

 TMOD = 0x01;

 TH0 = 0xF9;
 TL0 = 0x7D;

 IE = 0x82;

 TR0_bit = 1;
}
#line 24 "D:/Workspaces/MikroC/connectfour/display.c"
void set_out(unsigned char row, unsigned char red, unsigned char green){

 P2 = 0x00;
 P3 = 0x00;

 P1 = row;

 P2 = red;
 P3 = green;
}
#line 39 "D:/Workspaces/MikroC/connectfour/display.c"
void refresh_display() iv IVT_ADDR_ET0 {
 static unsigned short i = 0;

 TR0_bit = 0;

 TH0 = 0xF9;
 TL0 = 0x7D;

 set_out(mat_row[i], mat_red[i], mat_green[i]);
 i++;

 if(i == 8)
 i = 0;

 TR0_bit = 1;
}
