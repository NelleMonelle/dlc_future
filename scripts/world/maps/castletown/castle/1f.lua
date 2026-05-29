return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 31,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 20,
  properties = {
    ["music"] = "castletown_empty"
  },
  tilesets = {
    {
      name = "castle_town_inside",
      firstgid = 1,
      filename = "../../../tilesets/castle_town_inside.tsx"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 31,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 93, 94, 94, 94, 94, 94, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 114, 17, 18, 19, 20, 21, 137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 94, 94, 94, 94, 94, 94, 94, 95, 135, 38, 39, 40, 41, 42, 116, 93, 94, 94, 94, 94, 94, 94, 94, 0, 0, 0, 0,
        0, 0, 0, 0, 136, 13, 9, 10, 11, 12, 136, 119, 135, 59, 60, 61, 62, 63, 137, 114, 13, 14, 15, 16, 12, 136, 117, 0, 0, 0, 0,
        0, 0, 0, 0, 136, 34, 30, 31, 32, 33, 118, 137, 156, 80, 81, 82, 83, 84, 158, 135, 34, 35, 36, 37, 33, 116, 136, 0, 0, 0, 0,
        0, 0, 0, 0, 117, 136, 51, 52, 53, 139, 140, 119, 145, 104, 124, 125, 126, 104, 146, 114, 136, 56, 57, 58, 139, 140, 118, 0, 0, 0, 0,
        0, 0, 0, 0, 157, 160, 72, 73, 74, 160, 157, 161, 142, 142, 142, 142, 142, 142, 142, 159, 160, 77, 78, 79, 157, 160, 160, 0, 0, 0, 0,
        0, 0, 0, 0, 145, 104, 124, 125, 126, 104, 104, 105, 100, 142, 142, 142, 142, 142, 142, 103, 104, 124, 125, 126, 104, 104, 146, 0, 0, 0, 0,
        0, 0, 0, 0, 142, 142, 142, 142, 100, 142, 142, 142, 142, 142, 142, 142, 142, 142, 121, 142, 142, 142, 142, 142, 142, 142, 122, 0, 0, 0, 0,
        0, 0, 0, 0, 142, 100, 142, 142, 142, 142, 121, 142, 142, 142, 142, 142, 142, 100, 142, 142, 142, 142, 121, 142, 142, 142, 142, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 142, 142, 142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 142, 142, 142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          x = 680,
          y = 400,
          width = 400,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 400,
          width = 400,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1080,
          y = 240,
          width = 40,
          height = 200,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 240,
          width = 40,
          height = 200,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 200,
          width = 100,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 940,
          y = 200,
          width = 140,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 200,
          width = 100,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 340,
          y = 200,
          width = 140,
          height = 80,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 120,
          width = 360,
          height = 80,
          rotation = 0,
          opacity = 1,
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
          id = 10,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 460,
          width = 120,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["map"] = "castletown/castle/front",
            ["marker"] = "up"
          }
        },
        {
          id = 13,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 860,
          y = 230,
          width = 80,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["exit_delay"] = 0.2,
            ["map"] = "castletown/castle/dungeon",
            ["marker"] = "downleft",
            ["sound"] = "escaped"
          }
        },
        {
          id = 14,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 260,
          y = 230,
          width = 80,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["exit_delay"] = 0.2,
            ["map"] = "castletown/castle/2f",
            ["marker"] = "downleft",
            ["sound"] = "escaped"
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 240,
          width = 80,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "castletown.sign_up"
          }
        },
        {
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 960,
          y = 240,
          width = 80,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "castletown.sign_down"
          }
        },
        {
          id = 19,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 160,
          width = 120,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "castletown.centra_doorl"
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
          id = 11,
          name = "spawn",
          type = "",
          shape = "point",
          x = 620,
          y = 436,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "dungeon",
          type = "",
          shape = "point",
          x = 900,
          y = 316,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "2f",
          type = "",
          shape = "point",
          x = 300,
          y = 316,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
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
          name = "castletownnight",
          type = "",
          shape = "point",
          x = 0,
          y = 0,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
