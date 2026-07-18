---------------------------------------------------------------
---                   NEW HYPRLAND CONFIG                   ---
--- SINCE VERSION 0.55 CONFIGS ARE NOW PORTED TO LUA FORMAT ---
---------------------------------------------------------------


-----------------
--- VARIABLES ---
-----------------

local mainMod = "SUPER"
local terminal = "ghostty --gtk-single-instance=true"
local fileManager = "ghostty -e yazi"
local menu = "wofi --show drun"



---------------
-- MONITORS ---
---------------
hl.monitor({output = "eDP-1", mode = "3000x2000", position = "0x0", scale = 2})

--- WORK PEN SCREEN ---
hl.monitor({output = "desc:ASUSTek COMPUTER INC VP327Q", mode = "2560x1440@59.95", position = "-2560x0", scale = 1 })

--- WORK MEETING ROOM 1 ---
hl.monitor({output = "desc:Panasonic Industry Company Panasonic-TV 0x01010101", mode = "1920x1080@60", position = "-1920x0", scale = 1.2 })

--- WORK MEETING ROOM 2 ---
hl.monitor({output = "desc:Panasonic Industry Company Panasonic-TV 0x01010101", mode = "1920x1080@60", position = "-1920x0", scale = 1.5 })

--- HOME MONITOR ---
hl.monitor({output = "desc: ASUSTek COMPUTER INC PA32QCV T7LMSV009006", mode = "3008x1692@59.96700", position = "1500x0", scale = 1})

--- FALLBACK ---
hl.monitor({output = "", mode = "preferred", position = "auto", scale = "auto"})



----------------------------
-- ENVIRONMENT VARIABLES ---
----------------------------
hl.env("XCURSOR_SIZE", "12")
hl.env("HYPRCURSOR_SIZE", "12")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")
hl.env("SSH_AUTH_SOCK", os.getenv("XDG_RUNTIME_DIR") .. "/ssh-agent.sock", true)

---------------------
--- LOOK AND FEEL ---
---------------------
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 5,
    border_size = 1,
    col = {
      active_border = {
       colors = {
       "rgb(bdae93)",
       "rgb(ebdbb2)",
        },
       angle = 45,
      },
      inactive_border = "rgba(595959aa)",
    },
    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
  },
  decoration = {
    rounding = 10,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 0.75,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },
  master = {
    new_status = "master",
  },
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },
  input = {
    kb_layout = "us",
    follow_mouse = 1,
    sensitivity = 0.65,
    natural_scroll = true,
    touchpad = {
      natural_scroll = true,
    },
  },
})


------------------
--- ANIMATIONS ---
------------------
hl.curve("easeOutQuint", {
  type = "bezier",
  points = {
    {0.23, 1},
    {0.32, 1},
  },
})
hl.curve("easeInOutCubic", {
  type = "bezier",
  points = {
    {0.65, 0.05},
    {0.36, 1},
  },
})
hl.curve("linear", {
  type = "bezier",
  points = {
    {0, 0},
    {1, 1},
  },
})
hl.curve("almostLinear", {
  type = "bezier",
  points = {
    {0.5, 0.5},
    {0.75, 1},
  },
})
hl.curve("quick", {
  type = "bezier",
  points = {
    {0.15, 0},
    {0.1, 1},
  },
})

hl.animation({
  leaf = "global",
  enabled = true,
  speed = 10,
  bezier = "default",
})
hl.animation({
  leaf = "border",
  enabled = true,
  speed = 5.39,
  bezier = "easeOutQuint",
})
hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 4.79,
  bezier = "easeOutQuint",
})
hl.animation({
  leaf = "windowsIn",
  enabled = true,
  speed = 4.1,
  bezier = "easeOutQuint",
  style = "popin 87%"
})
hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 1.49,
  bezier = "linear",
  style = "popin 87%"
})
hl.animation({
  leaf = "fadeIn",
  enabled = true,
  speed = 1.73,
  bezier = "almostLinear",
})
hl.animation({
  leaf = "fadeOut",
  enabled = true,
  speed = 1.46,
  bezier = "almostLinear",
})
hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 3.03,
  bezier = "quick",
})
hl.animation({
  leaf = "layers",
  enabled = true,
  speed = 3.81,
  bezier = "easeOutQuint",
})
hl.animation({
  leaf = "layersIn",
  enabled = true,
  speed = 4,
  bezier = "easeOutQuint",
  style = "fade",
})
hl.animation({
  leaf = "layersOut",
  enabled = true,
  speed = 1.5,
  bezier = "linear",
  style = "fade",
})
hl.animation({
  leaf = "fadeLayersOut",
  enabled = true,
  speed = 1.39,
  bezier = "almostLinear",
})
hl.animation({
  leaf = "fadeLayersIn",
  enabled = true,
  speed = 1.79,
  bezier = "easeOutQuint",
})
hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 1.94,
  bezier = "almostLinear",
  style = "fade",
})
hl.animation({
  leaf = "workspacesIn",
  enabled = true,
  speed = 1.21,
  bezier = "almostLinear",
  style = "fade",
})
hl.animation({
  leaf = "workspacesOut",
  enabled = true,
  speed = 1.94,
  bezier = "almostLinear",
  style = "fade",
})



----------------
--- GESTURES ---
----------------
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})



-------------------
--- KEYBINDINGS ---
-------------------
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({action = "toggle"}))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

--- MOVE FOCUS ---
hl.bind(mainMod .. " + left", hl.dsp.focus({direction = "left"}))
hl.bind(mainMod .. " + right", hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + up", hl.dsp.focus({direction = "up"}))
hl.bind(mainMod .. " + down", hl.dsp.focus({direction = "down"}))

--- MOVE WINDOWS ---
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({direction = "left"}))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({direction = "right"}))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({direction = "up"}))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({direction = "down"}))

--- SWITCH WORKSPACES ---
for i = 1,10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
  hl.bind(mainMod .. " + SHIFT + " ..  key, hl.dsp.window.move({workspace = i}))
end

--- SPECIAL WORKSPACE (scratchpad) ---
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({workspace = "special:magic"}) )

--- SCROLL THROUGH WORKSPACES ---
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({workspace = "e+1"}))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

--- MOVE/RESIZE WITH MOUSE ---
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--- MULTEMEDIA KEYS (work when locked) ---
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--- SCREENSHOT ---
hl.bind("Print", hl.dsp.exec_cmd([[hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - - | wl-copy]]))


--- CLAMSHELL MODE ---
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("~/.local/bin/clamshell close"), { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("~/.local/bin/clamshell open"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

--- ZOOM FLOATING WINDOW RULE ---
hl.window_rule({
  match = {
    class = "zoom",
    title = "as_toolbar"
  },
  float = true
})
hl.window_rule({
  match = {
    class = "zoom",
    title = "as_toolbar"
  },
  pin = true
})
hl.window_rule({
  match = {
    class = "zoom",
    title = "as_toolbar"
  },
  border_size = 0
})



-----------------
--- AUTOSTART ---
-----------------
hl.on(
  "hyprland.start", function ()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("~/.local/bin/start-ssh-agent")
  end
)

local monitor_desc = " ASUSTek COMPUTER INC PA32QCV T7LMSV009006"
local is_home_mon_connected = false

local function set_ckb_next_state(should_run)
  if should_run and not is_home_mon_connected then
    is_home_mon_connected = true
    hl.exec_cmd("systemctl --user start ckb-next-daemon")
  elseif not should_run and is_home_mon_connected then
    is_home_mon_connected = false
    hl.exec_cmd("systemctl --user stop ckb-next-daemon")
  end
end

hl.on("monitor.added", function(mon)
  if mon.description == monitor_desc then
    set_ckb_next_state(true)
  end
end)

hl.on("monitor.removed", function(mon)
  if mon.description == monitor_desc then
    set_ckb_next_state(false)
  end
end)
hl.on("monitor.removed", function(any_mon)
    hl.exec_cmd("pkill waybar; sleep 0.5; waybar")
end)
