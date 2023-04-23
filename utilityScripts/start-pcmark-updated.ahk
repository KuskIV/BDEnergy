CoordMode, Mouse, Screen
MouseMove, 40, 10
Sleep, 1000
Click, Left
Sleep, 1000

#SingleInstance Force

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