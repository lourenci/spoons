local M = {}

M.name = "Window Manager"
M.version = "2.0"
M.author = "Leandro Lourenci"
M.license = "MIT"

local function tileLastWindowToLeft()
	local windows = hs.window.filter.default:getWindows()

	local Window = table.remove(windows, 1)
	local secondWindow = table.remove(windows, 1)

	hs.layout.apply({
		{nil, Window, hs.window.focusedWindow():screen(), hs.layout.left50, nil, nil},
		{nil, secondWindow, hs.window.focusedWindow():screen(), hs.layout.right50, nil, nil},
	})
end

local function tileLastWindowToRight()
	local windows = hs.window.filter.default:getWindows()

	local Window = table.remove(windows, 1)
	local secondWindow = table.remove(windows, 1)

	hs.layout.apply({
		{nil, Window, hs.window.focusedWindow():screen(), hs.layout.right50, nil, nil},
		{nil, secondWindow, hs.window.focusedWindow():screen(), hs.layout.left50, nil, nil},
	})
end

local function resizeLastWindowToRight()
	local windows = hs.window.filter.default:getWindows()

	local Window = table.remove(windows, 1)

	hs.layout.apply({
		{nil, Window, hs.window.focusedWindow():screen(), hs.layout.right50, nil, nil},
	})
end

local function resizeLastWindowToLeft()
	local windows = hs.window.filter.default:getWindows()

	local Window = table.remove(windows, 1)

	hs.layout.apply({
		{nil, Window, hs.window.focusedWindow():screen(), hs.layout.left50, nil, nil},
	})
end

local function maximizeLastWindow()
	local windows = hs.window.filter.default:getWindows()

	local Window = table.remove(windows, 1)

	hs.layout.apply({
		{nil, Window, hs.window.focusedWindow():screen(), hs.layout.maximized, nil, nil},
	})
end

local function centerLastWindow()
	local windows = hs.window.filter.default:getWindows()

	local Window = table.remove(windows, 1)

	hs.layout.apply({
		{nil, Window, hs.window.focusedWindow():screen(), hs.geometry.rect(0.15, 0, 0.7, 1.0), nil, nil},
	})
end

function M:bindHotkeys(mapping)
	local spec = {
		tileWindowToLeft = tileLastWindowToLeft,
		tileWindowToRight = tileLastWindowToRight,
		resizeWindowToLeft = resizeLastWindowToLeft,
		resizeWindowToRight = resizeLastWindowToRight,
		maximizeWindow = maximizeLastWindow,
		centerWindow = centerLastWindow,
	}

	hs.spoons.bindHotkeysToSpec(spec, mapping)
	return self
end

return M
