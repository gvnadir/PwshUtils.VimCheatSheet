# PwshUtils.VimCheatSheet

A PowerShell utility module that provides a quick-access cheat sheet for commonly used **Vim commands**, categorized by section.  
Ideal for beginners, regular users, or anyone needing a quick reminder while editing in Vim or Neovim.

---

## 📦 Module Overview

This module provides a single cmdlet:

- `Get-UtilVimCheatSheet`: Loads and displays a categorized list of Vim commands from a CSV file.

The CSV includes sections like:
- Settings
- Search
- Replace
- Navigation
- Edit
- Macro
- Clipboard

---

## 🚀 Usage

### 1. Clone and import the module

First, clone the repository (you can change the path if you use a different folder):

```powershell
git clone https://github.com/tuo-utente/PwshUtils.VimCheatSheet "$HOME\projects\PwshUtils.VimCheatSheet"
```

Make sure the path is included in your PowerShell module search path:

```powershell
$env:PSModulePath += ";$HOME\projects"
```

To make this change permanent, add that line to your PowerShell profile:

```powershell
notepad $PROFILE
```

Then import the module:

```powershell
Import-Module PwshUtils.VimCheatSheet
```

### 2. View the cheat sheet

```powershell
Get-UtilVimCheatSheet | Format-Table
```

#### Example output:

| Section   | Command                | Description                        |
|-----------|------------------------|------------------------------------|
| Settings  | :set number            | Show line numbers                  |
| Search    | / <word>               | Find word in the file              |
| Replace   | :%s/old/new/g          | Replace all in the whole file      |
| Navigation| gg                     | Go to beginning of file            |
| Edit      | dd                     | Delete line                        |

You can also filter it like:

```powershell
Get-UtilVimCheatSheet | Where-Object { $_.Section -eq 'Edit' }
```

---

## 📁 Files Included

- `VimCheatSheet.csv`: The raw data containing the commands
- `PwshUtils.VimCheatSheet.psm1`: PowerShell module script
- `PwshUtils.VimCheatSheet.psd1`: Module manifest
- `README.md`: This documentation

---

## 🔧 Features

- ✅ Categorized Vim command reference
- 🔄 Easily searchable from PowerShell
- 🧠 Great for learning and daily usage

---

## 📌 Requirements

- PowerShell 5.1 or newer
- Works cross-platform (Windows, macOS, Linux)

---

## 💡 Why I Built This

I often found myself searching Vim commands I already knew, just forgotten the syntax. This module gives me instant recall — directly in PowerShell.

---

## 📜 License

MIT License — free to use, modify, and share 😎.
