local reload_tech_unlock = require("script.reload-tech-unlock")
-------------------------------------------------------------------------------
local function blacklist_inserters()
	remote.call(
		"bobinserters",
		"blacklist_inserters",
		{
			"nco-wide-crane",
			"nco-wide-filter-crane",
			"nco-crane",
			"nco-filter-crane"
		}
	)
	if script.active_mods["Krastorio2"] then
		remote.call(
			"bobinserters",
			"blacklist_inserters",
			{
				"nco-superior-wide-crane",
				"nco-superior-wide-filter-crane",
				"nco-superior-crane",
				"nco-superior-filter-crane"
			}
		)
	end
end
-------------------------------------------------------------------------------
script.on_configuration_changed(
	function()
		reload_tech_unlock.reload_tech_unlock()
		if script.active_mods["bobinserters"] then
			blacklist_inserters()
		end
	end
)
-------------------------------------------------------------------------------
script.on_event(
	defines.events.on_force_created,
	function()
		reload_tech_unlock.reload_tech_unlock()
	end
)
