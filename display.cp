#line 1 "D:/Workspaces/MikroC/connectfour/display.c"
#line 1 "d:/workspaces/mikroc/connectfour/display.h"
#line 16 "d:/workspaces/mikroc/connectfour/display.h"
void Display_Init();
#line 10 "D:/Workspaces/MikroC/connectfour/display.c"
char mRowOutout at P1;
char mRedOutput at P2;
char mGreenOutput at P3;


const unsigned gMatrixRow[8] = {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
unsigned char gMatrixRed[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
unsigned char gMatrixGreen[8] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
#line 24 "D:/Workspaces/MikroC/connectfour/display.c"
void Display_Init(){

 TMOD |= 0x01;

 TH0 = 0xF9;
 TL0 = 0x7D;

 IE |= 0x82;

 TR0_bit = 1;
}
#line 41 "D:/Workspaces/MikroC/connectfour/display.c"
void Display_SetOutput(unsigned char row, unsigned char red, unsigned char green){

 mRedOutput = 0x00;
 mGreenOutput = 0x00;

 mRowOutout = row;

 mRedOutput = red;
 mGreenOutput = green;
}
#line 57 "D:/Workspaces/MikroC/connectfour/display.c"
void Display_Refresh() iv IVT_ADDR_ET0 {
 static unsigned char i = 0;

 TR0_bit = 0;

 TH0 = 0xF9;
 TL0 = 0x7D;

 Display_SetOutput(gMatrixRow[i], gMatrixRed[i], gMatrixGreen[i]);
 i++;

 if(i == 8){
 i = 0;
 }

 TR0_bit = 1;
}
