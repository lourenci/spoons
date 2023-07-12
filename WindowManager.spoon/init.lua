local M = {}

M.name = "Window Manager"
M.version = "2.0"
M.author = "Leandro Lourenci"
M.license = "MIT"

local state = {}

local function windowManager(hs)
	return {
		applyLayoutToWindow = function (window, layout)
			hs.layout.apply({
				{nil, window, hs.window.focusedWindow():screen(), layout, nil, nil},
			})
		end
	}
end

local function tileLastWindowToLeft()
	local windows = hs.window.filter.default:getWindows()
	local lastWindow = table.remove(windows, 1)
	local secondlastWindow = table.remove(windows, 1)

	state.windowManager.applyLayoutToWindow(lastWindow, hs.layout.left50)
	state.windowManager.applyLayoutToWindow(secondlastWindow, hs.layout.right50)
end

local function tileLastWindowToRight()
	local windows = hs.window.filter.default:getWindows()
	local lastWindow = table.remove(windows, 1)
	local secondlastWindow = table.remove(windows, 1)

	state.windowManager.applyLayoutToWindow(lastWindow, hs.layout.right50)
	state.windowManager.applyLayoutToWindow(secondlastWindow, hs.layout.left50)
end

local function resizeLastWindowToRight()
	local windows = hs.window.filter.default:getWindows()
	local lastWindow = table.remove(windows, 1)

	state.windowManager.applyLayoutToWindow(lastWindow, hs.layout.right50)
end

local function resizeLastWindowToLeft()
	local windows = hs.window.filter.default:getWindows()
	local lastWindow = table.remove(windows, 1)

	state.windowManager.applyLayoutToWindow(lastWindow, hs.layout.left50)
end

local function maximizeLastWindow()
	local windows = hs.window.filter.default:getWindows()
	local lastWindow = table.remove(windows, 1)

	state.windowManager.applyLayoutToWindow(lastWindow, hs.layout.maximized)
end

local function centerLastWindow()
	local windows = hs.window.filter.default:getWindows()
	local lastWindow = table.remove(windows, 1)

	state.windowManager.applyLayoutToWindow(lastWindow, hs.geometry.rect(0.15, 0, 0.7, 1.0))
end

function M.init()
	state.windowManager = windowManager(hs)
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
