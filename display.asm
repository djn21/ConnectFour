
_Display_Init:
;display.c,24 :: 		void Display_Init(){
;display.c,26 :: 		TMOD |= 0x01;
	ORL TMOD+0, #1
;display.c,28 :: 		TH0 = 0xF9;
	MOV TH0+0, #249
;display.c,29 :: 		TL0 = 0x7D;
	MOV TL0+0, #125
;display.c,31 :: 		IE |= 0x82;
	ORL IE+0, #130
;display.c,33 :: 		TR0_bit = 1;
	SETB TR0_bit+0
;display.c,34 :: 		}
	RET
; end of _Display_Init

_Display_SetOutput:
;display.c,41 :: 		void Display_SetOutput(unsigned char row, unsigned char red, unsigned char green){
;display.c,43 :: 		mRedOutput = 0x00;
	MOV P2+0, #0
;display.c,44 :: 		mGreenOutput = 0x00;
	MOV P3+0, #0
;display.c,46 :: 		mRowOutout = row;
	MOV P1+0, FARG_Display_SetOutput_row+0
;display.c,48 :: 		mRedOutput = red;
	MOV P2+0, FARG_Display_SetOutput_red+0
;display.c,49 :: 		mGreenOutput = green;
	MOV P3+0, FARG_Display_SetOutput_green+0
;display.c,50 :: 		}
	RET
; end of _Display_SetOutput

_Display_Refresh:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;display.c,57 :: 		void Display_Refresh() iv IVT_ADDR_ET0 {
;display.c,60 :: 		TR0_bit = 0;
	CLR TR0_bit+0
;display.c,62 :: 		TH0 = 0xF9;
	MOV TH0+0, #249
;display.c,63 :: 		TL0 = 0x7D;
	MOV TL0+0, #125
;display.c,65 :: 		Display_SetOutput(gMatrixRow[i], gMatrixRed[i], gMatrixGreen[i]);
	MOV R2, #1
	CLR A
	MOV R1, A
	MOV A, Display_Refresh_i_L0+0
	INC R2
	SJMP L__Display_Refresh1
L__Display_Refresh2:
	CLR C
	RLC A
	XCH A, R1
	RLC A
	XCH A, R1
L__Display_Refresh1:
	DJNZ R2, L__Display_Refresh2
	MOV R0, A
	MOV A, #_gMatrixRow+0
	ADD A, R0
	MOV R2, A
	MOV A, hi(#_gMatrixRow+0)
	ADDC A, R1
	MOV R3, A
	MOV 130, 2
	MOV 131, 3
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV FARG_Display_SetOutput_row+0, 0
	MOV A, #_gMatrixRed+0
	ADD A, Display_Refresh_i_L0+0
	MOV R0, A
	MOV FARG_Display_SetOutput_red+0, @R0
	MOV A, #_gMatrixGreen+0
	ADD A, Display_Refresh_i_L0+0
	MOV R0, A
	MOV FARG_Display_SetOutput_green+0, @R0
	LCALL _Display_SetOutput+0
;display.c,66 :: 		i++;
	INC Display_Refresh_i_L0+0
;display.c,68 :: 		if(i == 8){
	MOV A, Display_Refresh_i_L0+0
	XRL A, #8
	JNZ L_Display_Refresh0
;display.c,69 :: 		i = 0;
	MOV Display_Refresh_i_L0+0, #0
;display.c,70 :: 		}
L_Display_Refresh0:
;display.c,72 :: 		TR0_bit = 1;
	SETB TR0_bit+0
;display.c,73 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _Display_Refresh
