;
; first_nes
; break.asm
;
; This is the BREAK Interrupt Service Routine for the first_nes project.
;
; Written by Greg M. Krsak <greg.krsak@gmail.com>, Feb. 2017
;
; Based on the NintendoAge "Nerdy Nights" tutorials, by bunnyboy:
;   http://nintendoage.com/forum/messageview.cfm?catid=22&threadid=7155
; Based on "Nintendo Entertainment System Architecture", by Marat Fayzullin:
;   http://fms.komkon.org/EMUL8/NES.html
; Based on "Nintendo Entertainment System Documentation", by an unknown author:
;   https://emu-docs.org/NES/nestech.txt
;
; Processor: 8-bit, Ricoh RP2A03 (6502), 1.789773 MHz (NTSC)
; Assembler: NESASM 3.1
;
; Tested with:
; nesasm3 "first_nes.asm"
;
; Tested on:
; Nestopia 1.40
;
; For more information about NES programming in general, try these references:
; https://en.wikibooks.org/wiki/NES_Programming
;
; For more information on the NESASM assembler, try these references:
; http://www.nespowerpak.com/nesasm/usage.txt
;


  .CODE

  .BANK 0
  .ORG __ISRBreakBegin


; --- Begin "Break" Interrupt Service Routine ---
ISRBreak:

	nop 							; Do nothing

ENDISRBreak:
    rti                             ; Return from interrupt
; --- End "Break" Interrupt Service Routine ---


; End of break.inc
