return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 20,
  height = 16,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 14,
  properties = {
    ["music"] = "creepychase"
  },
  tilesets = {
    {
      name = "cliffs",
      firstgid = 1,
      filename = "../../tilesets/cliffs.tsx",
      exportfilename = "../../tilesets/cliffs.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 20,
      height = 16,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 0,
        0, 7, 8, 8, 11, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 11, 9, 0,
        0, 12, 13, 13, 13, 13, 13, 11, 13, 13, 6, 13, 13, 13, 13, 13, 13, 13, 14, 0,
        0, 12, 6, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 0,
        0, 12, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 6, 13, 13, 13, 14, 0,
        0, 12, 13, 11, 13, 13, 6, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 0,
        0, 12, 8, 8, 8, 8, 8, 8, 8, 8, 8, 11, 8, 8, 8, 8, 8, 8, 14, 0,
        3, 6, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 6, 8, 8, 3,
        13, 13, 13, 13, 13, 13, 13, 13, 11, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13,
        18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18,
        23, 23, 23, 23, 23, 10, 23, 23, 23, 23, 23, 23, 23, 23, 23, 5, 23, 10, 23, 23,
        3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
        8, 8, 11, 8, 8, 8, 8, 8, 11, 8, 8, 8, 6, 8, 8, 8, 8, 8, 8, 6,
        13, 6, 13, 13, 13, 6, 13, 13, 13, 13, 13, 13, 13, 13, 13, 11, 13, 13, 13, 13
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
          id = 8,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 360,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "chase_2",
            ["marker"] = "chase_3"
          }
        },
        {
          id = 9,
          name = "npc",
          type = "",
          shape = "point",
          x = 400,
          y = 600,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "jamm",
            ["facing"] = "right",
            ["flagcheck"] = "!future_post_looney_toons"
          }
        },
        {
          id = 10,
          name = "npc",
          type = "",
          shape = "point",
          x = -40,
          y = 600,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "fnoelle",
            ["facing"] = "right",
            ["flagcheck"] = "!future_post_looney_toons"
          }
        },
        {
          id = 13,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 360,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "chase_4",
            ["marker"] = "chase_3"
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
          id = 5,
          name = "big_flower_spawn",
          type = "",
          shape = "point",
          x = 400,
          y = 260,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "chase_2",
          type = "",
          shape = "point",
          x = 40,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "chase_4",
          type = "",
          shape = "point",
          x = 760,
          y = 400,
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
      name = "battleareas",
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
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 80,
          width = 720,
          height = 360,
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
          y = 0,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 0,
          width = 720,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 0,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 440,
          width = 800,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
