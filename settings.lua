local mz_atc_append_position = {
  [1] = "off",
  [2] = "left",
  [3] = "right"
}

local mz_atc_coord_enclosure = {
  [1] = "none",
  [2] = "()",
  [3] = "[]"
}

local mz_atc_coord_type = {
  [1] = "octant",
  [2] = "cartesian"
}

data:extend
{
  {
    type = "string-setting",
    name = "mz-atc-append-pos",
    setting_type = "runtime-per-user",
    order = "a",
    allowed_values = mz_atc_append_position,
    default_value = "left"
  },
  {
    type = "string-setting",
    name = "mz-atc-enclosure",
    setting_type = "runtime-per-user",
    order = "b",
    allowed_values = mz_atc_coord_enclosure,
    default_value = "[]"
  },
  {
    type = "string-setting",
    name = "mz-atc-coordtype",
    setting_type = "runtime-per-user",
    order = "c",
    allowed_values = mz_atc_coord_type,
    default_value = "octant"
  },
  {
    type = "int-setting",
    name = "mz-atc-origin-x",
    setting_type = "runtime-per-user",
    order = "d1",
    default_value = 0
  },
  {
    type = "int-setting",
    name = "mz-atc-origin-y",
    setting_type = "runtime-per-user",
    order = "d2",
    default_value = 0
  }

}
