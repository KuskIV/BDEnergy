#SingleInstance Force

Send, {Alt Down}{Tab}
Send, {Alt Up}

Sleep, 1000

Loop, 3 {
    Send, {Tab}
    Sleep, 1000 
}

Send, {Enter}
Sleep, 1000

Loop, 4 {
    Send, {Tab}
    Sleep, 1000
}

Send, {Enter}

ExitApp