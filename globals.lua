DEVICE = {
	DESKTOP = 1,
	LAPTOP = 2,
}

-- SMBIOS chassis types: portable, laptop, notebook, sub notebook, convertible, detachable
local LAPTOP_CHASSIS = { [8] = true, [9] = true, [10] = true, [14] = true, [31] = true, [32] = true }

local function detect_device()
	local file = io.open("/sys/class/dmi/id/chassis_type")
	if not file then
		return DEVICE.DESKTOP
	end
	local chassis = file:read("n")
	file:close()
	return LAPTOP_CHASSIS[chassis] and DEVICE.LAPTOP or DEVICE.DESKTOP
end

return {
	LAYOUT = "dwindle",
	MYDEVICE = detect_device(),
}
