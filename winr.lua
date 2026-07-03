local winr = hl.window_rule
local works = hl.workspace_rule

winr({ match = { class = "blueman-manager" }, float = true, size = { 800, 500 } })
winr({ match = { class = "qemu" }, float = true })

works({ workspace = 1, monitor = "DP-2", default = true })
works({ workspace = 2, monitor = "DP-1", default = true })
