; INFO this script file only works with ahk v1

; disable caps lock
; cause caps lock is also the fn key on my keyboard
; [stolen from www.autohotkey.com/board/topic/51215-completely-disable-capslock/?p=320194]
SetCapsLockState, alwaysoff

; always on top
^+SPACE::
	WinGetTitle, activeWindow, A
	Winset, Alwaysontop, , A
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
mapDesktopsFromRegistry()
OutputDebug, [loading] desktops: %DesktopCount% current: %CurrentDesktop%

^!q::switchDesktopByNumber(1) 
^!w::switchDesktopByNumber(2) 
^!e::switchDesktopByNumber(3)
^!a::switchDesktopByNumber(4)
^!s::switchDesktopByNumber(5)
^!d::switchDesktopByNumber(6)
^!z::switchDesktopByNumber(7)
^!x::switchDesktopByNumber(8)
^!c::switchDesktopByNumber(9)

mapDesktopsFromRegistry() {
 global CurrentDesktop, DesktopCount
 IdLength := 32
 SessionId := getSessionId()
 if (SessionId) {
   RegRead, CurrentDesktopId, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\%SessionId%\VirtualDesktops, CurrentVirtualDesktop
   if (CurrentDesktopId) {
     IdLength := StrLen(CurrentDesktopId)
   }
 }
 RegRead, DesktopList, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs
 if (DesktopList) {
   DesktopListLength := StrLen(DesktopList)
   DesktopCount := DesktopListLength / IdLength
 }
 else {
   DesktopCount := 1
 }
 i := 0
 while (CurrentDesktopId and i < DesktopCount) {
   StartPos := (i * IdLength) + 1
   DesktopIter := SubStr(DesktopList, StartPos, IdLength)
   OutputDebug, The iterator is pointing at %DesktopIter% and count is %i%.
   if (DesktopIter = CurrentDesktopId) {
     CurrentDesktop := i + 1
     OutputDebug, Current desktop number is %CurrentDesktop% with an ID of %DesktopIter%.
     break
     }
     i++
   }
}
;
getSessionId() {
 ProcessId := DllCall("GetCurrentProcessId", "UInt")
 if ErrorLevel {
   OutputDebug, Error getting current process id: %ErrorLevel%
   return
 }
 OutputDebug, Current Process Id: %ProcessId%
 DllCall("ProcessIdToSessionId", "UInt", ProcessId, "UInt*", SessionId)
 if ErrorLevel {
   OutputDebug, Error getting session id: %ErrorLevel%
   return
 }
 OutputDebug, Current Session Id: %SessionId%
 return SessionId
}
;
switchDesktopByNumber(targetDesktop) {
 global CurrentDesktop, DesktopCount
 mapDesktopsFromRegistry()
 if (targetDesktop > DesktopCount || targetDesktop < 1) {
   OutputDebug, [invalid] target: %targetDesktop% current: %CurrentDesktop%
   return
 }
 while(CurrentDesktop < targetDesktop) {
   Send ^#{Right}
   CurrentDesktop++
   OutputDebug, [right] target: %targetDesktop% current: %CurrentDesktop%
 }
 while(CurrentDesktop > targetDesktop) {
   Send ^#{Left}
   CurrentDesktop--
   OutputDebug, [left] target: %targetDesktop% current: %CurrentDesktop%
 }
}

; other useful scripts (not needed for now)
; audio source (v2) [https://www.reddit.com/r/autohotkey/comments/156pt7i/comment/jt11b8k/]
