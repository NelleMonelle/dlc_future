return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 24,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 20,
  properties = {
    ["music"] = "future_world",
    ["name"] = "Ruined Hub - The Tower"
  },
  tilesets = {
    {
      name = "main_area",
      firstgid = 1,
      filename = "../../tilesets/main_area.tsx",
      exportfilename = "../../tilesets/main_area.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 24,
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
        0, 0, 79, 80, 69, 70, 71, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 81, 14, 15, 16, 0, 0,
        0, 0, 79, 80, 69, 70, 71, 80, 80, 80, 30, 80, 80, 80, 80, 80, 80, 80, 81, 14, 32, 16, 0, 0,
        0, 0, 79, 80, 69, 70, 71, 80, 80, 69, 70, 71, 80, 80, 69, 70, 71, 30, 81, 14, 15, 16, 0, 0,
        0, 0, 79, 30, 80, 80, 80, 80, 194, 80, 80, 80, 80, 80, 80, 80, 72, 80, 195, 14, 15, 16, 0, 0,
        0, 0, 79, 80, 80, 80, 80, 115, 116, 80, 80, 80, 80, 31, 80, 80, 72, 80, 81, 14, 15, 16, 0, 0,
        0, 0, 206, 93, 93, 207, 93, 128, 129, 93, 207, 207, 93, 93, 93, 207, 93, 93, 208, 14, 32, 16, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 2, 2, 2, 2, 15, 15, 15, 3, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 15, 32, 15, 15, 32, 15, 15, 16, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 15, 15, 15, 15, 15, 15, 32, 16, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 32, 15, 15, 15, 15, 15, 15, 16, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 27, 28, 28, 28, 28, 28, 28, 28, 29, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
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
          shape = "rectangle",
          x = 880,
          y = 0,
          width = 80,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 920,
          y = 240,
          width = 40,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 440,
          width = 360,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 200,
          width = 40,
          height = 280,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 200,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 0,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
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
          id = 7,
          name = "climbentry",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["area"] = { id = 8 }
          }
        },
        {
          id = 8,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 120,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 80,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 80,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 160,
          y = -40,
          width = 120,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 160,
          y = -40,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "hub_tower",
            ["marker"] = "passageway_5"
          }
        },
        {
          id = 15,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 760,
          y = -40,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "hub_passage_4",
            ["marker"] = "passageway_5"
          }
        },
        {
          id = 19,
          name = "savepoint",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 240,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* The long climb looms before you..."
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 13,
          name = "hub_tower",
          type = "",
          shape = "point",
          x = 220,
          y = 40,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "passageway_4",
          type = "",
          shape = "point",
          x = 820,
          y = 40,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "spawn",
          type = "",
          shape = "point",
          x = 740,
          y = 360,
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
      id = 6,
      name = "controllers",
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
          id = 16,
          name = "darkness",
          type = "",
          shape = "point",
          x = 920,
          y = 40,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["alpha"] = 1,
            ["characters"] = "jamm"
          }
        }
      }
    }
  }
}
