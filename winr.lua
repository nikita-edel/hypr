local winr = hl.window_rule
local works = hl.workspace_rule
local glob = require("globals")

winr({ match = { class = "blueman-manager" }, float = true, size = { 800, 500 } })
winr({ match = { class = "qemu" }, float = true })

if glob.MYDEVICE == DEVICE.DESKTOP then
	works({ workspace = "1", monitor = "HDMI-A-2", default = true })
	works({ workspace = "2", monitor = "DP-1", default = true })
	works({ workspace = "3", monitor = "DP-2", default = true })
end
