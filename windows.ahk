SetCapsLockState, AlwaysOff
RAlt & Space::Send, {Media_Play_Pause}
^!Left::Send, {Media_Prev}
^!Right::Send, {Media_Next}
^!M::Send, {Volume_Mute}
RShift::Send, {Volume_Up}
RCtrl::Send, {Volume_Down}
^+Space::
    WinGetTitle, ActiveWindow, A
    WinSet, AlwaysOnTop, , A
Return
