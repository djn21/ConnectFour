
_Display_Init:
;display.c,24 :: 		void Display_Init(){
;display.c,26 :: 		mRowOutputPort = 0x00;
	MOV P1+0, #0
;display.c,27 :: 		mRedOutputPort = 0x00;
	MOV P2+0, #0
;display.c,28 :: 		mGreenOutputPort = 0x00;
	MOV P3+0, #0
;display.c,30 :: 		TMOD |= 0x01;
	ORL TMOD+0, #1
;display.c,32 :: 		TH0 = 0xF9;
	MOV TH0+0, #249
;display.c,33 :: 		TL0 = 0x7D;
	MOV TL0+0, #125
;display.c,37 :: 		IE |= 0x82;
	ORL IE+0, #130
;display.c,39 :: 		TR0_bit = 1;
	SETB TR0_bit+0
;display.c,40 :: 		}
	RET
; end of _Display_Init

_Display_SetOutput:
;display.c,47 :: 		void Display_SetOutput(unsigned char row, unsigned char red, unsigned char green){
;display.c,49 :: 		mRowOutputPort = 0x00;
	MOV P1+0, #0
;display.c,50 :: 		mRedOutputPort = 0x00;
	MOV P2+0, #0
;display.c,51 :: 		mGreenOutputPort = 0x00;
	MOV P3+0, #0
;display.c,53 :: 		mRedOutputPort = red;
	MOV P2+0, FARG_Display_SetOutput_red+0
;display.c,54 :: 		mGreenOutputPort = green;
	MOV P3+0, FARG_Display_SetOutput_green+0
;display.c,56 :: 		mRowOutputPort = row;
	MOV P1+0, FARG_Display_SetOutput_row+0
;display.c,57 :: 		}
	RET
; end of _Display_SetOutput

_Display_Refresh:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;display.c,64 :: 		void Display_Refresh() iv IVT_ADDR_ET0 {
;display.c,67 :: 		TR0_bit = 0;
	CLR TR0_bit+0
;display.c,69 :: 		TH0 = 0xF9;
	MOV TH0+0, #249
;display.c,70 :: 		TL0 = 0x7D;
	MOV TL0+0, #125
;display.c,74 :: 		Display_SetOutput(gMatrixRow[i], gMatrixRed[i], gMatrixGreen[i]);
	MOV A, Display_Refresh_i_L0+0
	ADD A, #_gMatrixRow+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_gMatrixRow+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
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
;display.c,75 :: 		i++;
	INC Display_Refresh_i_L0+0
;display.c,77 :: 		if(i == 8){
	MOV A, Display_Refresh_i_L0+0
	XRL A, #8
	JNZ L_Display_Refresh0
;display.c,78 :: 		i = 0;
	MOV Display_Refresh_i_L0+0, #0
;display.c,79 :: 		}
L_Display_Refresh0:
;display.c,81 :: 		TR0_bit = 1;
	SETB TR0_bit+0
;display.c,82 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _Display_Refresh
