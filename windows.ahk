; turns off caps lock
; cause my keyboard also uses it as a fn key
; and holding it makes wasd act like arrow keys
SetCapsLockState, AlwaysOff

; back button to middle click (front mouse button is control for alt snap)
XButton1::MButton

; ctrl+shift+space for activating always on top
^+Space::
    WinGetTitle, ActiveWindow, A
    WinSet, AlwaysOnTop, , A
Return

; media controls
RAlt & Space::Send, {Media_Play_Pause}
^!Left::Send, {Media_Prev}
^!Right::Send, {Media_Next}
^!M::Send, {Volume_Mute}
RShift::Send, {Volume_Up}
RCtrl::Send, {Volume_Down}

; "we have a window manager at home" ahh code
CurrentDesktop := 1
DesktopFile := A_ScriptDir . "\current_desktop.txt"

if FileExist(DesktopFile) {
    FileRead, SavedDesktop, %DesktopFile%
    if (SavedDesktop >= 1 && SavedDesktop <= 9) {
        CurrentDesktop := SavedDesktop
    }
}

^!Q::ResetToDesktop1()
^!W::JumpToDesktop(2)
^!E::JumpToDesktop(3)
^!A::JumpToDesktop(4)
^!S::JumpToDesktop(5)
^!D::JumpToDesktop(6)
^!Z::JumpToDesktop(7)
^!X::JumpToDesktop(8)
^!C::JumpToDesktop(9)

JumpToDesktop(target) {
    global CurrentDesktop, DesktopFile
    if (target == CurrentDesktop) {
        return
    }
    difference := target - CurrentDesktop
    if (difference > 0) {
        Loop, %difference% {
            Send ^#{Right}
            Sleep, 50
        }
    } else {
        difference := Abs(difference)
        Loop, %difference% {
            Send ^#{Left}
            Sleep, 50
        }
    }
    CurrentDesktop := target
    FileDelete, %DesktopFile%
    FileAppend, %CurrentDesktop%, %DesktopFile%
}

ResetToDesktop1() {
    global CurrentDesktop, DesktopFile
    Loop, 9 {
        Send ^#{Left}
        Sleep, 50
    }
    CurrentDesktop := 1
    FileDelete, %DesktopFile%
    FileAppend, %CurrentDesktop%, %DesktopFile%
}
