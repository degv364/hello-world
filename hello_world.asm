#include "Reg9s12.h"
	;; Motorola S12 assembler
GETCHAR:	equ	$EE84
PUTCHAR:	equ	$EE86
	
	org $2000 
	lds #$2000 ;Stack
 
	;; Initialize harware

	ldaa #$0 
	staa SC1BDH 
	ldaa #156
	staa SC1BDL
	ldaa #0 
	staa SC1CR1 
	ldaa #$0C 
	staa SC1CR2 
 
	ldaa #'H' 
	jsr TRANS
	ldaa #'e' 
	jsr TRANS
	ldaa #'l' 
	jsr TRANS
	ldaa #'l' 
	jsr TRANS
	ldaa #'o' 
	jsr TRANS
	ldaa #' ' 
	jsr TRANS
	ldaa #'W' 
	jsr TRANS
	ldaa #'o' 
	jsr TRANS
	ldaa #'r' 
	jsr TRANS
	ldaa #'l' 
	jsr TRANS
	ldaa #'d' 
	jsr TRANS

loop:	
	ldx #$0000
	jsr [GETCHAR,x]

	ldx #$0000
	jsr [PUTCHAR,x]

	tba
	jsr TRANS 		; Print to serial TTY
	
	bra loop
	

TRANS 

	brclr SC1SR1,$80,TRANS
	staa SC1DRL
	rts
