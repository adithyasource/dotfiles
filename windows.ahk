; turns off caps lock
; cause my keyboard also uses it as a fn key
; and holding it makes wasd act like arrow keys
SetCapsLockState, AlwaysOff

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

; dont even question the sanity of the rest of the script

; holding middle click then pressing and holding right click and then leaving middle click
; holds down ctrl+alt as long as right click is held so that i can use altsnap
; where left drag moves the window and middle click drag resizes it
ctrlAltActive := false
~MButton::Return
RButton::
  if (GetKeyState("MButton", "P")) {
    if (!ctrlAltActive) {
      ctrlAltActive := true
      Send, {Ctrl Down}{Alt Down}
    }
    KeyWait, RButton
    if (ctrlAltActive) {
      Send, {Ctrl Up}{Alt Up}
      ctrlAltActive := false
    }
    Return
  }
  Send, {RButton down}
  KeyWait, RButton
  Send, {RButton up}
Return

; "we have a window manager at home" ahh code
^!Q::JumpToDesktop(1)
^!W::JumpToDesktop(2)
^!E::JumpToDesktop(3)
^!A::JumpToDesktop(4)
^!S::JumpToDesktop(5)
^!D::JumpToDesktop(6)
^!Z::JumpToDesktop(7)
^!X::JumpToDesktop(8)
^!C::JumpToDesktop(9)
JumpToDesktop(target) {
  ; reset to desktop 1
  Loop, 9 {
    Send ^#{Left}
    Sleep, 50
  }
  Loop, % target - 1 {
    Send ^#{Right}
    Sleep, 50
  }
}
