return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 8,
  nextobjectid = 27,
  properties = {
    ["music"] = "future_world"
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
      width = 30,
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
        0, 0, 0, 79, 30, 80, 80, 80, 80, 80, 194, 80, 80, 30, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 81, 0, 0, 0,
        0, 0, 0, 79, 80, 80, 31, 80, 80, 80, 69, 70, 70, 70, 70, 70, 70, 70, 71, 80, 80, 80, 80, 80, 80, 30, 81, 0, 0, 0,
        0, 0, 0, 79, 80, 80, 80, 80, 80, 80, 69, 70, 71, 80, 80, 80, 30, 80, 72, 194, 80, 80, 31, 80, 80, 80, 81, 0, 0, 0,
        0, 0, 0, 79, 80, 80, 194, 80, 80, 30, 95, 96, 97, 194, 80, 80, 80, 80, 72, 80, 80, 80, 80, 80, 194, 80, 195, 0, 0, 0,
        0, 0, 0, 79, 80, 30, 80, 80, 80, 80, 80, 80, 80, 80, 30, 80, 69, 96, 96, 96, 96, 96, 96, 70, 70, 71, 81, 0, 0, 0,
        0, 0, 0, 79, 80, 80, 80, 80, 80, 80, 80, 194, 80, 80, 80, 80, 69, 70, 71, 80, 194, 80, 80, 72, 80, 72, 81, 0, 0, 0,
        0, 0, 0, 79, 72, 80, 30, 69, 70, 70, 70, 70, 71, 80, 80, 80, 80, 80, 30, 69, 70, 70, 70, 71, 80, 72, 81, 0, 0, 0,
        0, 0, 0, 92, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 94, 0, 0, 0,
        0, 0, 0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 0, 0, 0,
        0, 0, 0, 14, 15, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 32, 16, 0, 0, 0,
        0, 0, 0, 14, 15, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 15, 16, 0, 0, 0,
        0, 0, 0, 14, 32, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 15, 16, 0, 0, 0
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
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 1200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 320,
          width = 720,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 320,
          width = 120,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1080,
          y = 320,
          width = 120,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
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
          id = 6,
          name = "climbentry",
          type = "",
          shape = "rectangle",
          x = 1000,
          y = 280,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["area"] = { id = 8 }
          }
        },
        {
          id = 7,
          name = "climbentry",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 280,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["area"] = { id = 9 }
          }
        },
        {
          id = 8,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 1000,
          y = 160,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 160,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 720,
          y = 80,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 200,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 920,
          y = 160,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 240,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 240,
          width = 40,
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
          x = 400,
          y = 40,
          width = 360,
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
          x = 400,
          y = 80,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "climbareaslip",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 120,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "climbareaslip",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 160,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 480,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "hub_passage_3",
            ["marker"] = "passageway_4"
          }
        },
        {
          id = 23,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 920,
          y = 200,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "climbarea",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 240,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 480,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "hub_passage_5",
            ["marker"] = "passageway_4"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
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
          id = 20,
          name = "passageway_3",
          type = "",
          shape = "point",
          x = 1020,
          y = 440,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "passageway_5",
          type = "",
          shape = "point",
          x = 180,
          y = 440,
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
      id = 7,
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
          id = 19,
          name = "darkness",
          type = "",
          shape = "point",
          x = 1160,
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
