local var = require("globals")
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("swaync")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
	hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"')
	hl.exec_cmd("hyprctl reload")

	if var.MYDEVICE == DEVICE.DESKTOP then
		hl.exec_cmd("systemctl --user start hyprland-session.target")
	end
end)

--[[ hl.on("window.active", function(w)
	hl.notification.create({ text = "Window focused: " .. w.title, timeout = 5000, icon = "ok" })
end) ]]
