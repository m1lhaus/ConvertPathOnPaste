; ========================= Global settings =========================
#NoEnv                       ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force        ; Ensures only one instance of this script is running at a time
SendMode Input               ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#UseHook On                  ; Ensures that a hotkey does not trigger another one.

RunScript(command)
{
    PYTHON=c:\Miniconda3\envs\Python37\python.exe
    SCRIPT=c:\Repository\ConvertPathOnPaste\convert_path.py
    
    RunWait, %PYTHON% %SCRIPT% %command%
    Sleep, 100
    SendInput ^v
}

NormalizePath := Func("RunScript").Bind("normalize")
DoubleBackslashes := Func("RunScript").Bind("double")
ForwardBackslashes := Func("RunScript").Bind("forward")
ToCygPath := Func("RunScript").Bind("to_cygpath")
FromCygpath := Func("RunScript").Bind("from_cygpath")

Menu, PasteMenu, Add, NormalizePath, % NormalizePath
Menu, PasteMenu, Add, DoubleBackslashes, % DoubleBackslashes
Menu, PasteMenu, Add, ForwardBackslashes, % ForwardBackslashes
Menu, PasteMenu, Add, ToCygPath, % ToCygPath
Menu, PasteMenu, Add, FromCygpath, % FromCygpath

Hotkey, #+v, ShowMenu, On 
return

; action when hotkey is pressed
ShowMenu:
{
    ;show menu at current mouse position
    MouseGetPos, mX, mY
    Menu, PasteMenu, Show, %mX%, %mY%
    return
}
