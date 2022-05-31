#line 1 "C:/Users/Erickson Rodrigues/Desktop/erick/ufpi/lab.microcontrolodaroes/programas em aula lab.micro/erickson rodrigues/QUINTO MINI PROJETO/PROGRAMACAO/PROGRAMACAO - PARA PIC/MyProject.c"



sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;


sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

float leituraAD = 0;

 char txt[30];

 void main ()
 {

 ADCON1 = 0b00001110;

 TRISB = 0X00;
 PORTB = 0X00;

 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 while(1)
 {
 leituraAD = ((float)(ADC_Read(0))*5)/1023;
 floatToStr(leituraAD, txt);

 Lcd_Out(1,1,"voltimetro:");
 Lcd_Out(2,5,txt);


 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 }

 }
