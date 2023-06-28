# Tile Windows Side by Side

It tiles the last two focused window side by side.

```lua
hs.loadSpoon("TileWindowsSideBySide"):bindHotkeys({
	tileLastWindowToLeft = {{"shift", "alt", "ctrl"}, "left"},
	tileLastWindowToRight = {{"shift", "alt", "ctrl"}, "right"},
})
```
