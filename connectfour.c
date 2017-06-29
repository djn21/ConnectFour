#include <connectfour.h>
#include <graphics.h>

unsigned short game_mat[6][7] = {{0, 0, 0, 0, 0, 0, 0},
                                 {0, 0, 0, 0, 0, 0, 0},
                                 {0, 0, 0, 0, 0, 0, 0},
                                 {0, 0, 0, 0, 0, 0, 0},
                                 {0, 0, 0, 0, 0, 0, 0},
                                 {0, 0, 0, 0, 0, 0, 0}};
                                 
unsigned short player;

/******************************************************************************
* Initialize connect four game
******************************************************************************/
void init_connectfour(){
     // draw borders
     hline(0, 0, 6, GREEN);
     vline(1, 7, 6, GREEN);
     // set player
     player = RED;
     vline(0, 7, 7, RED);
}

/******************************************************************************
* Swiching between RED and YELLOW player
******************************************************************************/
void switch_player(){
     if(player == RED){
          player = YELLOW;
          vline(0, 7, 7, YELLOW);
     } else if(player == YELLOW){
          player = RED;
          vline(0, 7, 7, RED);
     }
}

/******************************************************************************
*
******************************************************************************/
void insert_disc(unsigned short column){
     unsigned short i;
     unsigned short j;
     // insert disc into game_mat
     for(i = 5; i >= 0; i--){
          if(game_mat[i][column - 1] == BLACK){
               game_mat[i][column - 1] = player;
               break;
          }
     }
     // simulate inserting disc on display
     for(j = 0; j < i; j++){
           set_pixel(column, j, player);
           Delay_ms(100);
           set_pixel(column, j, BLACK);
     }
     set_pixel(column, i, player);
}