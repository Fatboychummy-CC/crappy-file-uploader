#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

Global DelayTime = 75
Global Kill = False

#MaxThreadsPerHotkey, 2
q::
  Kill = True
  SplashTextOn, 150,, Terminate called.
  Return

a::
MsgBox, 1,, Open your ComputerCraft window`, then open your editor window.
IfMsgBox, Cancel
  Return


AT(count) {
  Send, {LAlt Down}
  Loop, %count% {
    Sleep, %DelayTime%
    Send, {Tab}
  }
  sleep, %DelayTime%
  Send, {LAlt Up}
  sleep, %DelayTime%
}

COPY() {
  Send, {LCtrl Down}
  Sleep, %DelayTime%

  Send, l
  Sleep, %DelayTime%
  Send, c
  Sleep, %DelayTime%

  Send, {LCtrl Up}
  Sleep, %DelayTime%
}

PASTE() {
  Send, {LCtrl Down}
  Sleep, %DelayTime%
  
  Send, v
  Sleep, %DelayTime%

  Send {LCtrl Up}
  Sleep, %DelayTime%
}

SplashCountdown(seconds, message) {
  count = %seconds%
  Loop, %seconds% {
    SplashTextOn, 500,, %message% `(%count% seconds`).
    count -= 1
    Sleep, 1000
  }
  SplashTextOff
}

SplashCountdown(5, "Set your cursor at the top left of your code!")

Loop, 2000 {
  COPY()
  AT(1)
  PASTE()
  AT(1)
  Send, {Right}

  if (Kill) {
    MsgBox, 0,, Stopped! You can close this window.
    Break
  }
}

SplashTextOff
ExitApp