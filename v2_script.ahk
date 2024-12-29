; always on top

^+SPACE::{
  WinSetAlwaysOnTop -1, "A"
}

; media keys

RAlt & Space::Send "{Media_Play_Pause}"
^!Left::Send "{Media_Prev}"
^!Right::Send "{Media_Next}"
^!M::Send "{Volume_Mute}"
RShift::Send "{Volume_Up}"
RCtrl::Send "{Volume_Down}"

; audio source
; [stolen from https://www.reddit.com/r/autohotkey/comments/156pt7i/comment/jt11b8k/]

SoundOutput(DeviceName?) {
list := _DeviceList()
        deviceId := _GetDeviceID()
        if (!IsSet(DeviceName)) {
          return LTrim(list, "`n")
        }
      if (deviceId = "") {
        MsgBox('Device "' DeviceName '" not found.`n`nCurrent devices:`n' list, "Error", 0x40010)
          return
      }
      try {
IPolicyConfig := ComObject("{870AF99C-171D-4F9E-AF0D-E63DF40C2BC9}", "{F8679F50-850A-41CF-9C72-430F290290C8}")
                 ComCall(13, IPolicyConfig, "Str", deviceId, "UInt", 0)
      } catch {
        MsgBox("SoundOutput() failed for device " DeviceName, "Error", 0x40010)
      }

      _DeviceList() { 
        static eRender := 0, STGM_READ := 0, DEVICE_STATE_ACTIVE := 1
          devices := Map()
          IMMDeviceCollection := count := IMMDevice := IPropertyStore := 0
          IMMDeviceEnumerator := ComObject("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")
          ComCall(3, IMMDeviceEnumerator, "UInt", eRender, "UInt", DEVICE_STATE_ACTIVE, "Ptr*", &IMMDeviceCollection)
          ComCall(3, IMMDeviceCollection, "UInt*", &count)
          pk := Buffer(20, 0) 
          pv := Buffer(A_PtrSize = 8 ? 24 : 16, 0) 
          loop count {
            ComCall(4, IMMDeviceCollection, "UInt", A_Index - 1, "Ptr*", &IMMDevice)
              ComCall(5, IMMDevice, "Str*", &devId)
              ComCall(4, IMMDevice, "UInt", STGM_READ, "Ptr*", &IPropertyStore)
              ObjRelease(IMMDevice)
              DllCall("ole32\CLSIDFromString", "Str", "{A45C254E-DF1C-4EFD-8020-67D146A850E0}", "Ptr", pk.Ptr) 
              NumPut("UInt", 14, pk.Ptr, 16) 
              ComCall(5, IPropertyStore, "Ptr", pk.Ptr, "Ptr", pv.Ptr)
              ObjRelease(IPropertyStore)
              pwszVal := NumGet(pv.Ptr, 8, "Ptr") 
              devName := StrGet(pwszVal)
              devices[devName] := devId
          }
        ObjRelease(IMMDeviceCollection)
          return devices
      }

      _GetDeviceID() { 
clone := list.Clone()
         list := found := ""
         for name, id in clone {
           if (IsSet(DeviceName) && InStr(name, DeviceName)) {
found := id
           }
           list .= "`n- " name
         }
       return found
      }

}

^!F1::SoundOutput("Headphones (High Definition Audio Device)")
^!F2::SoundOutput("Speakers (High Definition Audio Device)")
^!F3::SoundOutput("Headphones (Nothing ear (1) Stereo)")
