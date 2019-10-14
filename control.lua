require "util"

local octant_names = {
  [0] = "E", [1] = "SE", [2] = "S", [3] = "SW",
  [4] = "W", [5] = "NW", [6] = "N", [7] = "NE",
}

local function get_octant_coord(pos, origin)
  local oct_pos_x = pos.x - origin.x
  local oct_pos_y = pos.y - origin.y
  local radians = math.atan2(oct_pos_y, oct_pos_x)
  local octant = math.floor( 8 * radians / (2*math.pi) + 8.5 ) % 8
  local octant_coord = string.format("%s%d", octant_names[octant], util.distance({x=origin.x, y=origin.y}, pos))
  return octant_coord
end

local function get_cartesian_coord(pos)
  return string.format("%d,%d", pos.x, pos.y)
end



local function mz_atc_main(e)
  local tag = e.tag

  local force = e.force
  if not e.player_index then return end
  local player = game.players[e.player_index]
  if not player then return end
  if player.mod_settings["mz-atc-append-pos"].value == "off" then return end

  local surface = tag.surface
  local tag_text = tag.text
  local pos = tag.position
  local pos_text = ""

  if player.mod_settings["mz-atc-coordtype"].value == "octant" then
    pos_text = get_octant_coord(pos, {x=player.mod_settings["mz-atc-origin-x"].value, y=player.mod_settings["mz-atc-origin-y"].value})
  elseif player.mod_settings["mz-atc-coordtype"].value == "cartesian" then
    pos_text = get_cartesian_coord(pos)
  end

  if player.mod_settings["mz-atc-enclosure"].value == "()" then
    pos_text = "(" .. pos_text .. ")"
  elseif player.mod_settings["mz-atc-enclosure"].value == "[]" then
    pos_text = "[" .. pos_text .. "]"
  end

  if player.mod_settings["mz-atc-append-pos"].value == "left" then
    tag_text = pos_text .. " " .. tag_text
  elseif player.mod_settings["mz-atc-append-pos"].value == "right" then
    tag_text = tag_text .. " " .. pos_text
  end

  e.tag.text = tag_text

end

script.on_event(defines.events.on_chart_tag_added, mz_atc_main)
