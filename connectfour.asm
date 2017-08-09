
_ConnectFour_Init:
;connectfour.c,29 :: 		void ConnectFour_Init(){
;connectfour.c,31 :: 		mCurrentPlayerColor = COLOR_RED;
	MOV connectfour_mCurrentPlayerColor+0, #1
;connectfour.c,32 :: 		Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
	MOV FARG_Graphics_HorizontalLine_row+0, #7
	MOV FARG_Graphics_HorizontalLine_column_start+0, #0
	MOV FARG_Graphics_HorizontalLine_column_end+0, #7
	MOV FARG_Graphics_HorizontalLine_color+0, #1
	LCALL _Graphics_HorizontalLine+0
;connectfour.c,33 :: 		}
	RET
; end of _ConnectFour_Init

_ConnectFour_SwitchPlayer:
;connectfour.c,40 :: 		void ConnectFour_SwitchPlayer(){
;connectfour.c,41 :: 		if(mCurrentPlayerColor == COLOR_RED){
	MOV A, connectfour_mCurrentPlayerColor+0
	XRL A, #1
	JNZ L_ConnectFour_SwitchPlayer0
;connectfour.c,42 :: 		mCurrentPlayerColor = COLOR_GREEN;
	MOV connectfour_mCurrentPlayerColor+0, #2
;connectfour.c,43 :: 		Graphics_HorizontalLine(7, 0, 7, COLOR_GREEN);
	MOV FARG_Graphics_HorizontalLine_row+0, #7
	MOV FARG_Graphics_HorizontalLine_column_start+0, #0
	MOV FARG_Graphics_HorizontalLine_column_end+0, #7
	MOV FARG_Graphics_HorizontalLine_color+0, #2
	LCALL _Graphics_HorizontalLine+0
;connectfour.c,44 :: 		}else if(mCurrentPlayerColor == COLOR_GREEN){
	SJMP L_ConnectFour_SwitchPlayer1
L_ConnectFour_SwitchPlayer0:
	MOV A, connectfour_mCurrentPlayerColor+0
	XRL A, #2
	JNZ L_ConnectFour_SwitchPlayer2
;connectfour.c,45 :: 		mCurrentPlayerColor = COLOR_RED;
	MOV connectfour_mCurrentPlayerColor+0, #1
;connectfour.c,46 :: 		Graphics_HorizontalLine(7, 0, 7, COLOR_RED);
	MOV FARG_Graphics_HorizontalLine_row+0, #7
	MOV FARG_Graphics_HorizontalLine_column_start+0, #0
	MOV FARG_Graphics_HorizontalLine_column_end+0, #7
	MOV FARG_Graphics_HorizontalLine_color+0, #1
	LCALL _Graphics_HorizontalLine+0
;connectfour.c,47 :: 		}
L_ConnectFour_SwitchPlayer2:
L_ConnectFour_SwitchPlayer1:
;connectfour.c,48 :: 		}
	RET
; end of _ConnectFour_SwitchPlayer

_ConnectFour_InsertDisc:
;connectfour.c,55 :: 		unsigned char ConnectFour_InsertDisc(unsigned char column){
;connectfour.c,59 :: 		for(i = 5; i >= 0; i--){
	MOV ConnectFour_InsertDisc_i_L0+0, #5
L_ConnectFour_InsertDisc3:
	CLR C
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_InsertDisc_i_L0+0
	XRL A, #128
	SUBB A, R0
	JC L_ConnectFour_InsertDisc4
;connectfour.c,60 :: 		if(mGameMatrix[i][column - 1] == COLOR_BLACK){
	MOV B+0, ConnectFour_InsertDisc_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R2, A
	CLR C
	MOV A, FARG_ConnectFour_InsertDisc_column+0
	SUBB A, #1
	MOV R0, A
	CLR A
	SUBB A, #0
	MOV R1, A
	MOV A, R2
	ADD A, R0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	JNZ L_ConnectFour_InsertDisc6
;connectfour.c,61 :: 		mGameMatrix[i][column - 1] = mCurrentPlayerColor;
	MOV B+0, ConnectFour_InsertDisc_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R2, A
	CLR C
	MOV A, FARG_ConnectFour_InsertDisc_column+0
	SUBB A, #1
	MOV R0, A
	CLR A
	SUBB A, #0
	MOV R1, A
	MOV A, R2
	ADD A, R0
	MOV R0, A
	MOV @R0, connectfour_mCurrentPlayerColor+0
;connectfour.c,62 :: 		mDiscXPostition = i;
	MOV connectfour_mDiscXPostition+0, ConnectFour_InsertDisc_i_L0+0
;connectfour.c,63 :: 		mDiscYPosition = column - 1;
	CLR C
	MOV A, FARG_ConnectFour_InsertDisc_column+0
	SUBB A, #1
	MOV connectfour_mDiscYPosition+0, A
;connectfour.c,64 :: 		break;
	SJMP L_ConnectFour_InsertDisc4
;connectfour.c,65 :: 		}
L_ConnectFour_InsertDisc6:
;connectfour.c,59 :: 		for(i = 5; i >= 0; i--){
	DEC ConnectFour_InsertDisc_i_L0+0
;connectfour.c,66 :: 		}
	SJMP L_ConnectFour_InsertDisc3
L_ConnectFour_InsertDisc4:
;connectfour.c,68 :: 		for(j = 0; j < i; j++){
	MOV ConnectFour_InsertDisc_j_L0+0, #0
L_ConnectFour_InsertDisc7:
	CLR C
	MOV A, ConnectFour_InsertDisc_i_L0+0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_InsertDisc_j_L0+0
	XRL A, #128
	SUBB A, R0
	JNC L_ConnectFour_InsertDisc8
;connectfour.c,69 :: 		Graphics_SetPixel(j, column, mCurrentPlayerColor);
	MOV FARG_Graphics_SetPixel_row+0, ConnectFour_InsertDisc_j_L0+0
	MOV FARG_Graphics_SetPixel_column+0, FARG_ConnectFour_InsertDisc_column+0
	MOV FARG_Graphics_SetPixel_color+0, connectfour_mCurrentPlayerColor+0
	LCALL _Graphics_SetPixel+0
;connectfour.c,70 :: 		Delay_ms(100);
	MOV R6, 163
	MOV R7, 30
	DJNZ R7, 
	DJNZ R6, 
	NOP
;connectfour.c,71 :: 		Graphics_SetPixel(j, column, COLOR_BLACK);
	MOV FARG_Graphics_SetPixel_row+0, ConnectFour_InsertDisc_j_L0+0
	MOV FARG_Graphics_SetPixel_column+0, FARG_ConnectFour_InsertDisc_column+0
	MOV FARG_Graphics_SetPixel_color+0, #0
	LCALL _Graphics_SetPixel+0
;connectfour.c,68 :: 		for(j = 0; j < i; j++){
	INC ConnectFour_InsertDisc_j_L0+0
;connectfour.c,72 :: 		}
	SJMP L_ConnectFour_InsertDisc7
L_ConnectFour_InsertDisc8:
;connectfour.c,74 :: 		if(i >= 0){
	CLR C
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, ConnectFour_InsertDisc_i_L0+0
	XRL A, #128
	SUBB A, R0
	JC L_ConnectFour_InsertDisc10
;connectfour.c,75 :: 		Graphics_SetPixel(i, column, mCurrentPlayerColor);
	MOV FARG_Graphics_SetPixel_row+0, ConnectFour_InsertDisc_i_L0+0
	MOV FARG_Graphics_SetPixel_column+0, FARG_ConnectFour_InsertDisc_column+0
	MOV FARG_Graphics_SetPixel_color+0, connectfour_mCurrentPlayerColor+0
	LCALL _Graphics_SetPixel+0
;connectfour.c,76 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,77 :: 		}else{
L_ConnectFour_InsertDisc10:
;connectfour.c,78 :: 		return 0;
	MOV R0, #0
;connectfour.c,80 :: 		}
	RET
; end of _ConnectFour_InsertDisc

_ConnectFour_CheckWinner:
;connectfour.c,87 :: 		unsigned char ConnectFour_CheckWinner(){
;connectfour.c,90 :: 		unsigned char hits = 0;
	MOV ConnectFour_CheckWinner_hits_L0+0, #0
;connectfour.c,92 :: 		for(j = mDiscYPosition; j >= 0; j--){
	MOV ConnectFour_CheckWinner_j_L0+0, connectfour_mDiscYPosition+0
L_ConnectFour_CheckWinner12:
	CLR C
	MOV A, ConnectFour_CheckWinner_j_L0+0
	SUBB A, #0
	JC L_ConnectFour_CheckWinner13
;connectfour.c,93 :: 		if(mGameMatrix[mDiscXPostition][j] == mCurrentPlayerColor){
	MOV B+0, connectfour_mDiscXPostition+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner15
;connectfour.c,94 :: 		mWinnersDiscsPosition[hits][0] = mDiscXPostition;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner86
L__ConnectFour_CheckWinner87:
	CLR C
	RLC A
L__ConnectFour_CheckWinner86:
	DJNZ R1, L__ConnectFour_CheckWinner87
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, connectfour_mDiscXPostition+0
;connectfour.c,95 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner88
L__ConnectFour_CheckWinner89:
	CLR C
	RLC A
L__ConnectFour_CheckWinner88:
	DJNZ R1, L__ConnectFour_CheckWinner89
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,96 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner16
;connectfour.c,97 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,98 :: 		}
L_ConnectFour_CheckWinner16:
;connectfour.c,99 :: 		}else{
	SJMP L_ConnectFour_CheckWinner17
L_ConnectFour_CheckWinner15:
;connectfour.c,100 :: 		break;
	SJMP L_ConnectFour_CheckWinner13
;connectfour.c,101 :: 		}
L_ConnectFour_CheckWinner17:
;connectfour.c,92 :: 		for(j = mDiscYPosition; j >= 0; j--){
	DEC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,102 :: 		}
	SJMP L_ConnectFour_CheckWinner12
L_ConnectFour_CheckWinner13:
;connectfour.c,104 :: 		for(j = mDiscYPosition + 1; j < 7; j++){
	MOV A, connectfour_mDiscYPosition+0
	ADD A, #1
	MOV ConnectFour_CheckWinner_j_L0+0, A
L_ConnectFour_CheckWinner18:
	CLR C
	MOV A, ConnectFour_CheckWinner_j_L0+0
	SUBB A, #7
	JNC L_ConnectFour_CheckWinner19
;connectfour.c,105 :: 		if(mGameMatrix[mDiscXPostition][j] == mCurrentPlayerColor){
	MOV B+0, connectfour_mDiscXPostition+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner21
;connectfour.c,106 :: 		mWinnersDiscsPosition[hits][0] = mDiscXPostition;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner90
L__ConnectFour_CheckWinner91:
	CLR C
	RLC A
L__ConnectFour_CheckWinner90:
	DJNZ R1, L__ConnectFour_CheckWinner91
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, connectfour_mDiscXPostition+0
;connectfour.c,107 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner92
L__ConnectFour_CheckWinner93:
	CLR C
	RLC A
L__ConnectFour_CheckWinner92:
	DJNZ R1, L__ConnectFour_CheckWinner93
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,108 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner22
;connectfour.c,109 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,110 :: 		}
L_ConnectFour_CheckWinner22:
;connectfour.c,111 :: 		}else{
	SJMP L_ConnectFour_CheckWinner23
L_ConnectFour_CheckWinner21:
;connectfour.c,112 :: 		break;
	SJMP L_ConnectFour_CheckWinner19
;connectfour.c,113 :: 		}
L_ConnectFour_CheckWinner23:
;connectfour.c,104 :: 		for(j = mDiscYPosition + 1; j < 7; j++){
	INC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,114 :: 		}
	SJMP L_ConnectFour_CheckWinner18
L_ConnectFour_CheckWinner19:
;connectfour.c,116 :: 		hits = 0;
	MOV ConnectFour_CheckWinner_hits_L0+0, #0
;connectfour.c,118 :: 		for(i = mDiscXPostition, j = mDiscYPosition; i < 6 && j >= 0; i++, j--){
	MOV ConnectFour_CheckWinner_i_L0+0, connectfour_mDiscXPostition+0
	MOV ConnectFour_CheckWinner_j_L0+0, connectfour_mDiscYPosition+0
L_ConnectFour_CheckWinner24:
	CLR C
	MOV A, ConnectFour_CheckWinner_i_L0+0
	SUBB A, #6
	JNC L_ConnectFour_CheckWinner25
	CLR C
	MOV A, ConnectFour_CheckWinner_j_L0+0
	SUBB A, #0
	JC L_ConnectFour_CheckWinner25
L__ConnectFour_CheckWinner85:
;connectfour.c,119 :: 		if(mGameMatrix[i][j] == mCurrentPlayerColor){
	MOV B+0, ConnectFour_CheckWinner_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner29
;connectfour.c,120 :: 		mWinnersDiscsPosition[hits][0] = i;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner94
L__ConnectFour_CheckWinner95:
	CLR C
	RLC A
L__ConnectFour_CheckWinner94:
	DJNZ R1, L__ConnectFour_CheckWinner95
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, ConnectFour_CheckWinner_i_L0+0
;connectfour.c,121 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner96
L__ConnectFour_CheckWinner97:
	CLR C
	RLC A
L__ConnectFour_CheckWinner96:
	DJNZ R1, L__ConnectFour_CheckWinner97
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,122 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner30
;connectfour.c,123 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,124 :: 		}
L_ConnectFour_CheckWinner30:
;connectfour.c,125 :: 		}else{
	SJMP L_ConnectFour_CheckWinner31
L_ConnectFour_CheckWinner29:
;connectfour.c,126 :: 		break;
	SJMP L_ConnectFour_CheckWinner25
;connectfour.c,127 :: 		}
L_ConnectFour_CheckWinner31:
;connectfour.c,118 :: 		for(i = mDiscXPostition, j = mDiscYPosition; i < 6 && j >= 0; i++, j--){
	INC ConnectFour_CheckWinner_i_L0+0
	DEC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,128 :: 		}
	SJMP L_ConnectFour_CheckWinner24
L_ConnectFour_CheckWinner25:
;connectfour.c,130 :: 		for(i = mDiscXPostition - 1, j = mDiscYPosition + 1; i >= 0 && j < 7; i--, j++){
	CLR C
	MOV A, connectfour_mDiscXPostition+0
	SUBB A, #1
	MOV ConnectFour_CheckWinner_i_L0+0, A
	MOV A, connectfour_mDiscYPosition+0
	ADD A, #1
	MOV ConnectFour_CheckWinner_j_L0+0, A
L_ConnectFour_CheckWinner32:
	CLR C
	MOV A, ConnectFour_CheckWinner_i_L0+0
	SUBB A, #0
	JC L_ConnectFour_CheckWinner33
	CLR C
	MOV A, ConnectFour_CheckWinner_j_L0+0
	SUBB A, #7
	JNC L_ConnectFour_CheckWinner33
L__ConnectFour_CheckWinner84:
;connectfour.c,131 :: 		if(mGameMatrix[i][j] == mCurrentPlayerColor){
	MOV B+0, ConnectFour_CheckWinner_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner37
;connectfour.c,132 :: 		mWinnersDiscsPosition[hits][0] = i;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner98
L__ConnectFour_CheckWinner99:
	CLR C
	RLC A
L__ConnectFour_CheckWinner98:
	DJNZ R1, L__ConnectFour_CheckWinner99
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, ConnectFour_CheckWinner_i_L0+0
;connectfour.c,133 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner100
L__ConnectFour_CheckWinner101:
	CLR C
	RLC A
L__ConnectFour_CheckWinner100:
	DJNZ R1, L__ConnectFour_CheckWinner101
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,134 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner38
;connectfour.c,135 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,136 :: 		}
L_ConnectFour_CheckWinner38:
;connectfour.c,137 :: 		}else{
	SJMP L_ConnectFour_CheckWinner39
L_ConnectFour_CheckWinner37:
;connectfour.c,138 :: 		break;
	SJMP L_ConnectFour_CheckWinner33
;connectfour.c,139 :: 		}
L_ConnectFour_CheckWinner39:
;connectfour.c,130 :: 		for(i = mDiscXPostition - 1, j = mDiscYPosition + 1; i >= 0 && j < 7; i--, j++){
	DEC ConnectFour_CheckWinner_i_L0+0
	INC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,140 :: 		}
	SJMP L_ConnectFour_CheckWinner32
L_ConnectFour_CheckWinner33:
;connectfour.c,142 :: 		hits = 0;
	MOV ConnectFour_CheckWinner_hits_L0+0, #0
;connectfour.c,144 :: 		for(i = mDiscXPostition, j = mDiscYPosition; i >= 0 && j >= 0; i--, j--){
	MOV ConnectFour_CheckWinner_i_L0+0, connectfour_mDiscXPostition+0
	MOV ConnectFour_CheckWinner_j_L0+0, connectfour_mDiscYPosition+0
L_ConnectFour_CheckWinner40:
	CLR C
	MOV A, ConnectFour_CheckWinner_i_L0+0
	SUBB A, #0
	JC L_ConnectFour_CheckWinner41
	CLR C
	MOV A, ConnectFour_CheckWinner_j_L0+0
	SUBB A, #0
	JC L_ConnectFour_CheckWinner41
L__ConnectFour_CheckWinner83:
;connectfour.c,145 :: 		if(mGameMatrix[i][j] == mCurrentPlayerColor){
	MOV B+0, ConnectFour_CheckWinner_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner45
;connectfour.c,146 :: 		mWinnersDiscsPosition[hits][0] = i;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner102
L__ConnectFour_CheckWinner103:
	CLR C
	RLC A
L__ConnectFour_CheckWinner102:
	DJNZ R1, L__ConnectFour_CheckWinner103
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, ConnectFour_CheckWinner_i_L0+0
;connectfour.c,147 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner104
L__ConnectFour_CheckWinner105:
	CLR C
	RLC A
L__ConnectFour_CheckWinner104:
	DJNZ R1, L__ConnectFour_CheckWinner105
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,148 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner46
;connectfour.c,149 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,150 :: 		}
L_ConnectFour_CheckWinner46:
;connectfour.c,151 :: 		}else{
	SJMP L_ConnectFour_CheckWinner47
L_ConnectFour_CheckWinner45:
;connectfour.c,152 :: 		break;
	SJMP L_ConnectFour_CheckWinner41
;connectfour.c,153 :: 		}
L_ConnectFour_CheckWinner47:
;connectfour.c,144 :: 		for(i = mDiscXPostition, j = mDiscYPosition; i >= 0 && j >= 0; i--, j--){
	DEC ConnectFour_CheckWinner_i_L0+0
	DEC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,154 :: 		}
	SJMP L_ConnectFour_CheckWinner40
L_ConnectFour_CheckWinner41:
;connectfour.c,156 :: 		for(i = mDiscXPostition + 1, j = mDiscYPosition + 1; i < 6 && j < 7; i++, j++){
	MOV A, connectfour_mDiscXPostition+0
	ADD A, #1
	MOV ConnectFour_CheckWinner_i_L0+0, A
	MOV A, connectfour_mDiscYPosition+0
	ADD A, #1
	MOV ConnectFour_CheckWinner_j_L0+0, A
L_ConnectFour_CheckWinner48:
	CLR C
	MOV A, ConnectFour_CheckWinner_i_L0+0
	SUBB A, #6
	JNC L_ConnectFour_CheckWinner49
	CLR C
	MOV A, ConnectFour_CheckWinner_j_L0+0
	SUBB A, #7
	JNC L_ConnectFour_CheckWinner49
L__ConnectFour_CheckWinner82:
;connectfour.c,157 :: 		if(mGameMatrix[i][j] == mCurrentPlayerColor){
	MOV B+0, ConnectFour_CheckWinner_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, ConnectFour_CheckWinner_j_L0+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner53
;connectfour.c,158 :: 		mWinnersDiscsPosition[hits][0] = i;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner106
L__ConnectFour_CheckWinner107:
	CLR C
	RLC A
L__ConnectFour_CheckWinner106:
	DJNZ R1, L__ConnectFour_CheckWinner107
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, ConnectFour_CheckWinner_i_L0+0
;connectfour.c,159 :: 		mWinnersDiscsPosition[hits][1] = j;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner108
L__ConnectFour_CheckWinner109:
	CLR C
	RLC A
L__ConnectFour_CheckWinner108:
	DJNZ R1, L__ConnectFour_CheckWinner109
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, ConnectFour_CheckWinner_j_L0+0
;connectfour.c,160 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner54
;connectfour.c,161 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,162 :: 		}
L_ConnectFour_CheckWinner54:
;connectfour.c,163 :: 		}else{
	SJMP L_ConnectFour_CheckWinner55
L_ConnectFour_CheckWinner53:
;connectfour.c,164 :: 		break;
	SJMP L_ConnectFour_CheckWinner49
;connectfour.c,165 :: 		}
L_ConnectFour_CheckWinner55:
;connectfour.c,156 :: 		for(i = mDiscXPostition + 1, j = mDiscYPosition + 1; i < 6 && j < 7; i++, j++){
	INC ConnectFour_CheckWinner_i_L0+0
	INC ConnectFour_CheckWinner_j_L0+0
;connectfour.c,166 :: 		}
	SJMP L_ConnectFour_CheckWinner48
L_ConnectFour_CheckWinner49:
;connectfour.c,168 :: 		hits = 0;
	MOV ConnectFour_CheckWinner_hits_L0+0, #0
;connectfour.c,170 :: 		for(i = mDiscXPostition; i < 6; i++){
	MOV ConnectFour_CheckWinner_i_L0+0, connectfour_mDiscXPostition+0
L_ConnectFour_CheckWinner56:
	CLR C
	MOV A, ConnectFour_CheckWinner_i_L0+0
	SUBB A, #6
	JNC L_ConnectFour_CheckWinner57
;connectfour.c,171 :: 		if(mGameMatrix[i][mDiscYPosition] == mCurrentPlayerColor){
	MOV B+0, ConnectFour_CheckWinner_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #connectfour_mGameMatrix+0
	ADD A, R0
	MOV R0, A
	ADD A, connectfour_mDiscYPosition+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, connectfour_mCurrentPlayerColor+0
	JNZ L_ConnectFour_CheckWinner59
;connectfour.c,172 :: 		mWinnersDiscsPosition[hits][0] = i;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner110
L__ConnectFour_CheckWinner111:
	CLR C
	RLC A
L__ConnectFour_CheckWinner110:
	DJNZ R1, L__ConnectFour_CheckWinner111
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	MOV @R0, ConnectFour_CheckWinner_i_L0+0
;connectfour.c,173 :: 		mWinnersDiscsPosition[hits][1] = mDiscYPosition;
	MOV R1, #1
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	INC R1
	SJMP L__ConnectFour_CheckWinner112
L__ConnectFour_CheckWinner113:
	CLR C
	RLC A
L__ConnectFour_CheckWinner112:
	DJNZ R1, L__ConnectFour_CheckWinner113
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	INC R0
	MOV @R0, connectfour_mDiscYPosition+0
;connectfour.c,174 :: 		if(++hits == 4){
	INC ConnectFour_CheckWinner_hits_L0+0
	MOV A, ConnectFour_CheckWinner_hits_L0+0
	XRL A, #4
	JNZ L_ConnectFour_CheckWinner60
;connectfour.c,175 :: 		return 1;
	MOV R0, #1
	RET
;connectfour.c,176 :: 		}
L_ConnectFour_CheckWinner60:
;connectfour.c,177 :: 		}else{
	SJMP L_ConnectFour_CheckWinner61
L_ConnectFour_CheckWinner59:
;connectfour.c,178 :: 		break;
	SJMP L_ConnectFour_CheckWinner57
;connectfour.c,179 :: 		}
L_ConnectFour_CheckWinner61:
;connectfour.c,170 :: 		for(i = mDiscXPostition; i < 6; i++){
	INC ConnectFour_CheckWinner_i_L0+0
;connectfour.c,180 :: 		}
	SJMP L_ConnectFour_CheckWinner56
L_ConnectFour_CheckWinner57:
;connectfour.c,181 :: 		return 0;
	MOV R0, #0
;connectfour.c,182 :: 		}
	RET
; end of _ConnectFour_CheckWinner

_ConnectForur_TurnWinnersDiscs:
;connectfour.c,189 :: 		void ConnectForur_TurnWinnersDiscs(unsigned char onOff){
;connectfour.c,192 :: 		if(onOff == 0){
	MOV A, FARG_ConnectForur_TurnWinnersDiscs_onOff+0
	JNZ L_ConnectForur_TurnWinnersDiscs62
;connectfour.c,193 :: 		for(i = 0; i < 4; i++){
	MOV ConnectForur_TurnWinnersDiscs_i_L0+0, #0
L_ConnectForur_TurnWinnersDiscs63:
	CLR C
	MOV A, ConnectForur_TurnWinnersDiscs_i_L0+0
	SUBB A, #4
	JNC L_ConnectForur_TurnWinnersDiscs64
;connectfour.c,194 :: 		Graphics_SetPixel(mWinnersDiscsPosition[i][1] + 1, mWinnersDiscsPosition[i][0],
	MOV R1, #1
	MOV A, ConnectForur_TurnWinnersDiscs_i_L0+0
	INC R1
	SJMP L__ConnectForur_TurnWinnersDiscs114
L__ConnectForur_TurnWinnersDiscs115:
	CLR C
	RLC A
L__ConnectForur_TurnWinnersDiscs114:
	DJNZ R1, L__ConnectForur_TurnWinnersDiscs115
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	ADD A, #1
	MOV R1, A
	MOV A, @R1
	ADD A, #1
	MOV FARG_Graphics_SetPixel_row+0, A
	MOV FARG_Graphics_SetPixel_column+0, @R0
;connectfour.c,195 :: 		COLOR_BLACK);
	MOV FARG_Graphics_SetPixel_color+0, #0
	LCALL _Graphics_SetPixel+0
;connectfour.c,193 :: 		for(i = 0; i < 4; i++){
	INC ConnectForur_TurnWinnersDiscs_i_L0+0
;connectfour.c,196 :: 		}
	SJMP L_ConnectForur_TurnWinnersDiscs63
L_ConnectForur_TurnWinnersDiscs64:
;connectfour.c,197 :: 		}
	SJMP L_ConnectForur_TurnWinnersDiscs66
L_ConnectForur_TurnWinnersDiscs62:
;connectfour.c,200 :: 		for(i = 0; i < 4; i++){
	MOV ConnectForur_TurnWinnersDiscs_i_L0+0, #0
L_ConnectForur_TurnWinnersDiscs67:
	CLR C
	MOV A, ConnectForur_TurnWinnersDiscs_i_L0+0
	SUBB A, #4
	JNC L_ConnectForur_TurnWinnersDiscs68
;connectfour.c,201 :: 		Graphics_SetPixel(mWinnersDiscsPosition[i][1] + 1, mWinnersDiscsPosition[i][0],
	MOV R1, #1
	MOV A, ConnectForur_TurnWinnersDiscs_i_L0+0
	INC R1
	SJMP L__ConnectForur_TurnWinnersDiscs116
L__ConnectForur_TurnWinnersDiscs117:
	CLR C
	RLC A
L__ConnectForur_TurnWinnersDiscs116:
	DJNZ R1, L__ConnectForur_TurnWinnersDiscs117
	MOV R0, A
	MOV A, #connectfour_mWinnersDiscsPosition+0
	ADD A, R0
	MOV R0, A
	ADD A, #1
	MOV R1, A
	MOV A, @R1
	ADD A, #1
	MOV FARG_Graphics_SetPixel_row+0, A
	MOV FARG_Graphics_SetPixel_column+0, @R0
;connectfour.c,202 :: 		mCurrentPlayerColor);
	MOV FARG_Graphics_SetPixel_color+0, connectfour_mCurrentPlayerColor+0
	LCALL _Graphics_SetPixel+0
;connectfour.c,200 :: 		for(i = 0; i < 4; i++){
	INC ConnectForur_TurnWinnersDiscs_i_L0+0
;connectfour.c,203 :: 		}
	SJMP L_ConnectForur_TurnWinnersDiscs67
L_ConnectForur_TurnWinnersDiscs68:
;connectfour.c,204 :: 		}
L_ConnectForur_TurnWinnersDiscs66:
;connectfour.c,205 :: 		}
	RET
; end of _ConnectForur_TurnWinnersDiscs

_ConnectFour_NewGame:
;connectfour.c,212 :: 		void ConnectFour_NewGame(){
;connectfour.c,216 :: 		for(i = 0; i < 6; i++){
	MOV ConnectFour_NewGame_i_L0+0, #0
L_ConnectFour_NewGame70:
	CLR C
	MOV A, ConnectFour_NewGame_i_L0+0
	SUBB A, #6
	JNC L_ConnectFour_NewGame71
;connectfour.c,217 :: 		for(j = 0; j < 7; j++){
	MOV ConnectFour_NewGame_j_L0+0, #0
L_ConnectFour_NewGame73:
	CLR C
	MOV A, ConnectFour_NewGame_j_L0+0
	SUBB A, #7
	JNC L_ConnectFour_NewGame74
	INC ConnectFour_NewGame_j_L0+0
;connectfour.c,219 :: 		}
	SJMP L_ConnectFour_NewGame73
L_ConnectFour_NewGame74:
;connectfour.c,216 :: 		for(i = 0; i < 6; i++){
	INC ConnectFour_NewGame_i_L0+0
;connectfour.c,220 :: 		}
	SJMP L_ConnectFour_NewGame70
L_ConnectFour_NewGame71:
;connectfour.c,222 :: 		for(i = 0; i < 4; i++){
	MOV ConnectFour_NewGame_i_L0+0, #0
L_ConnectFour_NewGame76:
	CLR C
	MOV A, ConnectFour_NewGame_i_L0+0
	SUBB A, #4
	JNC L_ConnectFour_NewGame77
;connectfour.c,223 :: 		for(j = 0; j < 2; j++){
	MOV ConnectFour_NewGame_j_L0+0, #0
L_ConnectFour_NewGame79:
	CLR C
	MOV A, ConnectFour_NewGame_j_L0+0
	SUBB A, #2
	JNC L_ConnectFour_NewGame80
	INC ConnectFour_NewGame_j_L0+0
;connectfour.c,225 :: 		}
	SJMP L_ConnectFour_NewGame79
L_ConnectFour_NewGame80:
;connectfour.c,222 :: 		for(i = 0; i < 4; i++){
	INC ConnectFour_NewGame_i_L0+0
;connectfour.c,226 :: 		}
	SJMP L_ConnectFour_NewGame76
L_ConnectFour_NewGame77:
;connectfour.c,228 :: 		Graphics_ClearDisplay();
	LCALL _Graphics_ClearDisplay+0
;connectfour.c,231 :: 		}
	RET
; end of _ConnectFour_NewGame
