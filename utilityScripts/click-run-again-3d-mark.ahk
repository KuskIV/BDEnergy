; Find the "RUN AGAIN" button
ControlGet, buttonHwnd, Hwnd,, Button1, 3DMark

; Clock on the button
ControlClick,, ahk_id %buttonHwnd%,,

; Exit the script
ExitApp