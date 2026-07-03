local vars = require("globals")

if vars.MYDEVICE == DEVICE.DESKTOP then
	hl.monitor({
		output = "DP-2",
		mode = "2560x1440@240.00Hz",
		position = "1920x0",
		scale = "1",
	})

	hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@144.00hz",
		position = "4480x0",
		scale = "1",
	})

	--[[ hl.monitor({
		output = "DP-1",
		mode = "1920x1080@144.00Hz",
		position = "4480x0",
		scale = "1"
	}) ]]
elseif vars.MYDEVICE == DEVICE.LAPTOP then
	hl.monitor({
		output = "",
		mode = "highrr",
		position = "auto",
		scale = "1"
	})

	hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@60Hz",
		position = "auto",
		scale = "1",
		mirror = "eDP-1",
	})
end
