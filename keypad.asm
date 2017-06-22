
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
	MOV FLOC__key_click_keypad+0, 0
	MOV A, #_keys+0
	ADD A, FLOC__key_click_keypad+0
	MOV R0, A
	MOV 0, @R0
;keypad.c,21 :: 		}
	RET
; end of _key_click_keypad
