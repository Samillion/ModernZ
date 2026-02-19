--[[

    This script adds a PiP mode to ontop (pin).
    When ontop is enabled, window is resized and moved to bottom right.
    Fit and position can by adjusted in options.
    
    Tested on Windows only.

    More info: https://github.com/Samillion/ModernZ/tree/main/extras/pip-lite

--]]

local options = {
    autofit = "40%x30%",
    autofit_larger = "40%x30%",
    geometry = "100%:100%",        -- bottom-right: -0-0 or 100%:100%
    geometry_restore = "50%:50%",  -- center: 50%:50%
    geometry_delay = 0.02          -- geo delay time to avoid race
}

require 'mp.options'.read_options(options, "pip_lite")

local state = {
    pip = false,
    geometry_timer = nil
}

local function set_geometry_delay(value)
    -- kill active timer if it exists
    if state.geometry_timer then
        state.geometry_timer:kill()
        state.geometry_timer = nil
    end

    state.geometry_timer = mp.add_timeout(options.geometry_delay, function()
        mp.set_property("geometry", value)
        state.geometry_timer = nil
    end)
end

local function set_pip_mode()
    if mp.get_property_bool("fullscreen") then
        return
    end

    if not state.pip then
        state.autofit = mp.get_property("autofit")
        state.autofit_larger = mp.get_property("autofit-larger")
        state.pip = true
    end

    mp.set_property("autofit", options.autofit)
    mp.set_property("autofit-larger", options.autofit_larger)
    set_geometry_delay(options.geometry)
end

local function restore_mode()
    if not state.pip then return end

    mp.set_property("autofit",  state.autofit or "")
    mp.set_property("autofit-larger", state.autofit_larger or "")
    set_geometry_delay(options.geometry_restore)

    state.pip = false
end

local function on_ontop_change(_, value)
    if value then
        set_pip_mode()
    else
        restore_mode()
    end
end

mp.observe_property("ontop", "bool", on_ontop_change)

-- set pip if leaving fullscreen with ontop enabled
mp.observe_property("fullscreen", "bool", function(_, fs)
    if not fs and mp.get_property_bool("ontop") then
        set_pip_mode()
    end
end)

-- startup ontop handler
if mp.get_property_bool("ontop") and not mp.get_property_bool("fullscreen") then
    set_pip_mode()
end
