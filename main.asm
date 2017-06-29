
_init:
;main.c,5 :: 		void init(){
;main.c,6 :: 		init_keypad();
	LCALL _init_keypad+0
;main.c,7 :: 		init_display();
	LCALL _init_display+0
;main.c,8 :: 		init_connectfour();
	LCALL _init_connectfour+0
;main.c,9 :: 		}
	RET
; end of _init

_main:
	MOV SP+0, #128
;main.c,11 :: 		void main() {
;main.c,14 :: 		init();
	LCALL _init+0
;main.c,17 :: 		do{
L_main0:
;main.c,19 :: 		do{
L_main3:
;main.c,20 :: 		key = key_click_keypad();
	LCALL _key_click_keypad+0
	MOV main_key_L0+0, 0
;main.c,21 :: 		}while(key < '1' || key > '7');
	CLR C
	MOV A, R0
	SUBB A, #49
	JC L_main3
	SETB C
	MOV A, main_key_L0+0
	SUBB A, #55
	JNC L_main3
L__main8:
;main.c,23 :: 		insert_disc(key - 48);
	CLR C
	MOV A, main_key_L0+0
	SUBB A, #48
	MOV FARG_insert_disc_position+0, A
	LCALL _insert_disc+0
;main.c,25 :: 		switch_player();
	LCALL _switch_player+0
;main.c,27 :: 		} while(1);
	SJMP L_main0
;main.c,29 :: 		}
	SJMP #254
; end of _main
