    //Aluno: Erickson Rodrigues da Silva curso:Engenharia Elétrica    materia : Laboratorio de Microcontroladores.
         
         // Lcd pinout settings
sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;

float leituraAD = 0;  //variavel para receber o valor da tensão
     
 char txt[30];    //variavel do tipo "string" para converter a variavel leituraAD do tipo "float"
     
  void main ()
  {
        //ADCON0 = 0b00000001;
        ADCON1 = 0b00001110;   //definindo registrador
       // ADCON2 = 0b10110010;
        TRISB = 0X00;  //definido como saida
        PORTB = 0X00;    //iniciando em 0
        
        ADC_Init();
        Lcd_Init();   // iniciar o display
        Lcd_Cmd(_LCD_CLEAR);    //limpar o display
        Lcd_Cmd(_LCD_CURSOR_OFF);
        
        
        while(1)      //loop infinito
        {
           leituraAD = ((float)(ADC_Read(0))*5)/1023; //equacao para a conversão AD
           floatToStr(leituraAD, txt);    //transformar a leituraAD em string
           
           Lcd_Out(1,1,"voltimetro:"); // a palavra voltimetro aparecera na tela do lcd ao ser ligado
           Lcd_Out(2,5,txt);    // exibição do valor convertido

           
           delay_ms(100);   // tempo de espera
            Lcd_Cmd(_LCD_CLEAR);      //limpar o display
           Lcd_Cmd(_LCD_CURSOR_OFF);
        
        }
  
  }