
_init_keypad:
;keypad.c,11 :: 		void init_keypad(){
;keypad.c,12 :: 		Keypad_Init();
	LCALL _Keypad_Init+0
;keypad.c,13 :: 		}
	RET
; end of _init_keypad

_key_click_keypad:
;keypad.c,19 :: 		char key_click_keypad(){
;keypad.c,20 :: 		return keys[Keypad_Key_Click()];
	LCALL _Keypad_Key_Click+0
	MOV A, R0
	ADD A, #_keys+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_keys+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
;keypad.c,21 :: 		}
	RET
; end of _key_click_keypad

_get_number_keypad:
;keypad.c,26 :: 		unsigned char get_number_keypad(char key){
;keypad.c,27 :: 		return key - 48;
	CLR C
	MOV A, FARG_get_number_keypad_key+0
	SUBB A, #48
	MOV R0, A
;keypad.c,28 :: 		}
	RET
; end of _get_number_keypad
