return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 5,
  nextobjectid = 10,
  properties = {
    ["music"] = "future_explore",
    ["name"] = "Flashback - Resting Point"
  },
  tilesets = {
    {
      name = "hometown",
      firstgid = 1,
      filename = "../../../tilesets/hometown.tsx",
      exportfilename = "../../../tilesets/hometown.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        91, 0, 59, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 61, 0, 0,
        102, 0, 59, 60, 60, 39, 60, 60, 60, 41, 60, 60, 60, 61, 0, 0,
        113, 0, 59, 60, 60, 60, 60, 60, 60, 60, 60, 60, 40, 61, 0, 89,
        0, 51, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 61, 0, 100,
        49, 60, 60, 60, 41, 60, 60, 40, 60, 60, 60, 60, 60, 61, 0, 111,
        60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 39, 60, 60, 61, 0, 0,
        60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 61, 0, 0,
        60, 60, 60, 60, 40, 60, 60, 60, 41, 60, 60, 60, 60, 61, 0, 0,
        71, 71, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 75, 0, 0,
        0, 0, 73, 71, 71, 71, 71, 71, 71, 71, 71, 71, 75, 0, 89, 90,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 100, 101,
        0, 89, 90, 91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 111, 112
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 4,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 160,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "flashback/field_2",
            ["marker"] = "ff3"
          }
        },
        {
          id = 5,
          name = "savepoint",
          type = "",
          shape = "point",
          x = 520,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 80,
          y = -40,
          width = 480,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "flashback.chase"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 3,
          name = "ff2",
          type = "",
          shape = "point",
          x = 40,
          y = 260,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "spawn",
          type = "",
          shape = "point",
          x = 480,
          y = 280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "polygon",
          x = 0,
          y = 160,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 40, y = 0 },
            { x = 80, y = -40 },
            { x = 80, y = -160 },
            { x = 0, y = -160 }
          },
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "polygon",
          x = 0,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 80, y = 0 },
            { x = 120, y = 40 },
            { x = 480, y = 40 },
            { x = 560, y = -40 },
            { x = 560, y = -360 },
            { x = 640, y = -360 },
            { x = 640, y = 120 },
            { x = 0, y = 120 }
          },
          properties = {}
        }
      }
    }
  }
}
