
_main:
	MOV SP+0, #128
;connectfour.c,7 :: 		void main() {
;connectfour.c,8 :: 		init_display();
	LCALL _init_display+0
;connectfour.c,9 :: 		hline(0, 0, 7, GREEN);
	MOV FARG_hline_row+0, #0
	MOV FARG_hline_column_start+0, #0
	MOV FARG_hline_column_end+0, #7
	MOV FARG_hline_color+0, #2
	LCALL _hline+0
;connectfour.c,10 :: 		vline(1, 7, 6, GREEN);
	MOV FARG_vline_row_start+0, #1
	MOV FARG_vline_row_end+0, #7
	MOV FARG_vline_column+0, #6
	MOV FARG_vline_color+0, #2
	LCALL _vline+0
;connectfour.c,11 :: 		vline(0, 7, 7, RED);
	MOV FARG_vline_row_start+0, #0
	MOV FARG_vline_row_end+0, #7
	MOV FARG_vline_column+0, #7
	MOV FARG_vline_color+0, #1
	LCALL _vline+0
;connectfour.c,13 :: 		set_pixel(3, 5, RED);
	MOV FARG_set_pixel_row+0, #3
	MOV FARG_set_pixel_column+0, #5
	MOV FARG_set_pixel_color+0, #1
	LCALL _set_pixel+0
;connectfour.c,14 :: 		set_pixel(4, 5, GREEN);
	MOV FARG_set_pixel_row+0, #4
	MOV FARG_set_pixel_column+0, #5
	MOV FARG_set_pixel_color+0, #2
	LCALL _set_pixel+0
;connectfour.c,15 :: 		}
	SJMP #254
; end of _main
