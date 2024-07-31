local wezterm = require "wezterm"

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Appearance
config.font = wezterm.font_with_fallback {
    "MonaspiceNe NFP",
    "Monaspace Neon",
    "Noto Sans CJK JP"
}
config.font_size = 16
config.color_scheme = "Kanagawa (Gogh)"
config.colors = {
    scrollbar_thumb = "gray"
}

-- Window
config.initial_cols = 180
config.initial_rows = 60
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.integrated_title_button_style = "Gnome"

-- Tab
config.use_fancy_tab_bar = true

-- Background
local XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME")
local wallpaper_path = XDG_CONFIG_HOME .. "/wezterm/background.png"
local wallpaper = io.open(wallpaper_path, "r")

local f = io.open(wallpaper_path)

if f ~= nil then
    isWallpaper = true
    wallpaperOpacity = 0.9
    io.close(f)
else
    isWallpaper = false
    wallpaperOpacity = 1
end

config.background = {{
    source = {
        File = wallpaper_path
    },
    hsb = {
        saturation = 0.7,
        brightness = 1
    },
},
{
    source = {
        Color = "#0b0e14"
    },
    width = "100%",
    height = "100%",
    opacity = wallpaperOpacity
}}


-- Multiplexer
config.default_prog = { "byobu" }

-- Misc.
config.enable_scroll_bar = true
config.animation_fps = 60
config.enable_wayland = true
config.window_close_confirmation = "NeverPrompt"

return config
