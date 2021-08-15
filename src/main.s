;;; 8086-accuracy (c) spycrab0, 2018
;;; Licensed under the GNU GPL v3+. See LICENSE.

cpu 8086
org 100h 

section .text 

%include "util.s"
%include "macro.s"

start:
        mov dx, welcome
        call prints

        mov dx, test_cmp_announce
        call prints
        call test_cmp
        cmp ax, 0
        jz fail

        mov dx, test_add_announce
        call prints
        call test_add
        cmp ax, 0
        jz fail

        mov dx, all_done
        jmp done

fail:
        mov bx, dx
        mov dx, test_failed
        call prints
        mov dx, bx
        call prints

done: 
        mov ax, 4c00h
        int 21h
        ret

;;; Prints a string
prints:
        mov ah, 09h
        int 21h
        ret

%include "add.s"
%include "cmp.s"

section .data

        welcome db '8086-accuracy (c) spycrab0, 2018.', 13, 10,'This program is free software licensed under the GNU GPL v3+.' ,13, 10, 'See the LICENSE file included with this program for more details.', 13, 10, '$', 0
        test_passed db ' -> Test passed sucessfully.', 13, 10, '$'
        test_failed db ' -> Test failed: $', 0
        all_done db 'Done. Exiting...', 13, 10, '$'
        test_cmp_announce  db 13, 10, 'Testing CMP...', 13, 10, '$'
        test_add_announce db 13, 10, 'Testing ADD...', 13, 10, '$'

        line_break db 20, 0

        ja_msg db 'JA$', 0
        jna_msg db 'JNA$', 0
        jc_msg db 'JC$', 0
        jnc_msg db 'JNC$', 0
        je_msg db 'JE$', 0
        jne_msg db 'JNE$', 0
        jl_msg db 'JL$', 0
        jnl_msg db 'JNL$', 0
        jg_msg db 'JG$', 0
        jng_msg db 'JNG$', 0
        jo_msg db 'JO$', 0
        jno_msg db 'JNO$', 0
        jp_msg db 'JP$', 0
        jnp_msg db 'JNP$', 0
        js_msg db 'JS$', 0
        jns_msg db 'JNS$', 0
        jz_msg db 'JZ$', 0
        jnz_msg db 'JNZ$', 0

