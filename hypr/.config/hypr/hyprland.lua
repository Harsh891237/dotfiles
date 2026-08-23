-------------------------
---- REQUIRING FILES ----
-------------------------

require("bindings")


------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = "1",
})

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprland-session.target")
    hl.exec_cmd("dbus-update-activation-environment --all")
    hl.exec_cmd("sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("sleep 1 && systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("quickshell --config ~/.config/quickshell")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("[workspace 1 silent] zen-browser")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("swaync")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Papirus'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")
    hl.exec_cmd("hyprctl setcursor macOS 27")
end)

hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("COLOR_SCHEME", "prefer-dark")
hl.env("QS_ICON_THEME", "Papirus")
-- hl.env("HYPRCURSOR_THEME", "macOS")
-- hl.env("HYPRCURSOR_SIZE", "24")
-- hl.env("XCURSOR_THEME", "macOS")
-- hl.env("XCURSOR_SIZE", "24")

-- xdg specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- toolkit backends
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland,x11")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- qt
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = { enforce_permissions = true, }
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in          = 5,
        gaps_out         = 12,
        border_size      = 1,
        col              = {
            active_border   = "rgba(44474fff)",
            inactive_border = "rgba(262626ff)",
        },
        resize_on_border = false,
        allow_tearing    = false,
	layout 		 = "scrolling",
        snap             = {
            enabled = true,
        }
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        -- active_opacity   = 1.0,
        -- inactive_opacity = 1.0,

        shadow         = {
            enabled      = true,
            range        = 34,
            render_power = 5,
            offset       = "2 3",
            color        = "rgba(0, 0, 0, 0.35)",
        },

        blur           = {
            enabled           = true,
            size              = 5,
            passes            = 3,
            ignore_opacity    = true,

            noise             = 0.085,
            contrast          = 1.6,
            brightness        = 0.85,

            xray              = false,
            new_optimizations = true,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 3, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "easeOutQuint", style = "popin 92%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2.6, bezier = "easeOutQuint", style = "popin 92%" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "quick" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2.5, bezier = "almostLinear" })
hl.animation({ leaf = "layers", enabled = true, speed = 7, bezier = "easeOutQuint", style = "popin 90%" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 7, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.5, bezier = "easeOutQuint", style = "slidefadevert 30%" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
        special_scale_factor = 0.95,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
	column_width = 0.75,          -- Default column width (0.1 to 1.0)
        direction = "right",         -- Direction the tape expands ("right", "left", "up", "down")
        focus_fit_method = 1, -- How columns center when focused ("center" or "fit")
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        vrr                      = 0,
        force_default_wallpaper  = 0,
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
    },

    xwayland = {
        force_zero_scaling = false,
    }
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout      = "us",
        follow_mouse   = 1,

        sensitivity    = 0.5,
        force_no_accel = true,

        touchpad       = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Float & Size
local floating_apps = {
    { class = "^(Minecraft.*)$" },
    { class = "^(java)$",                   size = { 1250, 750 } },
    { class = "^(blueman-manager)$",        size = { 850, 650 } },
    { class = "^(nwg-look)$",               size = { 1300, 850 } },
    { title = "^(Pick a Font)$",            size = { 1000, 750 } }, -- Matches title instead of class
    { class = "^(org.gnome.Calendar)$",     size = { 1530, 860 } },
    { class = "^(xdg-desktop-portal-gtk)$", size = { 1250, 680 } },
    { class = "^(Waydroid)$",               rounding = 0 },
    { class = "^(org.gnome.Calculator)$",   size = { 580, 860 } },
    { class = "^(proton.vpn.app.gtk)$", }
}
for _, app in ipairs(floating_apps) do
    hl.window_rule({
        match    = {
            class = app.class,
            title = app.title
        },
        float    = true,
        center   = true,
        size     = app.size, -- Only applies a size rule if defined above
        rounding = app.rounding,
    })
end

-- applies no blur to windows with empty strings for class and title
hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
    },
    no_blur = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

hl.layer_rule({
    match = { namespace = "^rofi$" },
    dim_around = true,
    animation = "popin 95%",
})

hl.layer_rule({
    match = { namespace = "^logout_dialog$" },
    blur = true,
    ignore_alpha = 0.6,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/hypremoji/?.lua"
        require("hypremoji")
