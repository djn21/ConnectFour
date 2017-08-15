
_Init:
;main.c,11 :: 		void Init(){
;main.c,12 :: 		Timer_Init();
	LCALL _Timer_Init+0
;main.c,13 :: 		Keypad_Init();
	LCALL _Keypad_Init+0
;main.c,14 :: 		Display_Init();
	LCALL _Display_Init+0
;main.c,15 :: 		ConnectFour_Init();
	LCALL _ConnectFour_Init+0
;main.c,16 :: 		}
	RET
; end of _Init

_main:
	MOV SP+0, #128
;main.c,18 :: 		void main() {
;main.c,29 :: 		Init();
	LCALL _Init+0
;main.c,32 :: 		do{
L_main0:
;main.c,33 :: 		do{
L_main3:
;main.c,35 :: 		do{
L_main6:
;main.c,36 :: 		keyIndex = Keypad_Key_Click();
	LCALL _Keypad_Key_Click+0
;main.c,37 :: 		key = keys[keyIndex];
	MOV A, R0
	ADD A, #_keys+0
	MOV R0, A
	CLR A
	ADDC A, hi(#_keys+0)
	MOV R1, A
	MOV 130, 0
	MOV 131, 1
	CLR A
	MOVC A, @A+DPTR
	MOV R2, A
	MOV main_key_L0+0, 2
;main.c,38 :: 		}while(key < '1' || key > '7');
	CLR C
	MOV A, R2
	SUBB A, #49
	JC L_main6
	SETB C
	MOV A, main_key_L0+0
	SUBB A, #55
	JNC L_main6
L__main13:
;main.c,40 :: 		discInserted = ConnectFour_InsertDisc(key - 48);
	CLR C
	MOV A, main_key_L0+0
	SUBB A, #48
	MOV FARG_ConnectFour_InsertDisc_column+0, A
	LCALL _ConnectFour_InsertDisc+0
;main.c,41 :: 		} while(discInserted == 0);
	MOV A, R0
	JZ L_main3
;main.c,43 :: 		hasWinner = ConnectFour_CheckWinner();
	LCALL _ConnectFour_CheckWinner+0
;main.c,70 :: 		if(hasWinner == 0){
	MOV A, R0
	JNZ L_main11
;main.c,72 :: 		ConnectFour_SwitchPlayer();
	LCALL _ConnectFour_SwitchPlayer+0
;main.c,73 :: 		} else {
	SJMP L_main12
L_main11:
;main.c,74 :: 		break;
	SJMP L_main1
;main.c,75 :: 		}
L_main12:
;main.c,76 :: 		} while(1);
	SJMP L_main0
L_main1:
;main.c,78 :: 		}
	SJMP #254
; end of _main
