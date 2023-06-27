local state = {}

local function changeKeyboardLayout(appName, eventType)
	if (eventType == hs.application.watcher.activated) then
		local layout = state.appLayouts[appName]
		if layout then
			hs.keycodes.setLayout(layout)
		end
	end
end

return {
	name = "Auto Keyboard Layout",
	version = "1.0",
	author = "Leandro Lourenci",
	license = "MIT",
	init = function ()
		state.appWatcher = hs.application.watcher.new(changeKeyboardLayout)
	end,
	start = function(appLayouts)
		state.appLayouts = appLayouts
		state.appWatcher:start()
	end,
	stop = function()
		state.appWatcher:stop()
	end,
}
