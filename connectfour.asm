
_main:
	MOV SP+0, #128
;connectfour.c,5 :: 		void main() {
;connectfour.c,7 :: 		init_keypad();
	LCALL _init_keypad+0
;connectfour.c,8 :: 		init_display();
	LCALL _init_display+0
;connectfour.c,9 :: 		do{
L_main0:
;connectfour.c,10 :: 		do{
L_main3:
;connectfour.c,11 :: 		key = key_click_keypad();
	LCALL _key_click_keypad+0
	MOV main_key_L0+0, 0
;connectfour.c,12 :: 		}while(key == '\0');
	MOV A, R0
	JZ L_main3
;connectfour.c,13 :: 		if(key >= '0' && key <= '7'){
	CLR C
	MOV A, main_key_L0+0
	SUBB A, #48
	JC L_main8
	SETB C
	MOV A, main_key_L0+0
	SUBB A, #55
	JNC L_main8
L__main15:
;connectfour.c,15 :: 		for(i = 0; i < 8; i++){
	MOV main_i_L2+0, #0
L_main9:
	CLR C
	MOV A, main_i_L2+0
	SUBB A, #8
	JNC L_main10
;connectfour.c,16 :: 		set_pixel(key - 48, i, GREEN);
	CLR C
	MOV A, main_key_L0+0
	SUBB A, #48
	MOV FARG_set_pixel_row+0, A
	MOV FARG_set_pixel_column+0, main_i_L2+0
	MOV FARG_set_pixel_color+0, #2
	LCALL _set_pixel+0
;connectfour.c,17 :: 		if(i >= 1){
	CLR C
	MOV A, main_i_L2+0
	SUBB A, #1
	JC L_main12
;connectfour.c,18 :: 		set_pixel(key - 48, i-1, BLACK);
	CLR C
	MOV A, main_key_L0+0
	SUBB A, #48
	MOV FARG_set_pixel_row+0, A
	CLR C
	MOV A, main_i_L2+0
	SUBB A, #1
	MOV FARG_set_pixel_column+0, A
	MOV FARG_set_pixel_color+0, #0
	LCALL _set_pixel+0
;connectfour.c,19 :: 		}
L_main12:
;connectfour.c,20 :: 		Delay_ms(100);
	MOV R6, 163
	MOV R7, 30
	DJNZ R7, 
	DJNZ R6, 
	NOP
;connectfour.c,15 :: 		for(i = 0; i < 8; i++){
	INC main_i_L2+0
;connectfour.c,21 :: 		}
	SJMP L_main9
L_main10:
;connectfour.c,22 :: 		}else if(key == 'C'){
	SJMP L_main13
L_main8:
	MOV A, main_key_L0+0
	XRL A, #67
	JNZ L_main14
;connectfour.c,24 :: 		}
L_main14:
L_main13:
;connectfour.c,25 :: 		}while(1);
	SJMP L_main0
;connectfour.c,26 :: 		}
	SJMP #254
; end of _main
