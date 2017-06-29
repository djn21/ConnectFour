
_init_connectfour:
;connectfour.c,16 :: 		void init_connectfour(){
;connectfour.c,18 :: 		hline(0, 0, 6, GREEN);
	MOV FARG_hline_row+0, #0
	MOV FARG_hline_column_start+0, #0
	MOV FARG_hline_column_end+0, #6
	MOV FARG_hline_color+0, #2
	LCALL _hline+0
;connectfour.c,19 :: 		vline(1, 7, 6, GREEN);
	MOV FARG_vline_row_start+0, #1
	MOV FARG_vline_row_end+0, #7
	MOV FARG_vline_column+0, #6
	MOV FARG_vline_color+0, #2
	LCALL _vline+0
;connectfour.c,21 :: 		player = RED;
	MOV _player+0, #1
;connectfour.c,22 :: 		vline(0, 7, 7, RED);
	MOV FARG_vline_row_start+0, #0
	MOV FARG_vline_row_end+0, #7
	MOV FARG_vline_column+0, #7
	MOV FARG_vline_color+0, #1
	LCALL _vline+0
;connectfour.c,23 :: 		}
	RET
; end of _init_connectfour

_switch_player:
;connectfour.c,28 :: 		void switch_player(){
;connectfour.c,29 :: 		if(player == RED){
	MOV A, _player+0
	XRL A, #1
	JNZ L_switch_player0
;connectfour.c,30 :: 		player = YELLOW;
	MOV _player+0, #3
;connectfour.c,31 :: 		vline(0, 7, 7, YELLOW);
	MOV FARG_vline_row_start+0, #0
	MOV FARG_vline_row_end+0, #7
	MOV FARG_vline_column+0, #7
	MOV FARG_vline_color+0, #3
	LCALL _vline+0
;connectfour.c,32 :: 		} else if(player == YELLOW){
	SJMP L_switch_player1
L_switch_player0:
	MOV A, _player+0
	XRL A, #3
	JNZ L_switch_player2
;connectfour.c,33 :: 		player = RED;
	MOV _player+0, #1
;connectfour.c,34 :: 		vline(0, 7, 7, RED);
	MOV FARG_vline_row_start+0, #0
	MOV FARG_vline_row_end+0, #7
	MOV FARG_vline_column+0, #7
	MOV FARG_vline_color+0, #1
	LCALL _vline+0
;connectfour.c,35 :: 		}
L_switch_player2:
L_switch_player1:
;connectfour.c,36 :: 		}
	RET
; end of _switch_player

_insert_disc:
;connectfour.c,41 :: 		void insert_disc(unsigned short column){
;connectfour.c,45 :: 		for(i = 5; i >= 0; i--){
	MOV insert_disc_i_L0+0, #5
L_insert_disc3:
	CLR C
	MOV A, insert_disc_i_L0+0
	SUBB A, #0
	JC L_insert_disc4
;connectfour.c,46 :: 		if(game_mat[i][column - 1] == BLACK){
	MOV B+0, insert_disc_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #_game_mat+0
	ADD A, R0
	MOV R2, A
	CLR C
	MOV A, FARG_insert_disc_column+0
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
	JNZ L_insert_disc6
;connectfour.c,47 :: 		game_mat[i][column - 1] = player;
	MOV B+0, insert_disc_i_L0+0
	MOV A, #7
	MUL AB
	MOV R0, A
	MOV A, #_game_mat+0
	ADD A, R0
	MOV R2, A
	CLR C
	MOV A, FARG_insert_disc_column+0
	SUBB A, #1
	MOV R0, A
	CLR A
	SUBB A, #0
	MOV R1, A
	MOV A, R2
	ADD A, R0
	MOV R0, A
	MOV @R0, _player+0
;connectfour.c,48 :: 		break;
	SJMP L_insert_disc4
;connectfour.c,49 :: 		}
L_insert_disc6:
;connectfour.c,45 :: 		for(i = 5; i >= 0; i--){
	DEC insert_disc_i_L0+0
;connectfour.c,50 :: 		}
	SJMP L_insert_disc3
L_insert_disc4:
;connectfour.c,52 :: 		for(j = 0; j < i; j++){
	MOV insert_disc_j_L0+0, #0
L_insert_disc7:
	CLR C
	MOV A, insert_disc_j_L0+0
	SUBB A, insert_disc_i_L0+0
	JNC L_insert_disc8
;connectfour.c,53 :: 		set_pixel(column, j, player);
	MOV FARG_set_pixel_row+0, FARG_insert_disc_column+0
	MOV FARG_set_pixel_column+0, insert_disc_j_L0+0
	MOV FARG_set_pixel_color+0, _player+0
	LCALL _set_pixel+0
;connectfour.c,54 :: 		Delay_ms(100);
	MOV R6, 163
	MOV R7, 30
	DJNZ R7, 
	DJNZ R6, 
	NOP
;connectfour.c,55 :: 		set_pixel(column, j, BLACK);
	MOV FARG_set_pixel_row+0, FARG_insert_disc_column+0
	MOV FARG_set_pixel_column+0, insert_disc_j_L0+0
	MOV FARG_set_pixel_color+0, #0
	LCALL _set_pixel+0
;connectfour.c,52 :: 		for(j = 0; j < i; j++){
	INC insert_disc_j_L0+0
;connectfour.c,56 :: 		}
	SJMP L_insert_disc7
L_insert_disc8:
;connectfour.c,57 :: 		set_pixel(column, i, player);
	MOV FARG_set_pixel_row+0, FARG_insert_disc_column+0
	MOV FARG_set_pixel_column+0, insert_disc_i_L0+0
	MOV FARG_set_pixel_color+0, _player+0
	LCALL _set_pixel+0
;connectfour.c,58 :: 		}
	RET
; end of _insert_disc
