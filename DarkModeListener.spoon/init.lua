local function appearanceIsDark()
	local _, isDark, _ = hs.osascript.applescript("tell application \"System Events\" to tell appearance preferences to return dark mode")
	return isDark
end

local state = {}

return {
	name = "Dark Mode Listener",
	version = "1.0",
	author = "Leandro Lourenci",
	license = "MIT",
	init = function ()
		state.lastUIAppearance = appearanceIsDark()
		state.listener = hs.distributednotifications.new(function()
			local currentUIAppearance = appearanceIsDark()
			if currentUIAppearance ~= state.lastUIAppearance then
				if currentUIAppearance then
						hs.alert.show("Dark mode enabled")
				else
						hs.alert.show("Light mode disabled")
				end
			end
			state.lastUIAppearance = currentUIAppearance
		end, "AppleInterfaceThemeChangedNotification")
	end,
	start = function ()
		state.listener:start()
	end
}
