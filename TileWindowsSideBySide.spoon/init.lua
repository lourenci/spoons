local M = {}

M.name = "Tile Windows Side by Side"
M.version = "1.0"
M.author = "Leandro Lourenci"
M.license = "MIT"

local function tileLastWindowLeft()
	local windows = hs.window.filter.default:getWindows()

	local lastWindow = table.remove(windows, 1)
	local secondLastWindow = table.remove(windows, 1)

	hs.layout.apply({
		{nil, lastWindow, hs.window.focusedWindow():screen(), hs.layout.left50, nil, nil},
		{nil, secondLastWindow, hs.window.focusedWindow():screen(), hs.layout.right50, nil, nil},
	})
end

local function tileLastWindowRight()
	local windows = hs.window.filter.default:getWindows()

	local lastWindow = table.remove(windows, 1)
	local secondLastWindow = table.remove(windows, 1)

	hs.layout.apply({
		{nil, lastWindow, hs.window.focusedWindow():screen(), hs.layout.right50, nil, nil},
		{nil, secondLastWindow, hs.window.focusedWindow():screen(), hs.layout.left50, nil, nil},
	})
end

function M:bindHotkeys(mapping)
	local spec = {
		tileLastWindowToLeft = tileLastWindowLeft,
		tileLastWindowToRight = tileLastWindowRight,
	}

	hs.spoons.bindHotkeysToSpec(spec, mapping)
	return self
end

return M
