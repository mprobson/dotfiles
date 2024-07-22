-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Default Dark (base16)'
  else
    return 'Default Light (base16)'
  end
end

-- from danielcooper
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- official docs
-- This is where you actually apply your config choices

-- my edits (from WezTerm docs)
-- light/dark
config.color_scheme = scheme_for_appearance(get_appearance())

-- and finally, return the configuration to wezterm
return config

-- References
-- basics: https://wezfurlong.org/wezterm/config/files.html#quick-start
-- advanced config: https://github.com/danielcopper/dotfiles/blob/arch/.config/wezterm/wezterm.lua
-- dynamic colors: https://wezfurlong.org/wezterm/config/lua/wezterm.gui/get_appearance.html
