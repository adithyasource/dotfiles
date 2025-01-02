; INFO this script file only works with ahk v1

; disable caps lock
; cause caps lock is also the fn key on my keyboard
; [stolen from www.autohotkey.com/board/topic/51215-completely-disable-capslock/?p=320194]
SetCapsLockState, AlwaysOff

; always on top
^+Space::
  WinGetTitle, ActiveWindow, A
  WinSet, AlwaysOnTop, , A
Return

; media keys
RAlt & Space::Send, {Media_Play_Pause}
^!Left::Send, {Media_Prev}
^!Right::Send, {Media_Next}
^!M::Send, {Volume_Mute}
RShift::Send, {Volume_Up}
RCtrl::Send, {Volume_Down}

; switching desktops
; [stolen from https://www.autohotkey.com/boards/viewtopic.php?p=491217&sid=d9047a5a1ef1fb914774e0d6366556bb#p491217]
DesktopCount   = 2 
CurrentDesktop = 1
MapDesktopsFromRegistry()
OutputDebug, [loading] desktops: %DesktopCount% current: %CurrentDesktop%

^!Q::SwitchDesktopByNumber(1) 
^!W::SwitchDesktopByNumber(2) 
^!E::SwitchDesktopByNumber(3)
^!A::SwitchDesktopByNumber(4)
^!S::SwitchDesktopByNumber(5)
^!D::SwitchDesktopByNumber(6)
^!Z::SwitchDesktopByNumber(7)
^!X::SwitchDesktopByNumber(8)
^!C::SwitchDesktopByNumber(9)

MapDesktopsFromRegistry() {
  Global CurrentDesktop, DesktopCount
  IDLength := 32
  SessionID := GetSessionID()
  If (SessionID) {
    RegRead, CurrentDesktopID, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\%SessionID%\VirtualDesktops, CurrentVirtualDesktop
    If (CurrentDesktopID) {
      IDLength := StrLen(CurrentDesktopID)
    }
  }
  RegRead, DesktopList, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs
  If (DesktopList) {
    DesktopListLength := StrLen(DesktopList)
    DesktopCount := DesktopListLength / IDLength
  } Else {
    DesktopCount := 1
  }
  I := 0
  While (CurrentDesktopID and I < DesktopCount) {
    StartPos := (I * IDLength) + 1
    DesktopIter := SubStr(DesktopList, StartPos, IDLength)
    OutputDebug, The iterator is pointing at %DesktopIter% and count is %I%.
    If (DesktopIter = CurrentDesktopID) {
      CurrentDesktop := I + 1
      OutputDebug, Current desktop number is %CurrentDesktop% with an ID of %DesktopIter%.
      Break
    }
    I++
  }
}

GetSessionID() {
  ProcessID := DllCall("GetCurrentProcessId", "UInt")
  If ErrorLevel {
    OutputDebug, Error getting current process ID: %ErrorLevel%
    Return
  }
  OutputDebug, Current process ID: %ProcessID%
  DllCall("ProcessIdToSessionId", "UInt", ProcessID, "UInt*", SessionID)
  If ErrorLevel {
    OutputDebug, Error getting session ID: %ErrorLevel%
    Return
  }
  OutputDebug, Current session ID: %SessionID%
  Return SessionID
}

SwitchDesktopByNumber(TargetDesktop) {
  Global CurrentDesktop, DesktopCount
  MapDesktopsFromRegistry()
  If (TargetDesktop > DesktopCount || TargetDesktop < 1) {
    OutputDebug, [invalid] target: %TargetDesktop% current: %CurrentDesktop%
    Return
  }
  While (CurrentDesktop < TargetDesktop) {
    Send ^#{Right}
    CurrentDesktop++
    OutputDebug, [right] target: %TargetDesktop% current: %CurrentDesktop%
  }
  While (CurrentDesktop > TargetDesktop) {
    Send ^#{Left}
    CurrentDesktop--
    OutputDebug, [left] target: %TargetDesktop% current: %CurrentDesktop%
  }
}

; maybe useful audio source (v2) [https://www.reddit.com/r/autohotkey/comments/156pt7i/comment/jt11b8k/]
