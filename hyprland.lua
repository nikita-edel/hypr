local vars = require("globals")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
	general = {
		gaps_in = 1,
		gaps_out = 2,

		border_size = 1,
		col = {
			active_border = "rgba(595959aa)",
			inactive_border = "rgba(00000000)"
		},

		resize_on_border = false,

		allow_tearing = false,
		layout = vars.LAYOUT,
	},

})

require("exec")
require("binds")
require("input")
require("monitor")
require("visual")
require("winr")
