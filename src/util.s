;;; Small helper that performs trivial tasks

%macro printc 1
        mov ah, 0Eh
        mov al, %1
        int 10h
%endmacro
