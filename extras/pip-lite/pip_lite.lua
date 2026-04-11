--[[

    This script adds a PiP mode to ontop (pin).
    When ontop is enabled, window is resized and moved to bottom right.
    Fit and position can be adjusted in options.

    Tested on Windows only.

    More info: https://github.com/Samillion/ModernZ/tree/main/extras/pip-lite

--]]

local options = {
    autofit = "40%x30%",
    autofit_larger = "40%x30%",
    geometry = "100%:100%",        -- pip position, bottom-right: 100%:100%
    geometry_restore = "50%:50%",  -- restore position, center: 50%:50%
    geometry_delay = 0.02          -- delay to avoid geometry race on state change
}

require 'mp.options'.read_options(options, "pip_lite")

local state = {
    pip = false,
    geometry_timer = nil,
    maximized = false,
    fullscreen = false,
    autofit = nil,
    autofit_larger = nil
}

local function cancel_geometry_timer()
    if state.geometry_timer then
        state.geometry_timer:kill()
        state.geometry_timer = nil
    end
end

-- apply geometry delay to avoid race
local function set_geometry_delay(value)
    cancel_geometry_timer()
    state.geometry_timer = mp.add_timeout(options.geometry_delay, function()
        state.geometry_timer = nil
        mp.set_property("geometry", value)
    end)
end

local function capture_state()
    state.autofit = mp.get_property("autofit")
    state.autofit_larger = mp.get_property("autofit-larger")
    state.maximized = mp.get_property_bool("window-maximized")
    state.fullscreen = mp.get_property_bool("fullscreen")
end

local function set_pip_mode()
    if state.pip or mp.get_property_bool("fullscreen") then return end

    state.pip = true
    -- un-maximize so autofit and geometry take effect
    if state.maximized then
        mp.set_property_bool("window-maximized", false)
    end

    mp.set_property("autofit", options.autofit)
    mp.set_property("autofit-larger", options.autofit_larger)
    set_geometry_delay(options.geometry)
end

-- restore window to previous state
local function restore_mode()
    if not state.pip then return end

    cancel_geometry_timer()
    mp.set_property("autofit", state.autofit or "")
    mp.set_property("autofit-larger", state.autofit_larger or "")

    local was_maximized = state.maximized
    local was_fullscreen = state.fullscreen
    state.pip = false

    state.geometry_timer = mp.add_timeout(options.geometry_delay, function()
        state.geometry_timer = nil
        mp.set_property("geometry", options.geometry_restore)

        if was_fullscreen then
            mp.set_property_bool("fullscreen", true)
        elseif was_maximized then
            mp.set_property_bool("window-maximized", true)
        end
    end)
end

local function on_ontop_change(_, value)
    if value then
        if not state.pip then
            capture_state()
        end

        if state.fullscreen then
            mp.add_timeout(0, function()
                mp.set_property_bool("fullscreen", false)
            end)
        else
            set_pip_mode()
        end
    else
        restore_mode()
    end
end

mp.observe_property("ontop", "bool", on_ontop_change)
mp.observe_property("fullscreen", "bool", function(_, fs)
    if not fs and mp.get_property_bool("ontop") then
        set_pip_mode()
    end
end)
-- ontop is already enabled when the script loads
if mp.get_property_bool("ontop") and not mp.get_property_bool("fullscreen") then
    capture_state()
    set_pip_mode()
end
