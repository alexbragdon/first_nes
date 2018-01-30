;
; first_nes
; vertical_blank.s
;
; This is the NMI Interrupt Service Routine for the first_nes project.
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, 2018
;
; Based on the NintendoAge "Nerdy Nights" tutorials, by bunnyboy:
;   http://nintendoage.com/forum/messageview.cfm?catid=22&threadid=7155
; Based on "Nintendo Entertainment System Architecture", by Marat Fayzullin:
;   http://fms.komkon.org/EMUL8/NES.html
; Based on "Nintendo Entertainment System Documentation", by an unknown author:
;   https://emu-docs.org/NES/nestech.txt
;
; Processor: 8-bit, Ricoh RP2A03 (6502), 1.789773 MHz (NTSC)
; Assembler: ca65 (cc65 binutils)
;
; Tested with:
; (untested)
;
; Tested on:
; (untested)
;
; For more information about NES programming in general, try these references:
; https://en.wikibooks.org/wiki/NES_Programming
;
; For more information on the ca65 assembler, try these references:
; https://github.com/cc65/cc65
; http://cc65.github.io/doc/ca65.html
;


  .CODE

  .SEGMENT "BANK0"
  .ORG __ISRVerticalBlankBegin


; --- BEGIN "Vertical Blank" (Non-Maskable Interrupt) Interrupt Service Routine ---
ISRVerticalBlank:

    lda     #$00
    sta     _OAMADDR                ; Set the low byte (00) of the RAM address
    lda     #$02
    sta     _OAMDMA                 ; Set the high byte (02) of the RAM address, start the transfer

  ; Freeze the button positions
  latchControllerBegin:
    lda     #$01
    sta     _JOY1
    lda     #$00
    sta     _JOY1                   ; Tell both the controllers to latch buttons
  latchControllerEnd:
  
  ; Check button A
  readButtonABegin: 
    lda     _JOY1                    
    and     #%00000001              ; Only look at bit 0
    beq     readButtonAEnd          ; Branch to readButtonAEnd if button A is NOT pressed (0)                                    
    jsr     MoveMarioRight          ; Jump to the subroutine that moves the Mario sprites right
  readButtonAEnd:

  ; Check button B
  readButtonBBegin: 
    lda     _JOY1                    
    and     #%00000001              ; Only look at bit 0
    beq     readButtonBEnd          ; Branch to readButtonBEnd if button B is NOT pressed (0)                                    
    jsr     MoveMarioLeft           ; Jump to the subroutine that moves the Mario sprites left
  readButtonBEnd:

ENDISRVerticalBlank:  
    rti                             ; Return from interrupt
; --- END "Vertical Blank" (Non-Maskable Interrupt) Interrupt Service Routine ---


__ISRBreakBegin:


; End of vertical_blank.s
