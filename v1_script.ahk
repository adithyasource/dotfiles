; disable caps lock
; cause caps lock is also the fn key on my keyboard
; [stolen from www.autohotkey.com/board/topic/51215-completely-disable-capslock/?p=320194]

SetCapsLockState, alwaysoff

; open volume mixer on win+g
; [stolen from https://www.autohotkey.com/boards/viewtopic.php?p=66433&sid=7b2f57527f13cabdb384a8219c58b673#p66433]

#g::
Run C:\Windows\System32\SndVol.exe
WinWait, ahk_exe SndVol.exe
If WinExist("ahk_exe SndVol.exe")  
WinActivate, ahk_exe SndVol.exe
Return

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

;
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
