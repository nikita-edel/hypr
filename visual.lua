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

hl.curve("borderFocus", {
	type = "bezier",
	points = {
		{ 0.2, 0.0 },
		{ 0.0, 1.0 },
	},
})

hl.animation({
	leaf = "border",
	enabled = true,
	speed = 10,
	bezier = "borderFocus",
})
