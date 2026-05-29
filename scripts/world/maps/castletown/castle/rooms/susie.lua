return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 13,
  properties = {
    ["music"] = "castletown_empty"
  },
  tilesets = {},
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../../assets/sprites/world/maps/castletown/susie_room.png",
      id = 2,
      name = "bg",
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
          x = 120,
          y = 406,
          width = 152,
          height = 74,
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
          x = 346,
          y = 408,
          width = 214,
          height = 72,
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
          x = 100,
          y = 160,
          width = 40,
          height = 246,
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
          y = 120,
          width = 440,
          height = 40,
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
          x = 520,
          y = 160,
          width = 40,
          height = 248,
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
      id = 4,
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
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 460,
          width = 74,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["exit_delay"] = 0.2,
            ["exit_sound"] = "doorclose",
            ["map"] = "castletown/castle/2f",
            ["marker"] = "susie",
            ["sound"] = "dooropen"
          }
        },
        {
          id = 8,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 148,
          y = 160,
          width = 92,
          height = 116,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "castletown.susie_bed",
            ["solid"] = true
          }
        },
        {
          id = 9,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 250,
          y = 160,
          width = 68,
          height = 48,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "castletown.susie_fridge",
            ["solid"] = true
          }
        },
        {
          id = 10,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 354,
          y = 160,
          width = 78,
          height = 38,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "castletown.susie_shelf",
            ["solid"] = true
          }
        },
        {
          id = 11,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 434,
          y = 160,
          width = 62,
          height = 38,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["cutscene"] = "castletown.susie_wardrobe",
            ["solid"] = true
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
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
          id = 6,
          name = "spawn",
          type = "",
          shape = "point",
          x = 310,
          y = 438,
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
          id = 12,
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
