
hl.config({
	decoration = {
		rounding = 5,
		active_opacity = 1,
		inactive_opacity = 1,
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

hl.animation({ leaf = "global", enabled = true, speed = 4, bezier = "default" })
