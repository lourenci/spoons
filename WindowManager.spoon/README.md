# Tile Windows Side by Side

It tiles the last two focused window side by side.

```lua
hs.loadSpoon("WindowManager"):bindHotkeys({
	tileWindowToLeft = {{"shift", "option", "ctrl"}, "left"},
	tileWindowToRight = {{"shift", "option", "ctrl"}, "right"},
    resizeWindowToLeft = {{"shift", "option", "ctrl", "command"}, "left"},
    resizeWindowToRight= {{"shift", "option", "ctrl", "command"}, "right"},
	maximizeWindow = {{"shift", "option", "ctrl"}, "up"},
	centerWindow = {{"shift", "option", "ctrl"}, "down"},
})
```
