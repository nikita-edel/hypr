local hl = hl
local vars = require("hyprglobals")

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local mouse4 = "mouse:275" --BTN_SIDE
local mouse5 = "mouse:276" --BTN_EXTRA

local lmb = "mouse:272" --BTN_LEFT
local rmb = "mouse:273" --BTN_RIGHT

local toRotate = "DP-2" --screen to rotate with mod shift up/down

local audioInc = "5%" --steps in which to increment volume with built in audio keys
local brightInc = "10%" --for brightness
local resizeInc = 30 --for resizing window

local terminal = "kitty"
-- local filemanager = "dolphin"
local menu = "wofi --show drun"

local bind = hl.bind
local dsp = hl.dsp

bind(mainMod .. " + F", dsp.exec_cmd(terminal))
bind(mainMod .. " + C", dsp.window.kill())
bind(mainMod .. " + O", dsp.window.fullscreen())
bind(mainMod .. " + V", dsp.window.float({ action = "toggle" }))
bind(mainMod .. " + SPACE", dsp.exec_cmd(menu))

if (vars.LAYOUT == "dwindle") then
	bind(mainMod .. " + R", dsp.layout("togglesplit"))

elseif (vars.LAYOUT == "master") then
	bind(mainMod .. " + R", dsp.layout("orientationnext"))
	bind(mainMod .. " + SHIFT + R", dsp.layout("orientationprev"))
end

bind(mainMod .. " + B", dsp.exec_cmd("pkill -x waybar || waybar &"))

bind(mainMod .. " + SHIFT + UP", dsp.exec_cmd("hyprctl keyword monitor " .. toRotate .. ", preferred, auto, 1, transform, 1"))
bind(mainMod .. " + SHIFT + DOWN", dsp.exec_cmd("hyprctl keyword monitor " .. toRotate .. ", preferred, auto, 1, transform, 0"))

bind(mainMod .. " + equal", dsp.exec_cmd("brightnessctl set +10%"))
bind(mainMod .. " + minus", dsp.exec_cmd("brightnessctl set 10%-"))

bind(mainMod .. " + SHIFT + A", dsp.exec_cmd("hyprshot -m region"))
bind(mainMod .. " + SHIFT + S", dsp.exec_cmd("hyprshot -m region --clipboard-only"))

--move swap windows
bind(mainMod .. " + SHIFT + H", dsp.window.move({ direction = "left"}))
bind(mainMod .. " + SHIFT + L", dsp.window.move({ direction = "right"}))
bind(mainMod .. " + SHIFT + J", dsp.window.move({ direction = "down"}))
bind(mainMod .. " + SHIFT + K", dsp.window.move({ direction = "up"}))

-- Move focus with mainMod + arrow keys
bind(mainMod .. " + H", dsp.focus({ direction = "l" }))
bind(mainMod .. " + L", dsp.focus({ direction = "r" }))
bind(mainMod .. " + K", dsp.focus({ direction = "u" }))
bind(mainMod .. " + J", dsp.focus({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

bind(mainMod .. " + SHIFT + F10", dsp.exec_cmd("hyprctl reload"))

bind(mainMod .. " + slash", dsp.window.resize({ x = resizeInc, y = 0, relative = true }), { repeating = true, locked = true })
bind(mainMod .. " + M", dsp.window.resize({ x = -resizeInc, y = 0, relative = true }), { repeating = true, locked = true })
bind(mainMod .. " + comma", dsp.window.resize({ x = 0, y = resizeInc, relative = true }), { repeating = true, locked = true })
bind(mainMod .. " + period", dsp.window.resize({ x = 0, y = -resizeInc, relative = true }), { repeating = true, locked = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
-- (first 2 with mousebuttons)
bind(mainMod .. " + " .. lmb, dsp.window.drag(), { mouse = true })
bind(mainMod .. " + " .. rmb, dsp.window.resize(), { mouse = true })

bind(mouse4, dsp.window.drag(), { mouse = true })
bind(mouse5, dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
bind("XF86MonBrightnessUp", dsp.exec_cmd("brightnessctl s " .. brightInc .. "+"), { repeating = true, locked = true })
bind("XF86MonBrightnessDown", dsp.exec_cmd("brightnessctl s " .. brightInc .. "-"), { repeating = true, locked = true })
bind("XF86AudioRaiseVolume", dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +" .. audioInc), { repeating = true, locked = true })
bind("XF86AudioLowerVolume", dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -" .. audioInc), { repeating = true, locked = true })
