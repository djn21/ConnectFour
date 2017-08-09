#line 1 "D:/Workspaces/MikroC/connectfour/timer.c"
#line 1 "d:/workspaces/mikroc/connectfour/timer.h"
#line 16 "d:/workspaces/mikroc/connectfour/timer.h"
void Timer_Init();
#line 23 "d:/workspaces/mikroc/connectfour/timer.h"
unsigned long Timer_Miliseconds();
#line 10 "D:/Workspaces/MikroC/connectfour/timer.c"
static unsigned long mMiliseconds;
#line 17 "D:/Workspaces/MikroC/connectfour/timer.c"
void Timer_Init(){
 mMiliseconds = 0;

 TMOD |= 0x10;

 TH1 = 0xFC;
 TL1 = 0xBE;

 IE |= 0x88;

 TR1_bit = 1;
}
#line 35 "D:/Workspaces/MikroC/connectfour/timer.c"
unsigned long Timer_Miliseconds(){
 return mMiliseconds;
}
#line 44 "D:/Workspaces/MikroC/connectfour/timer.c"
void Timer_Tick() iv IVT_ADDR_ET1 {

 TR1_bit = 0;

 TH1 = 0xFC;
 TL1 = 0xBE;

 mMiliseconds++;

 TR1_bit = 1;
}
