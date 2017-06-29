#line 1 "D:/Workspaces/MikroC/connectfour/connectfour.c"
#line 1 "d:/workspaces/mikroc/connectfour/connectfour.h"
#line 7 "d:/workspaces/mikroc/connectfour/connectfour.h"
void init_connectfour();
#line 12 "d:/workspaces/mikroc/connectfour/connectfour.h"
void switch_player();
#line 17 "d:/workspaces/mikroc/connectfour/connectfour.h"
void insert_disc(unsigned short position);
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
#line 4 "D:/Workspaces/MikroC/connectfour/connectfour.c"
unsigned short game_mat[6][7] = {{0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0},
 {0, 0, 0, 0, 0, 0, 0}};

unsigned short player;
#line 16 "D:/Workspaces/MikroC/connectfour/connectfour.c"
void init_connectfour(){

 hline(0, 0, 6, GREEN);
 vline(1, 7, 6, GREEN);

 player = RED;
 vline(0, 7, 7, RED);
}
#line 28 "D:/Workspaces/MikroC/connectfour/connectfour.c"
void switch_player(){
 if(player == RED){
 player = YELLOW;
 vline(0, 7, 7, YELLOW);
 } else if(player == YELLOW){
 player = RED;
 vline(0, 7, 7, RED);
 }
}
#line 41 "D:/Workspaces/MikroC/connectfour/connectfour.c"
void insert_disc(unsigned short column){
 unsigned short i;
 unsigned short j;

 for(i = 5; i >= 0; i--){
 if(game_mat[i][column - 1] == BLACK){
 game_mat[i][column - 1] = player;
 break;
 }
 }

 for(j = 0; j < i; j++){
 set_pixel(column, j, player);
 Delay_ms(100);
 set_pixel(column, j, BLACK);
 }
 set_pixel(column, i, player);
}
