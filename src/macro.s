;;; Helper macros

%ifndef _macro_s_
%define _macro_s_

%macro JUMP_FAIL 1
mov dx, %{1}_msg
%1 .fail        
%endmacro        
        
%endif
