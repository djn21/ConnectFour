
_init_display:
;display.c,10 :: 		void init_display(){
;display.c,12 :: 		TMOD = 0x01;
	MOV TMOD+0, #1
;display.c,14 :: 		TH0 = 0xF9;
	MOV TH0+0, #249
;display.c,15 :: 		TL0 = 0x7D;
	MOV TL0+0, #125
;display.c,17 :: 		IE = 0x82;
	MOV IE+0, #130
;display.c,19 :: 		TR0_bit = 1;
	SETB TR0_bit+0
;display.c,20 :: 		}
	RET
; end of _init_display

_set_out:
;display.c,24 :: 		void set_out(unsigned char row, unsigned char red, unsigned char green){
;display.c,26 :: 		P2 = 0x00;
	MOV P2+0, #0
;display.c,27 :: 		P3 = 0x00;
	MOV P3+0, #0
;display.c,29 :: 		P1 = ~row;
	MOV A, FARG_set_out_row+0
	XRL A, #255
	MOV P1+0, A
;display.c,31 :: 		P2 = red;
	MOV P2+0, FARG_set_out_red+0
;display.c,32 :: 		P3 = green;
	MOV P3+0, FARG_set_out_green+0
;display.c,33 :: 		}
	RET
; end of _set_out

_refresh_display:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;display.c,39 :: 		void refresh_display() iv IVT_ADDR_ET0 {
;display.c,42 :: 		TR0_bit = 0;
	CLR TR0_bit+0
;display.c,44 :: 		TH0 = 0xF9;
	MOV TH0+0, #249
;display.c,45 :: 		TL0 = 0x7D;
	MOV TL0+0, #125
;display.c,47 :: 		set_out(mat_row[i], mat_red[i], mat_green[i]);
	MOV A, refresh_display_i_L0+0
	ADD A, #_mat_row+0
	MOV R1, A
	CLR A
	ADDC A, hi(#_mat_row+0)
	MOV R2, A
	MOV 130, 1
	MOV 131, 2
	CLR A
	MOVC A, @A+DPTR
	MOV R0, A
	MOV FARG_set_out_row+0, 0
	MOV A, #_mat_red+0
	ADD A, refresh_display_i_L0+0
	MOV R0, A
	MOV FARG_set_out_red+0, @R0
	MOV A, #_mat_green+0
	ADD A, refresh_display_i_L0+0
	MOV R0, A
	MOV FARG_set_out_green+0, @R0
	LCALL _set_out+0
;display.c,48 :: 		i++;
	INC refresh_display_i_L0+0
;display.c,50 :: 		if(i == 8)
	MOV A, refresh_display_i_L0+0
	XRL A, #8
	JNZ L_refresh_display0
;display.c,51 :: 		i = 0;
	MOV refresh_display_i_L0+0, #0
L_refresh_display0:
;display.c,53 :: 		TR0_bit = 1;
	SETB TR0_bit+0
;display.c,54 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _refresh_display
