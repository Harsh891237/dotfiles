---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal        = "kitty"
local fileManager     = "nautilus -w"
local menu            = "rofi -show drun -show-icons -icon-theme 'Papirus'"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod         = "SUPER"

local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

hl.bind(mainMod .. " + M", hl.dsp.exec_raw("hyprctl dispatch resizeactive exact 280 1000"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_raw("hyprctl dispatch resizeactive exact 1920 1080"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("hyprctl keyword decoration:screen_shader ~/.config/hypr/shaders/zoom.frag"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("hyprctl keyword decoration:screen_shader ''"))

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pkill rofi || " .. menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("hyprpicker"))
hl.bind(mainMod .. " + J", hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("wlogout"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("killactive"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("sh ~/.config/hypr/scripts/gamemode.sh"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("sh ~/.config/waybar/scripts/launch.sh"))
hl.bind(mainMod .. " + SHIFT + V",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))

hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output --clipboard-only"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("CTRL + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))


hl.bind(mainMod .. " + CTRL + mouse_up",
    hl.dsp.exec_cmd(
        "hyprctl keyword cursor:zoom_factor $(awk \"BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') + 0.5}\")"))

hl.bind(mainMod .. " + CTRL + mouse_down",
    hl.dsp.exec_cmd(
        "hyprctl keyword cursor:zoom_factor $(awk \"BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') - 0.5}\")"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces and move workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("magic"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 3%+ && ~/.config/hypr/scripts/brightness_volume_osd.sh volume"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%- && ~/.config/hypr/scripts/brightness_volume_osd.sh volume"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true })
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set +2% && ~/.config/hypr/scripts/brightness_volume_osd.sh brightness"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 2%- &&  ~/.config/hypr/scripts/brightness_volume_osd.sh brightness"),
    { locked = true, repeating = true })
