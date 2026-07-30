local vars = require("globals")

if vars.MYDEVICE == DEVICE.DESKTOP then
	--[[ hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@144.00hz",
		position = "0x0",
		scale = "1",
	}) ]]

	hl.monitor({
		output = "DP-1",
		mode = "2560x1440@239.97Hz",
		position = "1080x0",
		scale = "1",
	})

	hl.monitor({
		output = "DP-2",
		mode = "2560x1440@240.00Hz",
		position = "3640x0",
		scale = "1",
	})
elseif vars.MYDEVICE == DEVICE.LAPTOP then
	-- TODO:
end
