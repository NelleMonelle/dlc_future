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
  nextlayerid = 7,
  nextobjectid = 4,
  properties = {},
  tilesets = {},
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../assets/sprites/world/maps/hometown/interior/tent.png",
      id = 2,
      name = "tent",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
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
          id = 1,
          name = "chest",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 160,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "npc",
          type = "",
          shape = "point",
          x = 420,
          y = 228,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "fmarcy",
            ["facing"] = "left"
          }
        },
        {
          id = 3,
          name = "npc",
          type = "",
          shape = "point",
          x = 220,
          y = 200,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "jamm",
            ["sprite"] = "read"
          }
        }
      }
    },
    {
      type = "imagelayer",
      image = "../../../../../assets/sprites/world/maps/hometown/interior/tent_upper.png",
      id = 5,
      name = "tent_upper",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    }
  }
}
