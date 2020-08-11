# Convert Path On Paste (ctrl+v)

Small python script that can convert a path stored in your clipboard, e.g. convert '\' to '/' for Windows paths on paste.

## Supported commands

- **normalize** - normalizes Windows path (e.g. from `C:\\Windows\System32\\` to `C:\Windows\System32`)
- **double** - doubles backslashes in Windows path (e.g. from `C:\\Windows/System32/` to `C:\\Windows\\System32`)
- **forward** - converts path to forward slashes (e.g. from `C:\\Windows\\System32\` to `C:/Windows/System32`)
- **to_cygwin** - converts path from Windows filepath format to Cygwin format (e.g. from `C:\Windows\System32\` to `/cygdrive/c/Windows/System32/`)
- **from_cygwin** - converts path from Cygwin filepath format to Windows format (e.g. from `/cygdrive/c/Windows/System32/` to `C:\Windows\System32\`)

## Example

### Simple

1. copy some path to your clipboard using Ctrl+C
2. call `python convert_path.py %COMMAND%`
3. paste edited filepath from your clipboard using Ctrl+V


### Using AutoHotkey

With `PasteMenu.ahk` script, [Autohotkey](https://www.autohotkey.com/) can show simple [popup GUI menu](https://www.autohotkey.com/docs/commands/Menu.htm#Remarks) that gets triggered on custom shortcut (in this case Win+Shift+V). You would then select an action and the rest is automated.  
 
### Requirements

- Python 3+
- [pyperclip](https://pypi.org/project/pyperclip/)


