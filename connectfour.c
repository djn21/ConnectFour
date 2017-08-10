/*************************************************************************************************
* MODULE:    CONNECTFOUR
* CONTAINS:  Functions for abstracting connectfour game
* COPYRIGHT: Faculty of Electrical Engineering - www.etf.unibl.org
* VERSION:   1.0, 09-AUG-17
*************************************************************************************************/

#include <connectfour.h>
#include <graphics.h>

static unsigned char mGameMatrix[6][7] = {{0, 0, 0, 0, 0, 0, 0},
                                          {0, 0, 0, 0, 0, 0, 0},
                                          {0, 0, 0, 0, 0, 0, 0},
                                          {0, 0, 0, 0, 0, 0, 0},
                                          {0, 0, 0, 0, 0, 0, 0},
                                          {0, 0, 0, 0, 0, 0, 0}};
                      
static unsigned char mWinnersDiscsPosition[4][2] = {{0, 0}, {0, 0}, {0,0}, {0, 0}};
                                          
static unsigned char mCurrentPlayerColor;

static unsigned char mDiscXPostition, mDiscYPosition;

/*************************************************************************************************
* DOES:     Initialize connectfour
* GLOBALS:  Modify mCurrentPlayerColor
* RETURNS:  This function does not return value
*************************************************************************************************/
void ConnectFour_Init(){
    // set player
    mCurrentPlayerColor = COLOR_RED;
    Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
}

/*************************************************************************************************
* DOES:     Swiching between red and green player
* GLOBALS:  Modify mCurrentPlayerColor
* RETURNS:  This function does not return value
*************************************************************************************************/
void ConnectFour_SwitchPlayer(){
    if(mCurrentPlayerColor == COLOR_RED){
        mCurrentPlayerColor = COLOR_GREEN;
        Graphics_HorizontalLine(7, 0, 7, COLOR_GREEN);
    }else if(mCurrentPlayerColor == COLOR_GREEN){
        mCurrentPlayerColor = COLOR_RED;
        Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
    }
}

/*************************************************************************************************
* DOES:     Insert disc in the appropriate column
* GLOBALS:  Reads mCurrentPlayerColor. Modify mGameMatrix, mDiscXPosition, mDiscYPosition
* LIMITS:   Parameter column must be between 1 and 7
* RETURNS:  Returns 1 if disc inserted successfully, or 0 if not
*************************************************************************************************/
unsigned char ConnectFour_InsertDisc(unsigned char column){
    signed char i;
    signed char j;
    // insert disc into game matrix
    for(i = 5; i >= 0; i--){
        if(mGameMatrix[i][column - 1] == COLOR_BLACK){
            mGameMatrix[i][column - 1] = mCurrentPlayerColor;
            mDiscXPostition = i;
            mDiscYPosition = column - 1;
            break;
        }
    }
    // simulate inserting disc on display
    for(j = 0; j < i; j++){
        Graphics_SetPixel(j, column, mCurrentPlayerColor);
        Delay_ms(100);
        Graphics_SetPixel(j, column, COLOR_BLACK);
    }
    // avoid inserting disc at position with index -1
    if(i >= 0){
         Graphics_SetPixel(i, column, mCurrentPlayerColor);
         return 1;
    }else{
         return 0;
    }
}

/*************************************************************************************************
* DOES:     Check for winner
* GLOBALS:  Reads mGameMatrix, mCurrentPlayerColor. Modify mWinnersDiscsPosition
* RETURNS:  Returns 1 if somone wins the game, or 0 if not
*************************************************************************************************/
unsigned char ConnectFour_CheckWinner(){
    unsigned char i;
    unsigned char j;
    unsigned char hits = 0;
    // check x axis left
    for(j = mDiscYPosition; j >= 0; j--){
        if(mGameMatrix[mDiscXPostition][j] == mCurrentPlayerColor){
            mWinnersDiscsPosition[hits][0] = mDiscXPostition;
            mWinnersDiscsPosition[hits][1] = j;
            if(++hits == 4){
                return 1;
            }
        }else{
            break;
        }
    }
    // check x axis right
    for(j = mDiscYPosition + 1; j < 7; j++){
        if(mGameMatrix[mDiscXPostition][j] == mCurrentPlayerColor){
            mWinnersDiscsPosition[hits][0] = mDiscXPostition;
            mWinnersDiscsPosition[hits][1] = j;
            if(++hits == 4){
                return 1;
            }
        }else{
            break;
        }
    }
    // reset hits
    hits = 0;
    // check d1 left
    for(i = mDiscXPostition, j = mDiscYPosition; i < 6 && j >= 0; i++, j--){
        if(mGameMatrix[i][j] == mCurrentPlayerColor){
            mWinnersDiscsPosition[hits][0] = i;
            mWinnersDiscsPosition[hits][1] = j;
            if(++hits == 4){
                return 1;
            }
        }else{
            break;
        }
    }
    // check d1 right
    for(i = mDiscXPostition - 1, j = mDiscYPosition + 1; i >= 0 && j < 7; i--, j++){
        if(mGameMatrix[i][j] == mCurrentPlayerColor){
            mWinnersDiscsPosition[hits][0] = i;
            mWinnersDiscsPosition[hits][1] = j;
            if(++hits == 4){
                return 1;
            }
        }else{
            break;
        }
    }
    // reset hits
    hits = 0;
    // check d2 left
    for(i = mDiscXPostition, j = mDiscYPosition; i >= 0 && j >= 0; i--, j--){
        if(mGameMatrix[i][j] == mCurrentPlayerColor){
            mWinnersDiscsPosition[hits][0] = i;
            mWinnersDiscsPosition[hits][1] = j;
            if(++hits == 4){
                return 1;
            }
        }else{
            break;
        }
    }
    // check d2 right
    for(i = mDiscXPostition + 1, j = mDiscYPosition + 1; i < 6 && j < 7; i++, j++){
        if(mGameMatrix[i][j] == mCurrentPlayerColor){
            mWinnersDiscsPosition[hits][0] = i;
            mWinnersDiscsPosition[hits][1] = j;
            if(++hits == 4){
                return 1;
            }
        }else{
            break;
        }
    }
    // reset hits
    hits = 0;
    // check y axis down
    for(i = mDiscXPostition; i < 6; i++){
        if(mGameMatrix[i][mDiscYPosition] == mCurrentPlayerColor){
            mWinnersDiscsPosition[hits][0] = i;
            mWinnersDiscsPosition[hits][1] = mDiscYPosition;
            if(++hits == 4){
                return 1;
            }
        }else{
            break;
        }
    }
    return 0;
}

/*************************************************************************************************
* DOES:     Set winners discs blinking
* GLOBALS:  Reads mCurrentPlayerColor, mWinnersDiscsPosition
* LIMITS:   Parameter onOff must be 1 for ON or 0 for OFF
* RETURNS:  This function does not return value
*************************************************************************************************/
void ConnectFour_TurnWinnersDiscs(unsigned char onOff){
    unsigned char i;
    // turn winners discs off
    if(onOff == 0){
        for(i = 0; i < 4; i++){
            Graphics_SetPixel(mWinnersDiscsPosition[i][0], mWinnersDiscsPosition[i][1] + 1,
            COLOR_BLACK);
        }
    }
    // turn winners discs on
    else{
        for(i = 0; i < 4; i++){
            Graphics_SetPixel(mWinnersDiscsPosition[i][0], mWinnersDiscsPosition[i][1] + 1,
            mCurrentPlayerColor);
        }
    }
}

/*************************************************************************************************
* DOES:     Start new game
* GLOBALS:  Modify mGameMatrix, mWinnersDiscsPosition
* RETURNS:  This function does not return value
*************************************************************************************************/
void ConnectFour_NewGame(){
    unsigned char i;
    unsigned char j;
    // clear game matrix
    for(i = 0; i < 6; i++){
        for(j = 0; j < 7; j++){
            mGameMatrix[i][j] == 0;
        }
    }
    // clear winners discs positions
    for(i = 0; i < 4; i++){
        for(j = 0; j < 2; j++){
            mWinnersDiscsPosition[i][j] == 0;
        }
    }
    // clear display
    Graphics_ClearDisplay();
    // init connectfour
    ConnectFour_Init();
}
