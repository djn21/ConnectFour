
_set_pixel:
;graphics.c,9 :: 		void set_pixel(unsigned short row, unsigned short column, Color color){
;graphics.c,10 :: 		switch(color){
	LJMP L_set_pixel0
;graphics.c,11 :: 		case BLACK:
L_set_pixel2:
;graphics.c,12 :: 		mat_red[row] = mat_red[row] & ~(1 << column); // clear RED
	MOV A, #_mat_red+0
	ADD A, FARG_set_pixel_row+0
	MOV R0, A
	MOV R2, FARG_set_pixel_column+0
	MOV A, #1
	INC R2
	SJMP L__set_pixel12
L__set_pixel13:
	CLR C
	RLC A
L__set_pixel12:
	DJNZ R2, L__set_pixel13
	MOV R1, A
	XRL 1, #255
	MOV R2, 1
	MOV A, @R0
	ANL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,13 :: 		mat_green[row] = mat_green[row] & ~(1 << column); // clear GREEN
	MOV A, #_mat_green+0
	ADD A, FARG_set_pixel_row+0
	MOV R0, A
	MOV R2, FARG_set_pixel_column+0
	MOV A, #1
	INC R2
	SJMP L__set_pixel14
L__set_pixel15:
	CLR C
	RLC A
L__set_pixel14:
	DJNZ R2, L__set_pixel15
	MOV R1, A
	XRL 1, #255
	MOV R2, 1
	MOV A, @R0
	ANL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,14 :: 		break;
	LJMP L_set_pixel1
;graphics.c,15 :: 		case RED:
L_set_pixel3:
;graphics.c,16 :: 		mat_red[row] = mat_red[row] | (1 << column); // set RED
	MOV A, #_mat_red+0
	ADD A, FARG_set_pixel_row+0
	MOV R0, A
	MOV R2, FARG_set_pixel_column+0
	MOV A, #1
	INC R2
	SJMP L__set_pixel16
L__set_pixel17:
	CLR C
	RLC A
L__set_pixel16:
	DJNZ R2, L__set_pixel17
	MOV R1, A
	MOV R2, 1
	MOV A, @R0
	ORL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,17 :: 		mat_green[row] = mat_green[row] & ~(1 << column); // clear GREEN
	MOV A, #_mat_green+0
	ADD A, FARG_set_pixel_row+0
	MOV R0, A
	MOV R2, FARG_set_pixel_column+0
	MOV A, #1
	INC R2
	SJMP L__set_pixel18
L__set_pixel19:
	CLR C
	RLC A
L__set_pixel18:
	DJNZ R2, L__set_pixel19
	MOV R1, A
	XRL 1, #255
	MOV R2, 1
	MOV A, @R0
	ANL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,18 :: 		break;
	LJMP L_set_pixel1
;graphics.c,19 :: 		case GREEN:
L_set_pixel4:
;graphics.c,20 :: 		mat_red[row] = mat_red[row] & ~(1 << column); // clear RED
	MOV A, #_mat_red+0
	ADD A, FARG_set_pixel_row+0
	MOV R0, A
	MOV R2, FARG_set_pixel_column+0
	MOV A, #1
	INC R2
	SJMP L__set_pixel20
L__set_pixel21:
	CLR C
	RLC A
L__set_pixel20:
	DJNZ R2, L__set_pixel21
	MOV R1, A
	XRL 1, #255
	MOV R2, 1
	MOV A, @R0
	ANL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,21 :: 		mat_green[row] = mat_green[row] | (1 << column); // set GREEN
	MOV A, #_mat_green+0
	ADD A, FARG_set_pixel_row+0
	MOV R0, A
	MOV R2, FARG_set_pixel_column+0
	MOV A, #1
	INC R2
	SJMP L__set_pixel22
L__set_pixel23:
	CLR C
	RLC A
L__set_pixel22:
	DJNZ R2, L__set_pixel23
	MOV R1, A
	MOV R2, 1
	MOV A, @R0
	ORL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,22 :: 		break;
	SJMP L_set_pixel1
;graphics.c,23 :: 		case YELLOW:
L_set_pixel5:
;graphics.c,24 :: 		mat_red[row] = mat_red[row] | (1 << column); // set RED
	MOV A, #_mat_red+0
	ADD A, FARG_set_pixel_row+0
	MOV R0, A
	MOV R2, FARG_set_pixel_column+0
	MOV A, #1
	INC R2
	SJMP L__set_pixel24
L__set_pixel25:
	CLR C
	RLC A
L__set_pixel24:
	DJNZ R2, L__set_pixel25
	MOV R1, A
	MOV R2, 1
	MOV A, @R0
	ORL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,25 :: 		mat_green[row] = mat_green[row] | (1 << column); // set GREEN
	MOV A, #_mat_green+0
	ADD A, FARG_set_pixel_row+0
	MOV R0, A
	MOV R2, FARG_set_pixel_column+0
	MOV A, #1
	INC R2
	SJMP L__set_pixel26
L__set_pixel27:
	CLR C
	RLC A
L__set_pixel26:
	DJNZ R2, L__set_pixel27
	MOV R1, A
	MOV R2, 1
	MOV A, @R0
	ORL A, R2
	MOV R1, A
	MOV @R0, 1
;graphics.c,26 :: 		break;
	SJMP L_set_pixel1
;graphics.c,27 :: 		}
L_set_pixel0:
	MOV A, FARG_set_pixel_color+0
	JNZ #3
	LJMP L_set_pixel2
	MOV A, FARG_set_pixel_color+0
	XRL A, #1
	JNZ #3
	LJMP L_set_pixel3
	MOV A, FARG_set_pixel_color+0
	XRL A, #2
	JNZ #3
	LJMP L_set_pixel4
	MOV A, FARG_set_pixel_color+0
	XRL A, #3
	JZ L_set_pixel5
L_set_pixel1:
;graphics.c,28 :: 		}
	RET
; end of _set_pixel

_hline:
;graphics.c,34 :: 		Color color){
;graphics.c,36 :: 		for(column = column_start; column <= column_end; column++){
	MOV hline_column_L0+0, FARG_hline_column_start+0
L_hline6:
	SETB C
	MOV A, hline_column_L0+0
	SUBB A, FARG_hline_column_end+0
	JNC L_hline7
;graphics.c,37 :: 		set_pixel(row, column, color);
	MOV FARG_set_pixel_row+0, FARG_hline_row+0
	MOV FARG_set_pixel_column+0, hline_column_L0+0
	MOV FARG_set_pixel_color+0, FARG_hline_color+0
	LCALL _set_pixel+0
;graphics.c,36 :: 		for(column = column_start; column <= column_end; column++){
	INC hline_column_L0+0
;graphics.c,38 :: 		}
	SJMP L_hline6
L_hline7:
;graphics.c,39 :: 		}
	RET
; end of _hline

_vline:
;graphics.c,45 :: 		Color color){
;graphics.c,47 :: 		for(row = row_start; row <= row_end; row++){
	MOV vline_row_L0+0, FARG_vline_row_start+0
L_vline9:
	SETB C
	MOV A, vline_row_L0+0
	SUBB A, FARG_vline_row_end+0
	JNC L_vline10
;graphics.c,48 :: 		set_pixel(row, column, color);
	MOV FARG_set_pixel_row+0, vline_row_L0+0
	MOV FARG_set_pixel_column+0, FARG_vline_column+0
	MOV FARG_set_pixel_color+0, FARG_vline_color+0
	LCALL _set_pixel+0
;graphics.c,47 :: 		for(row = row_start; row <= row_end; row++){
	INC vline_row_L0+0
;graphics.c,49 :: 		}
	SJMP L_vline9
L_vline10:
;graphics.c,50 :: 		}
	RET
; end of _vline
