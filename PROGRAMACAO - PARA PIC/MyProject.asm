
_main:

;MyProject.c,23 :: 		void main ()
;MyProject.c,26 :: 		ADCON1 = 0b00001110;   //definindo registrador
	MOVLW       14
	MOVWF       ADCON1+0 
;MyProject.c,28 :: 		TRISB = 0X00;  //definido como saida
	CLRF        TRISB+0 
;MyProject.c,29 :: 		PORTB = 0X00;    //iniciando em 0
	CLRF        PORTB+0 
;MyProject.c,31 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;MyProject.c,32 :: 		Lcd_Init();   // iniciar o display
	CALL        _Lcd_Init+0, 0
;MyProject.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);    //limpar o display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,37 :: 		while(1)      //loop infinito
L_main0:
;MyProject.c,39 :: 		leituraAD = ((float)(ADC_Read(0))*5)/1023; //equacao para a conversão AD
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _leituraAD+0 
	MOVF        R1, 0 
	MOVWF       _leituraAD+1 
	MOVF        R2, 0 
	MOVWF       _leituraAD+2 
	MOVF        R3, 0 
	MOVWF       _leituraAD+3 
;MyProject.c,40 :: 		floatToStr(leituraAD, txt);    //transformar a leituraAD em string
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;MyProject.c,42 :: 		Lcd_Out(1,1,"voltimetro:"); // a palavra voltimetro aparecera na tela do lcd ao ser ligado
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,43 :: 		Lcd_Out(2,5,txt);    // exibição do valor convertido
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,46 :: 		delay_ms(100);   // tempo de espera
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;MyProject.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);      //limpar o display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,48 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,50 :: 		}
	GOTO        L_main0
;MyProject.c,52 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
