# BCU TUI

A small Windows terminal interface for selecting and uninstalling several applications with [Bulk Crap Uninstaller (BCU)](https://github.com/Klocman/Bulk-Crap-Uninstaller).

## Dependency

This project does not include BCU's scanner or uninstaller. It requires a complete `BCU-console` build from BCU, including the console executable and its runtime files. The TUI invokes `BCU-console list` to read installed applications and `BCU-console uninstall` to process the selected batch.

Point `BCU_CONSOLE` at `BCU-console.exe` (or `BCU-console.dll`) if it is not beside the TUI executable or under this repository's `bin/publish` folder. Keep BCU-console's required files beside it, including its `.deps.json`, `.runtimeconfig.json`, `UninstallTools.dll`, `KlocTools.dll`, and `ObjectListView.dll`.

```powershell
$env:BCU_CONSOLE = 'C:\path\to\BCU-console.exe'
just run
```

Requires Windows, Rust, and [just](https://github.com/casey/just). Run `just` to list available commands. Build the TUI executable with:

```powershell
just build
```

## Controls

- Up/Down or `j`/`k`: move; PageUp/PageDown: jump ten apps
- Mouse wheel: scroll the view without changing the highlighted app; left-click: highlight, double-click: toggle selection
- Space: toggle app selection; Enter: review the batch; `y`: confirm
- `/`: search by app name or publisher; Up/Down and Space work in search; `c`: clear selection
- `1`/`2`/`3`: sort by name/version/publisher; `r`: reverse order
- `?` or `h`: help; `q` or Esc: quit

Apps are grouped by publisher, with the current publisher header kept visible while scrolling within a group. BCU's quiet-uninstaller option is requested where supported; some vendor uninstallers still display their own dialogs.
