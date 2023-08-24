# How To Remap Caps Lock to Escape (When Tapped) and Control (When Held)

Download AutoHotkey

Use the following script:

```
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    If ((A_TickCount-cDown)<400)    ; Modify press time as needed (milliseconds)
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
        
Return
```
